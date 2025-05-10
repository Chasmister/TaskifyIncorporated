package com.taskify.service;

import com.taskify.config.TaskifyDBconfig;
import com.taskify.model.memberModel;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ManageUserService {

    public List<memberModel> getAllUsers() {
        List<memberModel> users = new ArrayList<>();

        String query = "SELECT * FROM members";

        try (Connection connection = TaskifyDBconfig.getDbConnection();
             PreparedStatement ps = connection.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
            	memberModel member = new memberModel(
            		    rs.getString("Member_FirstName"),
            		    rs.getString("Member_LastName"),
            		    rs.getDate("Member_DOB").toLocalDate(),
            		    rs.getString("Member_Gender"),
            		    rs.getString("Member_Email"),
            		    rs.getString("Member_ContactNumber")
            		);
            	
            	member.setId(rs.getInt("Member_ID")); 
            	member.setUser_ID(rs.getInt("User_ID"));

            	users.add(member);
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace(); 
        }
        System.out.println("Fetching users from ManageUserService...");
        return users;
    }
}
