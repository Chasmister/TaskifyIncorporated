package com.taskify.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.taskify.config.TaskifyDBconfig;
import com.taskify.model.userModel;

public class taskifyLoginService {
	private Connection dbConn;
	 

    public taskifyLoginService() {
        try {
            this.dbConn = TaskifyDBconfig.getDbConnection();
          
        } catch (SQLException | ClassNotFoundException ex) {
            System.err.println("Database connection error: " + ex.getMessage());
            ex.printStackTrace();
        }
    }
    
    public Boolean verifyuser(userModel userdata) {
    	String userQuery="SELECT User_Name from users WHERE User_name=(?)";
    	
    	
    	try(PreparedStatement selectstmt=dbConn.prepareStatement(userQuery)){
    		selectstmt.setString(1,userdata.getusername());
    		int rowsAffected=selectstmt.executeUpdate();
    		if(rowsAffected>0) {
    			String verifyQuery="SELECT User_Name,User_Password from users WHERE User_Name =(?) AND User_Password=(?)";
    			try(PreparedStatement verifystmt=dbConn.prepareStatement(verifyQuery)){
    	    		verifystmt.setString(1,userdata.getusername());   
    	    		verifystmt.setString(2,userdata.getpassword());
    	    		int rowsAffected2=verifystmt.executeUpdate();
    	    		if(rowsAffected2>0) {
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
