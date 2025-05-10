package com.taskify.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.taskify.model.userModel;
import com.taskify.model.adminModel;
import com.taskify.util.PasswordUtil;
import com.taskify.config.TaskifyDBconfig;

public class AdminRegisterService {
    private static Connection dbConn;

    public AdminRegisterService() {
        try {
            this.dbConn = TaskifyDBconfig.getDbConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            System.err.println("Database connection error: " + ex.getMessage());
            ex.printStackTrace();
        }
    }

    public static String registerAdmin(userModel userData, adminModel adminData) {
        String checkQuery = "SELECT u.User_Name, a.Email FROM users u JOIN admins a ON u.User_ID = a.User_ID WHERE u.User_Name = ? OR a.Email = ?";
        String userInsertQuery = "INSERT INTO users (User_Name, User_Password, User_Type) VALUES (?, ?, ?)";
        String adminInsertQuery = "INSERT INTO admins (First_Name, Last_Name, Email, Password, User_ID) VALUES (?, ?, ?, ?, ?)";

        try (
            PreparedStatement checkStmt = dbConn.prepareStatement(checkQuery);
            PreparedStatement insertUserStmt = dbConn.prepareStatement(userInsertQuery, PreparedStatement.RETURN_GENERATED_KEYS);
            PreparedStatement insertAdminStmt = dbConn.prepareStatement(adminInsertQuery)
        ) {
            // Step 1: Check if admin (user or email) already exists
            checkStmt.setString(1, userData.getusername());
            checkStmt.setString(2, adminData.getEmail());

            ResultSet rs = checkStmt.executeQuery();
            if (rs.next()) {
                return "exists";
            }

            // Step 2: Encrypt password and insert into users
            String encryptedPassword = PasswordUtil.encrypt(userData.getusername(), userData.getpassword());
            if (encryptedPassword == null) {
                throw new RuntimeException("Password encryption failed");
            }

            insertUserStmt.setString(1, userData.getusername());
            insertUserStmt.setString(2, encryptedPassword);
            insertUserStmt.setString(3, "admin");

            int rowsAffected = insertUserStmt.executeUpdate();
            if (rowsAffected > 0) {
                ResultSet generatedKeys = insertUserStmt.getGeneratedKeys();
                if (generatedKeys.next()) {
                    int userId = generatedKeys.getInt(1); // Get the generated User_ID

                    // Step 3: Insert into admins table
                    insertAdminStmt.setString(1, adminData.getFirstName());
                    insertAdminStmt.setString(2, adminData.getLastName());
                    insertAdminStmt.setString(3, adminData.getEmail());
                    insertAdminStmt.setString(4, encryptedPassword); // Store encrypted password
                    insertAdminStmt.setInt(5, userId);

                    int adminRows = insertAdminStmt.executeUpdate();
                    if (adminRows > 0) {
                        return "success";
                    }
                }
            }

        } catch (SQLException e) {
            System.err.println("Error during admin registration: " + e.getMessage());
            e.printStackTrace();
        }

        return "failed";
    }
}
