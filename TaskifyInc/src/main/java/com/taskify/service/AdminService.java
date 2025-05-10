package com.taskify.service;

import com.taskify.config.TaskifyDBconfig;
import com.taskify.model.AdminModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AdminService {

    public int insertUser(String username, String password) throws Exception {
        String insertUserSQL = "INSERT INTO users (User_Name, User_Password, User_Type) VALUES (?, ?, 'ADMIN')";
        try (Connection conn = TaskifyDBconfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(insertUserSQL, PreparedStatement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, username);
            stmt.setString(2, password);
            stmt.executeUpdate();

            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1); // return generated User_ID
            }
        }
        throw new Exception("Failed to create user");
    }

    public void insertAdmin(AdminModel admin) throws Exception {
        String insertAdminSQL = "INSERT INTO admins (User_ID, First_Name, Last_Name, Email, Password) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = TaskifyDBconfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(insertAdminSQL)) {
            stmt.setInt(1, admin.getUserId());
            stmt.setString(2, admin.getFirstName());
            stmt.setString(3, admin.getLastName());
            stmt.setString(4, admin.getEmail());
            stmt.setString(5, admin.getPassword());

            stmt.executeUpdate();
        }
    }
}
