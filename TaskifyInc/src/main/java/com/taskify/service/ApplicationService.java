package com.taskify.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.taskify.config.TaskifyDBconfig;
import com.taskify.model.ApplicationModel;
import com.taskify.model.JobModel;
import com.taskify.model.profileModel;
import com.taskify.model.userModel;

public class ApplicationService {
	private Connection dbConn;
	public ApplicationService() {
		try {
	        this.dbConn = TaskifyDBconfig.getDbConnection();
	    } catch (SQLException | ClassNotFoundException ex) {
	        System.err.println("Database connection error: " + ex.getMessage());
	        ex.printStackTrace();
	    }
	}
	public List<ApplicationModel> getMyApplications(int userid, int jobid) throws SQLException, ClassNotFoundException {
	    List<ApplicationModel> applicationList = new ArrayList<>();
	    
	    // Check if the database connection is available
	    if (dbConn == null) {
	        System.err.println("Database connection is not available.");
	        return applicationList;
	    }

	    // Query to get application IDs related to the user and job
	    String findIdQuery = "SELECT application_ID FROM users_members_jobs_applications WHERE user_ID=? AND job_ID=?";
	    
	    try (PreparedStatement stmt = dbConn.prepareStatement(findIdQuery)) {
	        stmt.setInt(1, userid);
	        stmt.setInt(2, jobid);
	        
	        try (ResultSet rs = stmt.executeQuery()) {
	            while (rs.next()) {
	                int applicationId = rs.getInt("application_ID");

	                // Fetch application details
	                String getApplicationsQuery = "SELECT * FROM applications WHERE application_ID=?";
	                try (PreparedStatement stmt2 = dbConn.prepareStatement(getApplicationsQuery)) {
	                    stmt2.setInt(1, applicationId);
	                    
	                    try (ResultSet rs2 = stmt2.executeQuery()) {
	                        if (rs2.next()) {
	                            String applicationStatus = rs2.getString("application_Status");

	                            // Fetch user details (e.g., username, etc.)
	                            String getUserQuery = "SELECT * FROM users WHERE user_ID=?";
	                            userModel user = null;
	                            try (PreparedStatement stmt3 = dbConn.prepareStatement(getUserQuery)) {
	                                stmt3.setInt(1, userid);
	                                
	                                try (ResultSet rs3 = stmt3.executeQuery()) {
	                                    if (rs3.next()) {
	                                        String username = rs3.getString("username");
	                                        String profilePicture = rs3.getString("profile_picture");
	                                        // Create the userModel object
	                                        user = new userModel(username, rs3.getString("password"));
	                                        user.setuser_ID(rs3.getInt("user_ID"));
	                                        // Set user type (you can use the appropriate field from your DB)
	                                        user.setusertype(rs3.getString("usertype"));
	                                    }
	                                }
	                            }

	                            // Fetch profile details for the user
	                            String getProfileQuery = "SELECT * FROM profiles WHERE user_ID=?";
	                            profileModel profile = null;
	                            try (PreparedStatement stmt4 = dbConn.prepareStatement(getProfileQuery)) {
	                                stmt4.setInt(1, userid);
	                                
	                                try (ResultSet rs4 = stmt4.executeQuery()) {
	                                    if (rs4.next()) {
	                                        String occupation = rs4.getString("occupation");
	                                        String profileDescription = rs4.getString("profile_description");
	                                        String skills = rs4.getString("skills");
	                                        String displayPicture = rs4.getString("display_picture");
	                                        String achievements = rs4.getString("achievements");
	                                        String experience = rs4.getString("experience");
	                                        
	                                        // Create the profileModel object using the fetched profile data
	                                        profile = new profileModel(occupation, profileDescription, displayPicture, skills, achievements, experience);
	                                    }
	                                }
	                            }

	                            // Create and add ApplicationModel with user and profile data
	                            ApplicationModel myApplication = new ApplicationModel(applicationId, applicationStatus, user, profile);
	                            applicationList.add(myApplication);
	                        }
	                    }
	                }
	            }
	        }
	    }

	    return applicationList;
	}


