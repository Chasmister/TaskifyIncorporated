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
                return rs.getInt(1); // returns generated User_ID
            }
        }
        throw new Exception("Failed to create user");
    }

    public int insertAdmin(AdminModel admin) throws Exception {
        String insertAdminSQL = "INSERT INTO admins (Admin_FirstName, Admin_LastName, Admin_Email) VALUES (?, ?, ?)";

        try (Connection conn = TaskifyDBconfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(insertAdminSQL, PreparedStatement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, admin.getFirstName());
            stmt.setString(2, admin.getLastName());
            stmt.setString(3, admin.getEmail());
            stmt.executeUpdate();

            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1); // returns generated Admin_ID
            }
        }
        throw new Exception("Failed to create admin");
    }
    
    public void insertUserAdminLink(int userId, int adminId) throws Exception {
        String insertLinkSQL = "INSERT INTO users_admins (User_ID, Admin_ID) VALUES (?, ?)";

        try (Connection conn = TaskifyDBconfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(insertLinkSQL)) {
            stmt.setInt(1, userId);
            stmt.setInt(2, adminId);
            stmt.executeUpdate();
        }
    }
    
    public AdminModel getAdminByUserId(int userId) throws Exception {
        String sql = "SELECT a.Admin_ID, ua.User_ID, a.Admin_FirstName, a.Admin_LastName, a.Admin_Email, u.User_Password " +
                     "FROM admins a " +
                     "JOIN users_admins ua ON a.Admin_ID = ua.Admin_ID " +
                     "JOIN users u ON ua.User_ID = u.User_ID " +
                     "WHERE ua.User_ID = ?";

        try (Connection conn = TaskifyDBconfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                AdminModel admin = new AdminModel(
                    rs.getInt("User_ID"),
                    rs.getString("Admin_FirstName"),
                    rs.getString("Admin_LastName"),
                    rs.getString("Admin_Email"),
                    rs.getString("User_Password")
                );
                return admin;
            }
        }
        throw new Exception("Admin not found for user ID: " + userId);
    }

 
    

    public boolean updateAdminProfile(AdminModel admin) throws Exception {
    	String sql = "UPDATE admins SET Admin_FirstName = ?, Admin_LastName = ?, Admin_Email = ? " +
                "WHERE Admin_ID = (SELECT Admin_ID FROM users_admins WHERE User_ID = ?)";

        try (Connection conn = TaskifyDBconfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, admin.getFirstName());
            stmt.setString(2, admin.getLastName());
            stmt.setString(3, admin.getEmail());
            stmt.setInt(4, admin.getUserId());

            int rows = stmt.executeUpdate();
            return rows > 0;
        }
    }


    

}
