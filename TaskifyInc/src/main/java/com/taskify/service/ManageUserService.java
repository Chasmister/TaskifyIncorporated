package com.taskify.service;

import com.taskify.config.TaskifyDBconfig;
import com.taskify.model.memberModel;

import java.sql.*;
import java.time.LocalDate;
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
            	

            	users.add(member);
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace(); 
        }
        System.out.println("Fetching users from ManageUserService...");
        return users;
    }
    
    public void deleteUserById(int memberId) {
        String query = "DELETE FROM members WHERE Member_ID = ?";

        try (Connection conn = TaskifyDBconfig.getDbConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, memberId);
            ps.executeUpdate();

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    
    public memberModel getMemberById(int memberId) {
        memberModel member = null;
        String query = "SELECT * FROM members WHERE Member_ID = ?";

        try (Connection conn = TaskifyDBconfig.getDbConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, memberId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                member = new memberModel(
                    rs.getString("Member_FirstName"),
                    rs.getString("Member_LastName"),
                    rs.getDate("Member_DOB").toLocalDate(),
                    rs.getString("Member_Gender"),
                    rs.getString("Member_Email"),
                    rs.getString("Member_ContactNumber")
                );
                member.setId(rs.getInt("Member_ID"));
               
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return member;
    }

    public void updateUser(int memberId, String firstName, String lastName, String email, String phone, String gender, LocalDate dob) {
        String query = "UPDATE members SET Member_FirstName = ?, Member_LastName = ?, Member_Email = ?, Member_ContactNumber = ?, Member_Gender = ?, Member_DOB = ? WHERE Member_ID = ?";

        try (Connection conn = TaskifyDBconfig.getDbConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(1, firstName);
            ps.setString(2, lastName);
            ps.setString(3, email);
            ps.setString(4, phone);
            ps.setString(5, gender);
            ps.setDate(6, Date.valueOf(dob));
            ps.setInt(7, memberId);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}
