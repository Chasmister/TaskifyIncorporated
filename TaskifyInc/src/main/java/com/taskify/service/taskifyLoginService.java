package com.taskify.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

import com.taskify.config.TaskifyDBconfig;
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
        String getuserQuery = "SELECT * FROM members WHERE User_ID=?";
        memberModel currentUser = null;  // Initialize the currentUser to be returned

        try (PreparedStatement userinfostmt = dbConn.prepareStatement(getuserQuery)) {
            // Set the parameter for the query
            userinfostmt.setInt(1, userid);  // Use setInt for integer type
            System.out.println(userid);
            
            // Execute the query and get the ResultSet
            ResultSet userinfo = userinfostmt.executeQuery();
            
            if (userinfo.next()) {
                // Extract the data from the ResultSet and populate the memberModel
                String firstName = userinfo.getString("Member_FirstName");
                String lastName = userinfo.getString("Member_LastName");
                LocalDate dob = userinfo.getDate("Member_DOB").toLocalDate();  
                String gender = userinfo.getString("Member_Gender");
                String email = userinfo.getString("Member_Email");
                String phonenumber = userinfo.getString("Member_ContactNumber");
                
                // Populate the memberModel object with extracted data
                currentUser = new memberModel(firstName, lastName, dob, gender, email, phonenumber);
                
               
                currentUser.setId(userinfo.getInt("Member_ID"));
            }
        } catch (SQLException e) {
            System.err.println("Error during database operation: " + e.getMessage());
            e.printStackTrace();
        }
        
        return currentUser;  // Return the populated memberModel object
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
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }


}