	public List<ApplicationModel> getMyApplications(userModel userdata) throws SQLException, ClassNotFoundException {
	    List<ApplicationModel> applicationList = new ArrayList<>();
	    if (dbConn == null) {
	        System.err.println("Database connection is not available.");
	        return applicationList;
	    }

	    String findIdQuery = "SELECT application_ID, job_ID FROM users_members_jobs_applications WHERE user_ID=?";

	    try (PreparedStatement stmt = dbConn.prepareStatement(findIdQuery)) {
	        stmt.setInt(1, userdata.getuserid());
	        try (ResultSet rs = stmt.executeQuery()) {
	            while (rs.next()) {
	                int applicationId = rs.getInt("application_ID");
	                int jobId = rs.getInt("job_ID");

	                // Fetch application details
	                String getApplicationsQuery = "SELECT * FROM applications WHERE application_ID=?";
	                try (PreparedStatement stmt2 = dbConn.prepareStatement(getApplicationsQuery)) {
	                    stmt2.setInt(1, applicationId);
	                    try (ResultSet rs2 = stmt2.executeQuery()) {
	                        if (rs2.next()) {
	                            String applicationStatus = rs2.getString("application_Status");

	                            // Fetch job details
	                            String getJobQuery = "SELECT * FROM jobs WHERE job_ID=?";
	                            try (PreparedStatement stmt3 = dbConn.prepareStatement(getJobQuery)) {
	                                stmt3.setInt(1, jobId);
	                                try (ResultSet rs3 = stmt3.executeQuery()) {
	                                    if (rs3.next()) {
	                                        JobModel job = new JobModel(
	                                        		rs3.getInt("job_ID"),
	                                        	    rs3.getString("job_Name"),
	                                        	    rs3.getString("job_Description"),
	                                        	    rs3.getDate("Start_Date"),      // java.sql.Date, assuming DB column is DATE
	                                        	    rs3.getDate("End_Date"),
	                                        	    rs3.getDouble("Salary"),       // assuming DB column is DOUBLE or DECIMAL
	                                        	    rs3.getString("Skills_Required"),
	                                        	    rs3.getString("Company_Picture")   //
	                                        );

	                                        // Add enriched application model
	                                        ApplicationModel myApplication = new ApplicationModel(applicationId, applicationStatus, job);
	                                        applicationList.add(myApplication);
	                                    }
	                                }
	                            }
	                        }
	                    }
	                }
	            }
	        }
	    }

	    return applicationList;
	}
	
	public ApplicationModel newApplication(int memberId, int userId, int jobId) throws SQLException {
	    if (dbConn == null) {
	        throw new SQLException("No database connection available.");
	    }

	    // Step 1: Insert into applications table
	    String insertAppQuery = "INSERT INTO applications (application_Status) VALUES (?)";
	    int generatedAppId = -1;

	    try (PreparedStatement insertAppStmt = dbConn.prepareStatement(insertAppQuery, PreparedStatement.RETURN_GENERATED_KEYS)) {
	        insertAppStmt.setString(1, "Pending");
	        int affectedRows = insertAppStmt.executeUpdate();

	        if (affectedRows == 0) {
	            throw new SQLException("Creating application failed, no rows affected.");
	        }

	        try (ResultSet generatedKeys = insertAppStmt.getGeneratedKeys()) {
	            if (generatedKeys.next()) {
	                generatedAppId = generatedKeys.getInt(1);
	            } else {
	                throw new SQLException("Creating application failed, no ID obtained.");
	            }
	        }
	    }

	    // Step 2: Insert into users_members_jobs_applications
	    String insertJoinQuery = "INSERT INTO users_members_jobs_applications (application_ID, user_ID, member_ID, job_ID) VALUES (?, ?, ?, ?)";
	    try (PreparedStatement insertJoinStmt = dbConn.prepareStatement(insertJoinQuery)) {
	        insertJoinStmt.setInt(1, generatedAppId);
	        insertJoinStmt.setInt(2, userId);
	        insertJoinStmt.setInt(3, memberId);
	        insertJoinStmt.setInt(4, jobId);
	        insertJoinStmt.executeUpdate();
	    }

	    // Step 3: Fetch job info to populate ApplicationModel
	    JobModel job = null;
	    String getJobQuery = "SELECT * FROM jobs WHERE job_ID=?";
	    try (PreparedStatement jobStmt = dbConn.prepareStatement(getJobQuery)) {
	        jobStmt.setInt(1, jobId);
	        try (ResultSet rs = jobStmt.executeQuery()) {
	            if (rs.next()) {
	                job = new JobModel(
	                    rs.getInt("job_ID"),
	                    rs.getString("job_Name"),
	                    rs.getString("job_Description"),
	                    rs.getDate("Start_Date"),
	                    rs.getDate("End_Date"),
	                    rs.getDouble("Salary"),
	                    rs.getString("Skills_Required"),
	                    rs.getString("Company_Picture")
	                );
	            }
	        }
	    }

	    // Step 4: Return the new ApplicationModel
	    return new ApplicationModel(generatedAppId, "Pending", job);
	}

	

        		


}
