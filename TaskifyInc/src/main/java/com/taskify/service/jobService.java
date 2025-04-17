package com.taskify.service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.taskify.config.TaskifyDBconfig;
import com.taskify.model.jobModel;


public class jobService {
	private Connection dbConn;
	public jobService() {
		
        try {
            this.dbConn = TaskifyDBconfig.getDbConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            System.err.println("Database connection error: " + ex.getMessage());
            ex.printStackTrace();
        }
        
     }
	public List<jobModel> getAllJobs() throws SQLException, ClassNotFoundException {
	    List<jobModel> jobList = new ArrayList<>();

	    Connection dbConn = TaskifyDBconfig.getDbConnection();

	    if(dbConn == null) {
	        System.err.println("Database connection is not available.");
	        return jobList;
	    }

	    String selectQuery = "SELECT * FROM job";

	    try (PreparedStatement stmt = dbConn.prepareStatement(selectQuery);
	         ResultSet rs = stmt.executeQuery()) {

	        while(rs.next()) {
	            String jobname = rs.getString("job_name");
	            jobModel job = new jobModel(jobname);
	            jobList.add(job);
	        }
	    }
	    return jobList;
	}

	public Boolean registerJob(jobModel jobModel) {
			if(dbConn==null) {
				System.err.println("Database connection is not available.");
				return false;
			}
			String insertquery="INSERT into job (job_name) VALUES (?)";
			System.out.println("successful connection");
			
			try(PreparedStatement jobstmt=dbConn.prepareStatement(insertquery)){
				System.out.println(jobModel.getjob());
				jobstmt.setString(1, jobModel.getjob());
				
				int updater=jobstmt.executeUpdate();
				System.out.println(jobstmt);
				if(updater>0) {
					return true;
				}else {
					 System.err.println("Failed to insert job data.");
				}
				
			}catch (SQLException e) {
	            System.err.println("Error during database operation: " + e.getMessage());
	            e.printStackTrace();
	        }
			return false;
    	
        
    }
}