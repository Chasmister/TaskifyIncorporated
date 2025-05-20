package com.taskify.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import com.taskify.model.memberModel;
import com.taskify.model.userModel;
import com.taskify.util.PasswordUtil;
import com.taskify.config.TaskifyDBconfig;

public class taskifyRegisterService {

    private Connection dbConn;

    public taskifyRegisterService() {
        try {
            this.dbConn = TaskifyDBconfig.getDbConnection();
            this.dbConn.setAutoCommit(false); // Enable manual transaction control
        } catch (SQLException | ClassNotFoundException ex) {
            System.err.println("Database connection error: " + ex.getMessage());
            ex.printStackTrace();
        }
    }

    public Map<String, Integer> registerUserandMember(userModel userdata, memberModel memberdata) {
        Map<String, Integer> generatedKeysMap = new HashMap<>();

        String checkUserQuery = """
          SELECT u.User_Name, m.Member_Email, m.Member_ContactNumber 
FROM users u 
JOIN users_members um ON u.User_ID = um.user_id 
JOIN members m ON um.member_id = m.Member_ID
WHERE u.User_Name = ? OR m.Member_Email = ? OR m.Member_ContactNumber = ?""";


        String userInsertQuery = "INSERT INTO users (User_Name, User_Password) VALUES (?, ?)";
        String memberInsertQuery = """
                INSERT INTO members 
                (Member_FirstName, Member_LastName, Member_DOB, Member_Gender, Member_Email, Member_ContactNumber)
                VALUES (?, ?, ?, ?, ?, ?)
                """;
        String userMemberInsertQuery = "INSERT INTO users_members (user_id, member_id) VALUES (?, ?)";

        try (
            PreparedStatement checkStmt = dbConn.prepareStatement(checkUserQuery);
            PreparedStatement insertUserStmt = dbConn.prepareStatement(userInsertQuery, PreparedStatement.RETURN_GENERATED_KEYS);
            PreparedStatement insertMemberStmt = dbConn.prepareStatement(memberInsertQuery, PreparedStatement.RETURN_GENERATED_KEYS);
            PreparedStatement insertUserMemberStmt = dbConn.prepareStatement(userMemberInsertQuery)
        ) {
            // Check if username, email or phone already exist
            checkStmt.setString(1, userdata.getusername());
            checkStmt.setString(2, memberdata.getEmail());
            checkStmt.setString(3, memberdata.getPhonenumber());

            ResultSet rs = checkStmt.executeQuery();
            if (rs.next()) {
                System.out.println("User already exists with provided username, email, or phone.");
                return null;
            }

            // Encrypt password
            String encryptedPassword = PasswordUtil.encrypt(userdata.getusername(), userdata.getpassword());
            if (encryptedPassword == null) {
                throw new RuntimeException("Password encryption failed.");
            }

            // Insert into users table
            insertUserStmt.setString(1, userdata.getusername());
            insertUserStmt.setString(2, encryptedPassword);
            int userRowsAffected = insertUserStmt.executeUpdate();

            if (userRowsAffected > 0) {
                try (ResultSet userKeys = insertUserStmt.getGeneratedKeys()) {
                    if (userKeys.next()) {
                        int userId = userKeys.getInt(1);
                        generatedKeysMap.put("userId", userId);

                        // Insert into members table
                        insertMemberStmt.setString(1, memberdata.getFirstName());
                        insertMemberStmt.setString(2, memberdata.getLastName());
                        insertMemberStmt.setDate(3, Date.valueOf(memberdata.getDob()));
                        insertMemberStmt.setString(4, memberdata.getGender());
                        insertMemberStmt.setString(5, memberdata.getEmail());
                        insertMemberStmt.setString(6, memberdata.getPhonenumber());
                       
                        int memberRowsAffected = insertMemberStmt.executeUpdate();
                        if (memberRowsAffected > 0) {
                            try (ResultSet memberKeys = insertMemberStmt.getGeneratedKeys()) {
                                if (memberKeys.next()) {
                                    int memberId = memberKeys.getInt(1);
                                    generatedKeysMap.put("memberId", memberId);

                                    // Insert into users_members table
                                    insertUserMemberStmt.setInt(1, userId);
                                    insertUserMemberStmt.setInt(2, memberId);
                                    int linkRowsAffected = insertUserMemberStmt.executeUpdate();

                                    if (linkRowsAffected > 0) {
                                        dbConn.commit(); // Commit all 3 successful inserts
                                        return generatedKeysMap;
                                    } else {
                                        dbConn.rollback();
                                        System.err.println("Failed to insert into users_members table.");
                                    }
                                }
                            }
                        } else {
                            dbConn.rollback();
                            System.err.println("Failed to insert into members table.");
                        }
                    }
                }
            } else {
                dbConn.rollback();
                System.err.println("Failed to insert into users table.");
            }

        } catch (SQLException e) {
            try {
                if (dbConn != null) dbConn.rollback();
            } catch (SQLException rollbackEx) {
                System.err.println("Rollback failed: " + rollbackEx.getMessage());
            }
            e.printStackTrace();
        }

        return null; // Return null if any step failed
    }
}