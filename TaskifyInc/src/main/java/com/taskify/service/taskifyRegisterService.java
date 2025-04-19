package com.taskify.service;


import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.taskify.model.memberModel;

import com.taskify.model.userModel;
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
	    public String registerUserandMember(userModel userdata,memberModel memberdata) {
	    	//before inserting the values we must first check if the user entered values exist in the table
	    	String checkUserQuery = "SELECT u.User_Name, m.Member_Email, m.Member_ContactNumber " +
                    "FROM users u JOIN members m ON u.User_ID = m.User_ID " +
                    "WHERE u.User_Name = ? OR m.Member_Email = ? OR m.Member_ContactNumber = ?";

	    	String userInsertQuery = "INSERT INTO users (User_Name, User_Password) VALUES (?, ?)";
	    	String memberInsertQuery = "INSERT INTO members (Member_FirstName, Member_LastName, Member_DOB, Member_Gender, Member_Email, Member_ContactNumber, User_ID) " +
                       "VALUES (?, ?, ?, ?, ?, ?, ?)";

	    	try (
	    			PreparedStatement checkStmt = dbConn.prepareStatement(checkUserQuery);
	    			PreparedStatement insertstmt=dbConn.prepareStatement(userInsertQuery, PreparedStatement.RETURN_GENERATED_KEYS);
	    			PreparedStatement memberstmt=dbConn.prepareStatement(memberInsertQuery)){
	    		
	    		
	    		  	checkStmt.setString(1, userdata.getusername());
	    	        checkStmt.setString(2, memberdata.getEmail());
	    	        checkStmt.setString(3, memberdata.getPhonenumber());

	    	        ResultSet rs = checkStmt.executeQuery();
	    	        if (rs.next()) {
	    	            // A user with the same username, email or contact already exists
	    	          
	    	            return "exists";
	    	        }

			    		insertstmt.setString(1, userdata.getusername());
			            insertstmt.setString(2, userdata.getpassword());
			           
			            int rowsAffected = insertstmt.executeUpdate();
			            if(rowsAffected>0) {
			            	ResultSet generatedKeys = insertstmt.getGeneratedKeys();
			                if (generatedKeys.next()) {
			                    int userId = generatedKeys.getInt(1); 
				            	
				            	System.out.println(memberdata.getFirstName());
				            	
				            	  // Step 3: Insert the member using the retrieved User_ID
			                    memberstmt.setString(1, memberdata.getFirstName());
			                 
			                    memberstmt.setString(2, memberdata.getLastName());
			
			                    // Convert LocalDate to java.sql.Date
			                    memberstmt.setDate(3, Date.valueOf(memberdata.getDob())); // Convert LocalDate to java.sql.Date
			
			                    memberstmt.setString(4, memberdata.getGender());
			                    memberstmt.setString(5, memberdata.getEmail());
			                    memberstmt.setString(6, memberdata.getPhonenumber());
			                    memberstmt.setInt(7, userId); // Set the User_ID as the foreign key
				            	
			                    int memberRowsAffected = memberstmt.executeUpdate();
			                    if(memberRowsAffected>0) {
			                    	return "success";
			                    }else {
			                    	System.err.println("Failed to register new member .");
			                    }
		                }
		            }
	    		
	    	}catch (SQLException e) {
	            System.err.println("Error during database operation: " + e.getMessage());
	            e.printStackTrace();
	        }
	    	return "failed";
	    	
	    }
	   


}
