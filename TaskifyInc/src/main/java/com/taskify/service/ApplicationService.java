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
	public List<ApplicationModel> getApplicationsForJob(int jobid) throws SQLException, ClassNotFoundException {
	    List<ApplicationModel> applicationList = new ArrayList<>();

	    if (dbConn == null) {
	        System.err.println("Database connection is not available.");
	        return applicationList;
	    }

	    String findIdQuery = "SELECT application_ID, user_ID FROM users_members_jobs_applications WHERE job_ID=?";

	    try (PreparedStatement stmt = dbConn.prepareStatement(findIdQuery)) {
	        stmt.setInt(1, jobid);
	  

	        try (ResultSet rs = stmt.executeQuery()) {
	            while (rs.next()) {
	                int applicationId = rs.getInt("application_ID");
	                int applicantUserId = rs.getInt("user_ID");

	                // Fetch application details
	                String getApplicationsQuery = "SELECT application_Status FROM applications WHERE application_ID=?";
	                String applicationStatus = null;

	                try (PreparedStatement stmt2 = dbConn.prepareStatement(getApplicationsQuery)) {
	                    stmt2.setInt(1, applicationId);
	                    try (ResultSet rs2 = stmt2.executeQuery()) {
	                        if (rs2.next()) {
	                            applicationStatus = rs2.getString("application_Status");
	                        }
	                    }
	                }

	                // Fetch user details
	                userModel user = null;
	                String getUserQuery = "SELECT * FROM users WHERE user_ID=?";
	                try (PreparedStatement stmt3 = dbConn.prepareStatement(getUserQuery)) {
	                    stmt3.setInt(1, applicantUserId);
	                   
	                    try (ResultSet rs3 = stmt3.executeQuery()) {
	                        if (rs3.next()) {
	                            String username = rs3.getString("User_Name");
	                            String password = rs3.getString("User_Password");
	                           
	                            user = new userModel(username, password);
	                            user.setuser_ID(applicantUserId);
	                 
	                        }
	                    }
	                }

	                // Fetch profile details
	                profileModel profile = null;

	             // First, get the profile ID from users_members_profiles for the given applicantUserId
	             String getProfileIdQuery = "SELECT profile_id FROM users_members_profiles WHERE user_id = ?";
	             try (PreparedStatement stmtProfileId = dbConn.prepareStatement(getProfileIdQuery)) {
	                 stmtProfileId.setInt(1, applicantUserId);
	                 try (ResultSet rsProfileId = stmtProfileId.executeQuery()) {
	                	
	                     if (rsProfileId.next()) {
	                         int profileId = rsProfileId.getInt("profile_id");
	                         

	                         // Now use the profileId to get the profile details from profiles table
	                         String getProfileQuery = "SELECT * FROM profiles WHERE Profile_ID = ?";
	                         try (PreparedStatement stmtProfile = dbConn.prepareStatement(getProfileQuery)) {
	                             stmtProfile.setInt(1, profileId);
	                          
	                             try (ResultSet rsProfile = stmtProfile.executeQuery()) {
	                                 if (rsProfile.next()) {
	                                
	                                     String occupation = rsProfile.getString("Profile_Occupation");
	                                     String profileDescription = rsProfile.getString("Profile_Description");
	                                     String displayPicture = rsProfile.getString("Display_Picture");
	                                     String skills = rsProfile.getString("Profile_skills");
	                                     String achievements = rsProfile.getString("Achievements");
	                                     String experience = rsProfile.getString("Experience");
	                                     
	                                     profile = new profileModel(occupation, profileDescription, displayPicture, skills, achievements, experience);
	                                 }
	                             }
	                         }
	                     }
	                 }
	             }


	                // Add to list
	             
	             
	                if (user != null && profile != null && applicationStatus != null) {
	                    ApplicationModel application = new ApplicationModel(applicationId, applicationStatus, user, profile);
	                    applicationList.add(application);
	                }
	            }
	        }
	    }

	    System.out.println("Total applications fetched: " + applicationList.size());
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
	                            JobModel job = null;
	                            try (PreparedStatement stmt3 = dbConn.prepareStatement(getJobQuery)) {
	                                stmt3.setInt(1, jobId);
	                                try (ResultSet rs3 = stmt3.executeQuery()) {
	                                    if (rs3.next()) {
	                                        job = new JobModel(
	                                            rs3.getInt("job_ID"),
	                                            rs3.getString("job_Name"),
	                                            rs3.getString("job_Description"),
	                                            rs3.getDate("Start_Date"),
	                                            rs3.getDate("End_Date"),
	                                            rs3.getDouble("Salary"),
	                                            rs3.getString("Skills_Required"),
	                                            rs3.getString("Company_Picture")
	                                        );
	                                    }
	                                }
	                            }

	                            // Fetch profile_ID from users_members_profiles
	                            String getProfileIdQuery = "SELECT profile_ID FROM users_members_profiles WHERE user_ID=?";
	                            int profileId = -1;
	                            try (PreparedStatement stmt4 = dbConn.prepareStatement(getProfileIdQuery)) {
	                                stmt4.setInt(1, userdata.getuserid());
	                                try (ResultSet rs4 = stmt4.executeQuery()) {
	                                    if (rs4.next()) {
	                                        profileId = rs4.getInt("profile_ID");
	                                    }
	                                }
	                            }

	                            // Fetch profile details
	                            profileModel profile = null;
	                            if (profileId != -1) {
	                                String getProfileQuery = "SELECT * FROM profiles WHERE profile_ID=?";
	                                try (PreparedStatement stmt5 = dbConn.prepareStatement(getProfileQuery)) {
	                                    stmt5.setInt(1, profileId);
	                                    try (ResultSet rs5 = stmt5.executeQuery()) {
	                                        if (rs5.next()) {
	                                            profile = new profileModel(
	                                                rs5.getString("Profile_Occupation"),
	                                                rs5.getString("Profile_Description"),
	                                                rs5.getString("Display_Picture"),
	                                                rs5.getString("Profile_Skills"),
	                                                rs5.getString("Achievements"),
	                                                rs5.getString("Experience")
	                                            );
	                                        }
	                                    }
	                                }
	                            }

	                            // Add application model with job and profile
	                            ApplicationModel myApplication = new ApplicationModel(applicationId, applicationStatus, job);
	                            myApplication.setProfile(profile); // assuming ApplicationModel supports this
	                            applicationList.add(myApplication);
	                        }
	                    }
	                }
	            }
	        }
	    }

	    return applicationList;
	}
	
	public boolean handleApplications(int application_Id, String status) {
	    if (dbConn == null) {
	        System.err.println("Database connection is not available.");
	        return false;
	    }

	    String updateQuery = "UPDATE applications SET application_status = ? WHERE application_id = ?";

	    try (PreparedStatement stmt = dbConn.prepareStatement(updateQuery)) {
	        stmt.setString(1, status);
	        stmt.setInt(2, application_Id);
	       

	        int rowsUpdated = stmt.executeUpdate();
	        return rowsUpdated > 0; // return true if at least one row was updated
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    }
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
