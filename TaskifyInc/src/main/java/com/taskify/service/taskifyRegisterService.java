package com.taskify.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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

    public String registerUserandMember(userModel userdata, memberModel memberdata, profileModel profiledata) {
        // Check if the user exists (by username, email, or contact number)
        String checkUserQuery = "SELECT u.User_Name, m.Member_Email, m.Member_ContactNumber " +
                "FROM users u JOIN members m ON u.User_ID = m.User_ID " +
                "WHERE u.User_Name = ? OR m.Member_Email = ? OR m.Member_ContactNumber = ?";

        // Insert queries for each table
        String userInsertQuery = "INSERT INTO users (User_Name, User_Password) VALUES (?, ?)";
        String memberInsertQuery = "INSERT INTO members (Member_FirstName, Member_LastName, Member_DOB, Member_Gender, Member_Email, Member_ContactNumber, User_ID) VALUES (?, ?, ?, ?, ?, ?, ?)";
        String profileInsertQuery = "INSERT INTO profiles (Profile_Occupation,Profile_Description, Display_Picture, Achievements, Experience) VALUES (?, ?, ?, ?,?)";
        String userMemberProfileInsertQuery = "INSERT INTO users_members_profiles (User_ID, Member_ID, Profile_ID) VALUES (?, ?, ?)";

        try (
                PreparedStatement checkStmt = dbConn.prepareStatement(checkUserQuery);
                PreparedStatement insertUserStmt = dbConn.prepareStatement(userInsertQuery, PreparedStatement.RETURN_GENERATED_KEYS);
                PreparedStatement insertMemberStmt = dbConn.prepareStatement(memberInsertQuery, PreparedStatement.RETURN_GENERATED_KEYS);
                PreparedStatement insertProfileStmt = dbConn.prepareStatement(profileInsertQuery, PreparedStatement.RETURN_GENERATED_KEYS);
                PreparedStatement insertUserMemberProfileStmt = dbConn.prepareStatement(userMemberProfileInsertQuery)
        ) {
            // Step 1: Check if user already exists (by username, email, or contact number)
            checkStmt.setString(1, userdata.getusername());
            checkStmt.setString(2, memberdata.getEmail());
            checkStmt.setString(3, memberdata.getPhonenumber());

            ResultSet rs = checkStmt.executeQuery();
            if (rs.next()) {
                // A user with the same username, email or contact already exists
                return "exists";
            }

         // Step 2: Encrypt password and insert user
            String encryptedPassword = PasswordUtil.encrypt(userdata.getusername(), userdata.getpassword());
            if (encryptedPassword == null) {
                throw new RuntimeException("Password encryption failed");
            }

            insertUserStmt.setString(1, userdata.getusername());
            insertUserStmt.setString(2, encryptedPassword);


            int rowsAffected = insertUserStmt.executeUpdate();
            if (rowsAffected > 0) {
                ResultSet generatedKeys = insertUserStmt.getGeneratedKeys();
                if (generatedKeys.next()) {
                    int userId = generatedKeys.getInt(1); // Generated User_ID

                    // Step 3: Insert the member into the members table
                    insertMemberStmt.setString(1, memberdata.getFirstName());
                    insertMemberStmt.setString(2, memberdata.getLastName());
                    insertMemberStmt.setDate(3, Date.valueOf(memberdata.getDob())); // Convert LocalDate to java.sql.Date
                    insertMemberStmt.setString(4, memberdata.getGender());
                    insertMemberStmt.setString(5, memberdata.getEmail());
                    insertMemberStmt.setString(6, memberdata.getPhonenumber());
                    insertMemberStmt.setInt(7, userId); // Set the User_ID as the foreign key

                    int memberRowsAffected = insertMemberStmt.executeUpdate();
                    if (memberRowsAffected > 0) {
                        // Retrieve the generated member_id for the member
                        ResultSet memberGeneratedKeys = insertMemberStmt.getGeneratedKeys();
                        if (memberGeneratedKeys.next()) {
                            int memberId = memberGeneratedKeys.getInt(1); // Generated Member_ID

                            // Step 4: Insert the profile into the profiles table
                            insertProfileStmt.setString(1,profiledata.getOccupation());
                            insertProfileStmt.setString(2, profiledata.getProfileDescription());
                            insertProfileStmt.setString(3, profiledata.getDisplayPicture());
                            insertProfileStmt.setString(4, profiledata.getAchievements());
                            insertProfileStmt.setString(5, profiledata.getExperience());
                            
                            System.out.println(insertProfileStmt);

                            int profileRowsAffected = insertProfileStmt.executeUpdate();
                            if (profileRowsAffected > 0) {
                                // Retrieve the generated profile_id for the profile
                                ResultSet profileGeneratedKeys = insertProfileStmt.getGeneratedKeys();
                                if (profileGeneratedKeys.next()) {
                                    int profileId = profileGeneratedKeys.getInt(1); // Generated Profile_ID

                                    // Step 5: Insert the data into the users_members_profiles table
                                    insertUserMemberProfileStmt.setInt(1, userId);
                                    insertUserMemberProfileStmt.setInt(2, memberId);
                                    insertUserMemberProfileStmt.setInt(3, profileId);

                                    int userMemberProfileRowsAffected = insertUserMemberProfileStmt.executeUpdate();
                                    if (userMemberProfileRowsAffected > 0) {
                                        // Successfully inserted into all tables, including users_members_profiles
                                        return "success";
                                    } else {
                                        System.err.println("Failed to insert into users_members_profiles.");
                                    }
                                }
                            }
                        }
                    }
                }
            }
        } catch (SQLException e) {
            System.err.println("Error during database operation: " + e.getMessage());
            e.printStackTrace();
        }

        return "failed";
    }
}
