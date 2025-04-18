package com.taskify.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.taskify.config.TaskifyDBconfig;
import com.taskify.model.userModel;

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
    public Boolean checkusertype(userModel userdata) {
        String checkuserQuery = "SELECT User_Type FROM users WHERE User_name=?";
        boolean isNonAdmin = false;
        
        try (PreparedStatement usertypestmt = dbConn.prepareStatement(checkuserQuery)) {
            usertypestmt.setString(1, userdata.getusername());
            ResultSet usertype = usertypestmt.executeQuery();
            
            if (usertype.next()) {
                String dbUserType = usertype.getString("User_Type");
                isNonAdmin = "NON-ADMIN".equals(dbUserType);
                System.out.println("User type from DB: " + dbUserType);
            } else {
                System.out.println("User not found in database");
            }
        } catch (SQLException e) {
            System.err.println("Error during database operation: " + e.getMessage());
            e.printStackTrace();
        }
        
        return isNonAdmin;
    }
    
    
    
    
    public Boolean verifyuser(userModel userdata) {
    	String userQuery="SELECT User_Name from users WHERE User_name=?";
    	
    	
    	try(PreparedStatement selectstmt=dbConn.prepareStatement(userQuery)){
    		selectstmt.setString(1,userdata.getusername());
    		ResultSet rowsAffected=selectstmt.executeQuery();
    		if(rowsAffected.next()) {
    			String verifyQuery="SELECT User_Name,User_Password from users WHERE User_Name =? AND User_Password=?";
    			
    			try(PreparedStatement verifystmt=dbConn.prepareStatement(verifyQuery)){
    	    		verifystmt.setString(1,userdata.getusername());   
    	    		verifystmt.setString(2,userdata.getpassword());
    	    		ResultSet rowsAffected2=verifystmt.executeQuery();
    	    		
    	    		if(rowsAffected2.next()) {
    	    			return true;
    	    		}
    	    	}catch (SQLException e) {
    	                System.err.println("Error during database operation: " + e.getMessage());
    	                e.printStackTrace();
    	            }
    		}
    		
    	}
    	catch (SQLException e) {
            System.err.println("Error during database operation: " + e.getMessage());
            e.printStackTrace();
        }
    	return false;
    	
    }

}
