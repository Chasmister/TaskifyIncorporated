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
        String deleteProfilesQuery = "DELETE FROM users_members_profiles WHERE Member_ID = ?";
        String deleteUserMemberQuery = "DELETE FROM users_members WHERE Member_ID = ?";
        String deleteMemberQuery = "DELETE FROM members WHERE Member_ID = ?";

        try (Connection conn = TaskifyDBconfig.getDbConnection()) {
            conn.setAutoCommit(false); // Start transaction

            // Delete from users_members_profiles
            try (PreparedStatement ps1 = conn.prepareStatement(deleteProfilesQuery)) {
                ps1.setInt(1, memberId);
                ps1.executeUpdate();
            }

            // Delete from users_members
            try (PreparedStatement ps2 = conn.prepareStatement(deleteUserMemberQuery)) {
                ps2.setInt(1, memberId);
                ps2.executeUpdate();
            }

            // Delete from members
            try (PreparedStatement ps3 = conn.prepareStatement(deleteMemberQuery)) {
                ps3.setInt(1, memberId);
                ps3.executeUpdate();
            }
            conn.commit(); // Commit transaction
            
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
                member.setUser_ID(rs.getInt("User_ID"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return member;
    }
    
    public List<memberModel> searchUsersAdmin(String keyword) {
        List<memberModel> users = new ArrayList<>();

        boolean hasKeyword = keyword != null && !keyword.trim().isEmpty();
        String query = hasKeyword
        		? "SELECT * FROM members WHERE LOWER(Member_FirstName) LIKE ? OR LOWER(Member_LastName) LIKE ?"
        		: "SELECT * FROM members";

        try (Connection connection = TaskifyDBconfig.getDbConnection();
             PreparedStatement ps = connection.prepareStatement(query)){
        	
        		if(hasKeyword) {
        			String likeKeyword = "%" + keyword.toLowerCase() + "%";
        			ps.setString(1, likeKeyword);
        			ps.setString(2, likeKeyword);
        		}
        		
        		try(ResultSet rs = ps.executeQuery()) {

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
        		}

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace(); 
        }
        System.out.println("Fetching users from ManageUserService...");
        return users;
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
