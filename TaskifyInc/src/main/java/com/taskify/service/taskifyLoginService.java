package com.taskify.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

import com.taskify.config.TaskifyDBconfig;
import com.taskify.model.AdminModel;
import com.taskify.model.memberModel;
import com.taskify.model.userModel;
import com.taskify.util.PasswordUtil;

public class taskifyLoginService {
	private Connection dbConn;
	 

    public taskifyLoginService() {
        try {
            this.dbConn = TaskifyDBconfig.getDbConnection();
          
        } catch (SQLException | ClassNotFoundException ex) {
        	System.out.println("no connection man");
            System.err.println("Database connection error: " + ex.getMessage());
            ex.printStackTrace();
        }
    }
    public String checkusertype(userModel userdata) {
        String checkuserQuery = "SELECT User_Type FROM users WHERE User_Name=?";
        String currentuser = "NON-ADMIN";
        
        try (PreparedStatement usertypestmt = dbConn.prepareStatement(checkuserQuery)) {
            usertypestmt.setString(1, userdata.getusername());
            ResultSet usertype = usertypestmt.executeQuery();
            
            if (usertype.next()) {
                String dbUserType = usertype.getString("User_Type");
             
                if(dbUserType.equals("NON-ADMIN")) {
                	return "NON-ADMIN";
                }else {
                	return "ADMIN";
                }
            } else {
                System.out.println("User not found in database");
                return "NO-USER";
            }
        } catch (SQLException e) {
            System.err.println("Error during database operation: " + e.getMessage());
            e.printStackTrace();
        }
        
        return currentuser;
    }
    public memberModel getuserinfo(int userid) {
        String getuserQuery = "SELECT Member_ID FROM users_members WHERE User_ID=?";
        String getMemberinfo = "SELECT * FROM members WHERE Member_ID=?";
        memberModel currentUser = null;  // Initialize the currentUser to be returned

        try (PreparedStatement userinfostmt = dbConn.prepareStatement(getuserQuery);
             PreparedStatement memberinfostmt = dbConn.prepareStatement(getMemberinfo)) {
            // Set the parameter for the query to get Member_ID
            userinfostmt.setInt(1, userid);  // Use setInt for integer type
            System.out.println("User ID: " + userid);

            // Execute the query and get the ResultSet
            ResultSet userinfo = userinfostmt.executeQuery();

            if (userinfo.next()) {
                // Extract the Member_ID from the first query
                int memberId = userinfo.getInt("Member_ID");

                // Set the parameter for the memberinfostmt query
                memberinfostmt.setInt(1, memberId);  // Use the Member_ID retrieved earlier

                // Execute the second query to get member info
                ResultSet memberinfo = memberinfostmt.executeQuery();

                if (memberinfo.next()) {
                    // Extract the data from the ResultSet and populate the memberModel
                    String firstName = memberinfo.getString("Member_FirstName");
                    String lastName = memberinfo.getString("Member_LastName");
                    LocalDate dob = memberinfo.getDate("Member_DOB").toLocalDate();
                    String gender = memberinfo.getString("Member_Gender");
                    String email = memberinfo.getString("Member_Email");
                    String phonenumber = memberinfo.getString("Member_ContactNumber");

                    // Populate the memberModel object with extracted data
                    currentUser = new memberModel(firstName, lastName, dob, gender, email, phonenumber);

                    // Set the Member_ID for the member model
                    currentUser.setId(memberinfo.getInt("Member_ID"));
                }
            }
        } catch (SQLException e) {
            System.err.println("Error during database operation: " + e.getMessage());
            e.printStackTrace();
        }

        return currentUser;  // Return the populated memberModel object
    }

    public AdminModel getadmininfo(int userid) {
        String getuserQuery = "SELECT Admin_ID FROM admins WHERE User_ID=?";
        String getMemberinfo = "SELECT * FROM admins WHERE Admin_ID=?";
        AdminModel currentAdmin = null;  // Initialize the currentUser to be returned

        try (PreparedStatement userinfostmt = dbConn.prepareStatement(getuserQuery);
             PreparedStatement admininfostmt = dbConn.prepareStatement(getMemberinfo)) {
            // Set the parameter for the query to get Member_ID
            userinfostmt.setInt(1, userid);  // Use setInt for integer type
            System.out.println("User ID: " + userid);

            // Execute the query and get the ResultSet
            ResultSet userinfo = userinfostmt.executeQuery();

            if (userinfo.next()) {
                // Extract the Member_ID from the first query
                int AdminID = userinfo.getInt("Admin_ID");

                // Set the parameter for the memberinfostmt query
                admininfostmt.setInt(1, AdminID);  // Use the Member_ID retrieved earlier

                // Execute the second query to get member info
                ResultSet admininfo = admininfostmt.executeQuery();

                if (admininfo.next()) {
                    // Extract the data from the ResultSet and populate the memberModel
                    String firstName = admininfo.getString("Admin_FirstName");
                    String lastName = admininfo.getString("Admin_LastName");
                   
                    String email = admininfo.getString("Admin_Email");
                 
                    // Populate the memberModel object with extracted data
                    currentAdmin = new AdminModel(firstName, lastName, email);

                    // Set the Member_ID for the member model
                    currentAdmin.setAdminId(admininfo.getInt("Member_ID"));
                }
            }
        } catch (SQLException e) {
            System.err.println("Error during database operation: " + e.getMessage());
            e.printStackTrace();
        }

        return currentAdmin;  // Return the populated memberModel object
    }

    
    
    
    
    public boolean verifyuser(userModel user) {
        String sql = "SELECT User_Password, User_ID FROM users WHERE User_Name=?";

        try (PreparedStatement stmt = dbConn.prepareStatement(sql)) {
            stmt.setString(1, user.getusername());

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                String storedEncryptedPassword = rs.getString("User_Password");
                int userIdFromDB = rs.getInt("User_ID");

                // Decrypt the stored encrypted password
                String decryptedPassword = PasswordUtil.decrypt(storedEncryptedPassword, user.getusername());

                // Compare with the raw password entered by the user
                if (decryptedPassword != null && decryptedPassword.equals(user.getpassword())) {
                    user.setuser_ID(userIdFromDB); // Set the user ID
                    return true;
                } else {
                    System.out.println("Password doesn't match.");
                    return false;
                }
            }else {
            	return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }


}
