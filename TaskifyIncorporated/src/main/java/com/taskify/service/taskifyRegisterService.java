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
	    public Boolean registerUserandMember(userModel userdata,memberModel memberdata) {
	    	String UserQuery="INSERT INTO users (User_Name, User_Password) VALUES (?, ?)";
	    	String MemberQuery="INSERT INTO members (Member_FirstName, Member_LastName, Member_DOB, Member_Gender, Member_Email, Member_ContactNumber, User_ID) VALUES (?, ?, ?, ?, ?, ?, ?)";
	    
	    	try(PreparedStatement insertstmt=dbConn.prepareStatement(UserQuery, PreparedStatement.RETURN_GENERATED_KEYS);
	    			PreparedStatement memberstmt=dbConn.prepareStatement(MemberQuery)){
	    		insertstmt.setString(1, userdata.getusername());
	            insertstmt.setString(2, userdata.getpassword());
	            System.out.println("worker");
	            int rowsAffected = insertstmt.executeUpdate();
	            if(rowsAffected>0) {
	            	ResultSet generatedKeys = insertstmt.getGeneratedKeys();
	                if (generatedKeys.next()) {
	                    int userId = generatedKeys.getInt(1); 
		            	System.out.println("worker");
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
	                    	return true;
	                    }else {
	                    	System.err.println("Failed to register new member .");
	                    }
	                }
	            }
	    		
	    	}catch (SQLException e) {
	            System.err.println("Error during database operation: " + e.getMessage());
	            e.printStackTrace();
	        }
	    	return false;
	    	
	    }


}
