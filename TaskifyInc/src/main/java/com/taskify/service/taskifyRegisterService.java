package com.taskify.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import com.taskify.model.memberModel;
import com.taskify.model.profileModel;
import com.taskify.model.userModel;
import com.taskify.util.PasswordUtil;
import com.taskify.config.TaskifyDBconfig;

public class taskifyRegisterService {
    private Connection dbConn;

    public taskifyRegisterService() {
        try {
            this.dbConn = TaskifyDBconfig.getDbConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            System.err.println("Database connection error: " + ex.getMessage());
            ex.printStackTrace();
        }
    }

    public Map<String, Integer> registerUserandMember(userModel userdata, memberModel memberdata) {
        Map<String, Integer> generatedKeysMap = new HashMap<>();

        String checkUserQuery = "SELECT u.User_Name, m.Member_Email, m.Member_ContactNumber " +
                "FROM users u JOIN members m ON u.User_ID = m.User_ID " +
                "WHERE u.User_Name = ? OR m.Member_Email = ? OR m.Member_ContactNumber = ?";

        String userInsertQuery = "INSERT INTO users (User_Name, User_Password) VALUES (?, ?)";
        String memberInsertQuery = "INSERT INTO members (Member_FirstName, Member_LastName, Member_DOB, Member_Gender, Member_Email, Member_ContactNumber, User_ID) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (
            PreparedStatement checkStmt = dbConn.prepareStatement(checkUserQuery);
            PreparedStatement insertUserStmt = dbConn.prepareStatement(userInsertQuery, PreparedStatement.RETURN_GENERATED_KEYS);
            PreparedStatement insertMemberStmt = dbConn.prepareStatement(memberInsertQuery, PreparedStatement.RETURN_GENERATED_KEYS);
        ) {
            checkStmt.setString(1, userdata.getusername());
            checkStmt.setString(2, memberdata.getEmail());
            checkStmt.setString(3, memberdata.getPhonenumber());

            ResultSet rs = checkStmt.executeQuery();
            if (rs.next()) {
                return null; // or throw an exception if needed
            }

            String encryptedPassword = PasswordUtil.encrypt(userdata.getusername(), userdata.getpassword());
            if (encryptedPassword == null) {
                throw new RuntimeException("Password encryption failed");
            }

            insertUserStmt.setString(1, userdata.getusername());
            insertUserStmt.setString(2, encryptedPassword);

            int userRowsAffected = insertUserStmt.executeUpdate();
            if (userRowsAffected > 0) {
                ResultSet userKeys = insertUserStmt.getGeneratedKeys();
                if (userKeys.next()) {
                    int userId = userKeys.getInt(1);
                    generatedKeysMap.put("userId", userId);

                    insertMemberStmt.setString(1, memberdata.getFirstName());
                    insertMemberStmt.setString(2, memberdata.getLastName());
                    insertMemberStmt.setDate(3, Date.valueOf(memberdata.getDob()));
                    insertMemberStmt.setString(4, memberdata.getGender());
                    insertMemberStmt.setString(5, memberdata.getEmail());
                    insertMemberStmt.setString(6, memberdata.getPhonenumber());
                    insertMemberStmt.setInt(7, userId);

                    int memberRowsAffected = insertMemberStmt.executeUpdate();
                    if (memberRowsAffected > 0) {
                        ResultSet memberKeys = insertMemberStmt.getGeneratedKeys();
                        if (memberKeys.next()) {
                            int memberId = memberKeys.getInt(1);
                            generatedKeysMap.put("memberId", memberId);
                            return generatedKeysMap;
                        }
                    }
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null; // Or throw an exception for failure
    }

}
