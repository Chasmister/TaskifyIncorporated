package com.taskify.service;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.taskify.config.TaskifyDBconfig;
import com.taskify.model.JobModel;

public class jobService {
    private Connection dbConn;

    // Constructor to initialize database connection
    public jobService() {
        try {
            this.dbConn = TaskifyDBconfig.getDbConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            System.err.println("Database connection error: " + ex.getMessage());
            ex.printStackTrace();
         
        }
    }

    // Method to retrieve all jobs from the database
    public List<JobModel> getAllJobs() throws SQLException, ClassNotFoundException {
        List<JobModel> jobList = new ArrayList<>();

        if (dbConn == null) {
            System.err.println("Database connection is not available.");
            return jobList;
        }
        
        String selectQuery = "SELECT * FROM jobs"; // Update to match your table schema

        try (PreparedStatement stmt = dbConn.prepareStatement(selectQuery);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                // Fetching job data from ResultSet
                int jobId = rs.getInt("Job_ID");
                String jobName = rs.getString("Job_Name");
                String jobDescription = rs.getString("Job_Description");
                java.sql.Date startDate = rs.getDate("Start_Date");
                java.sql.Date endDate = rs.getDate("End_Date");
                double salary = rs.getDouble("Salary");
                String skillsRequired = rs.getString("Skills_Required");
                String companyPicture = rs.getString("Company_Picture");

                // Creating jobModel instance and adding it to jobList
                JobModel job = new JobModel(jobId, jobName, jobDescription, startDate, endDate, salary, skillsRequired, companyPicture);
                jobList.add(job);
            }
        }
        return jobList;
    }
    public List<JobModel> getJobById(int jobId) {
    	List<JobModel> jobList = new ArrayList<>();
        String query = "SELECT * FROM jobs WHERE Job_ID=?";
        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setInt(1, jobId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                	JobModel job=new JobModel(
                            rs.getInt("Job_ID"),
                            rs.getString("Job_Name"),
                            rs.getString("Job_Description"),
                            rs.getDate("Start_Date"),
                            rs.getDate("End_Date"),
                            rs.getDouble("Salary"),
                            rs.getString("Skills_Required"),
                            rs.getString("Company_Picture")
                    );
                	  jobList.add(job);
                	
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return jobList;
    }
    public JobModel getJobModelById(int jobId) {
        String query = "SELECT * FROM jobs WHERE Job_ID=?";
        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setInt(1, jobId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new JobModel(
                            rs.getInt("Job_ID"),
                            rs.getString("Job_Name"),
                            rs.getString("Job_Description"),
                            rs.getDate("Start_Date"),
                            rs.getDate("End_Date"),
                            rs.getDouble("Salary"),
                            rs.getString("Skills_Required"),
                            rs.getString("Company_Picture")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    // Method to retrieve all jobs from the database
    public List<JobModel> getAllJobs(int userid) throws SQLException, ClassNotFoundException {
        List<JobModel> jobList = new ArrayList<>();

        if (dbConn == null) {
            System.err.println("Database connection is not available.");
            return jobList;
        }

        String userinfoQuery = "SELECT Job_ID FROM Users_members_jobs WHERE User_ID!=?";
        String selectQuery = "SELECT * FROM jobs WHERE Job_ID=?";
        String checkIfAppliedQuery = "SELECT COUNT(*) FROM users_members_jobs_applications WHERE User_ID=? AND Job_ID=?";

        try (
            PreparedStatement stmt1 = dbConn.prepareStatement(userinfoQuery);
            PreparedStatement stmt = dbConn.prepareStatement(selectQuery);
            PreparedStatement checkIfAppliedStmt = dbConn.prepareStatement(checkIfAppliedQuery)
        ) {
            stmt1.setInt(1, userid);
            System.out.println("User ID: " + userid);
            ResultSet rs1 = stmt1.executeQuery();

            while (rs1.next()) {
                int currentJobId = rs1.getInt("Job_ID");

                // Check if the user has already applied for this job
                checkIfAppliedStmt.setInt(1, userid);
                checkIfAppliedStmt.setInt(2, currentJobId);
                ResultSet appliedResult = checkIfAppliedStmt.executeQuery();
                if (appliedResult.next()) {
                    int applicationCount = appliedResult.getInt(1);
                    if (applicationCount > 0) {
                        // Skip this job if the user has already applied
                        continue;
                    }
                }

                // If not applied, retrieve the job details
                stmt.setInt(1, currentJobId);
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    // Fetching job data from ResultSet
                    int jobId = rs.getInt("Job_ID");
                    String jobName = rs.getString("Job_Name");
                    String jobDescription = rs.getString("Job_Description");
                    java.sql.Date startDate = rs.getDate("Start_Date");
                    java.sql.Date endDate = rs.getDate("End_Date");
                    double salary = rs.getDouble("Salary");
                    String skillsRequired = rs.getString("Skills_Required");
                    String companyPicture = rs.getString("Company_Picture");

                    // Creating jobModel instance and adding it to jobList
                    JobModel job = new JobModel(jobId, jobName, jobDescription, startDate, endDate, salary, skillsRequired, companyPicture);
                    jobList.add(job);
                }
            }
        }
        return jobList;
    }


    // Method to register a new job in the database
    public Boolean registerJob(JobModel jobModel, int userId, int memberId) {
        if (dbConn == null) {
            System.err.println("Database connection is not available.");
            return false;
        }

        // Insert query to insert a job into the jobs table
        String insertJobQuery = "INSERT INTO jobs (Job_Name, Job_Description, Start_Date, End_Date, Salary, Skills_Required, Company_Picture) VALUES (?, ?, ?, ?, ?, ?, ?)";
        // Insert query for inserting into users_members_jobs
        String insertUsersJobsQuery = "INSERT INTO users_members_jobs (User_ID, Job_ID, Member_ID) VALUES (?, ?, ?)";
        System.out.println("this shit is working");
        try (PreparedStatement stmt = dbConn.prepareStatement(insertJobQuery, PreparedStatement.RETURN_GENERATED_KEYS)) {
            // Setting values in the prepared statement from jobModel
        	System.out.println(jobModel.getJobName());
            stmt.setString(1, jobModel.getJobName());
            stmt.setString(2, jobModel.getJobDescription());
            stmt.setDate(3, jobModel.getStartDate());
            stmt.setDate(4, jobModel.getEndDate());
            stmt.setDouble(5, jobModel.getSalary());
            stmt.setString(6, jobModel.getSkillsRequired());
            stmt.setString(7, jobModel.getCompanyPicture());

            // Execute the update query
            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Job registered successfully!");

                // Retrieve the generated Job_ID from the jobs table
                ResultSet generatedKeys = stmt.getGeneratedKeys();
                if (generatedKeys.next()) {
                    int jobId = generatedKeys.getInt(1); // Get the generated Job_ID

                    // Now, insert into the users_members_jobs table
                    try (PreparedStatement stmt2 = dbConn.prepareStatement(insertUsersJobsQuery)) {
                        stmt2.setInt(1, userId); // User_ID from session or method argument
                        stmt2.setInt(2, jobId); // Generated Job_ID
                        stmt2.setInt(3, memberId); // Member_ID from session or method argument

                        // Execute the insert into users_members_jobs
                        int rowsAffected2 = stmt2.executeUpdate();
                        if (rowsAffected2 > 0) {
                            System.out.println("Job successfully registered to the user.");
                            return true;
                        } else {
                            System.err.println("Failed to associate job with the user.");
                        }
                    } catch (SQLException e) {
                        System.err.println("Error during insert into users_members_jobs: " + e.getMessage());
                        e.printStackTrace();
                    }
                }
            } else {
                System.err.println("Failed to register job.");
            }
        } catch (SQLException e) {
            System.err.println("Error during database operation: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    
    public boolean deleteJobById(int jobId) {
        if (dbConn == null) return false;

        // Correct child table name based on your error
        String deleteDependenciesQuery = "DELETE FROM users_members_jobs WHERE Job_ID = ?";
        String deleteJobQuery = "DELETE FROM jobs WHERE Job_ID = ?";

        try {
            dbConn.setAutoCommit(false); // start transaction

            try (PreparedStatement stmt1 = dbConn.prepareStatement(deleteDependenciesQuery)) {
                stmt1.setInt(1, jobId);
                stmt1.executeUpdate();
            }

            try (PreparedStatement stmt2 = dbConn.prepareStatement(deleteJobQuery)) {
                stmt2.setInt(1, jobId);
                int rows = stmt2.executeUpdate();
                dbConn.commit();
                return rows > 0;
            }

        } catch (SQLException e) {
            try {
                dbConn.rollback(); 
            } catch (SQLException rollbackEx) {
                rollbackEx.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            try {
                dbConn.setAutoCommit(true);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    
    public List<JobModel> getJobsByUserId(int userID) {
        List<JobModel> myjobList = new ArrayList<>();

        String jobIdQuery = "SELECT Job_ID FROM users_members_jobs WHERE User_ID=?";
        String jobDetailsQuery = "SELECT * FROM jobs WHERE Job_ID=?";

        try (PreparedStatement stmt1 = dbConn.prepareStatement(jobIdQuery);
             PreparedStatement stmt2 = dbConn.prepareStatement(jobDetailsQuery)) {

            stmt1.setInt(1, userID);
            ResultSet rs1 = stmt1.executeQuery();

            while (rs1.next()) {
                int jobId = rs1.getInt("Job_ID");

                stmt2.setInt(1, jobId);
                try (ResultSet rs2 = stmt2.executeQuery()) {
                    if (rs2.next()) {
                        JobModel job = new JobModel(
                            rs2.getInt("Job_ID"),
                            rs2.getString("Job_Name"),
                            rs2.getString("Job_Description"),
                            rs2.getDate("Start_Date"),
                            rs2.getDate("End_Date"),
                            rs2.getDouble("Salary"),
                            rs2.getString("Skills_Required"),
                            rs2.getString("Company_Picture")
                        );
                        myjobList.add(job);
                    }
                }
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Consider replacing with a logger
        }

        return myjobList;
    }
    public List<JobModel> searchUserJobs(int userId, String keyword) {
        List<JobModel> myjobList = new ArrayList<>();

        String jobIdQuery = "SELECT Job_ID FROM users_members_jobs WHERE User_ID=?";
        String jobDetailsQuery = "SELECT * FROM jobs WHERE LOWER(Job_Name) LIKE ? AND Job_ID=?";

        try (PreparedStatement stmt1 = dbConn.prepareStatement(jobIdQuery);
             PreparedStatement stmt2 = dbConn.prepareStatement(jobDetailsQuery)) {
        	
        	String likeKeyword = "%" + keyword + "%";
    		stmt1.setInt(1, userId);
    		

           
            ResultSet rs1 = stmt1.executeQuery();

            while (rs1.next()) {
                int jobId = rs1.getInt("Job_ID");

                stmt2.setString(1, likeKeyword);
                stmt2.setInt(2,  jobId);
                
                try (ResultSet rs2 = stmt2.executeQuery()) {
                    if (rs2.next()) {
                        JobModel job = new JobModel(
                            rs2.getInt("Job_ID"),
                            rs2.getString("Job_Name"),
                            rs2.getString("Job_Description"),
                            rs2.getDate("Start_Date"),
                            rs2.getDate("End_Date"),
                            rs2.getDouble("Salary"),
                            rs2.getString("Skills_Required"),
                            rs2.getString("Company_Picture")
                        );
                        myjobList.add(job);
                    }
                }
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Consider replacing with a logger
        }

        return myjobList;
    }
    
    
    public List<JobModel> searchAllJobs(String keyword) {
        List<JobModel> jobList = new ArrayList<>();

        String query= "SELECT * FROM jobs WHERE LOWER(Job_Name) LIKE ?";
        

        try (PreparedStatement stmt1 = dbConn.prepareStatement(query)) {
        	
        	String likeKeyword = "%" + keyword + "%";
    		stmt1.setString(1, likeKeyword);
    		

           
            try(ResultSet rs = stmt1.executeQuery()) {
            	while (rs.next()) {
                        JobModel job = new JobModel(
                            rs.getInt("Job_ID"),
                            rs.getString("Job_Name"),
                            rs.getString("Job_Description"),
                            rs.getDate("Start_Date"),
                            rs.getDate("End_Date"),
                            rs.getDouble("Salary"),
                            rs.getString("Skills_Required"),
                            rs.getString("Company_Picture")
                        );
                        jobList.add(job);
                    }
                }

        } catch (SQLException e) {
            e.printStackTrace(); // Consider replacing with a logger
        }

        return jobList;
    }

    
    public boolean updateJob(JobModel job) {
        String query = "UPDATE jobs SET Job_Name=?, Job_Description=?, Start_Date=?, End_Date=?, Salary=?, Skills_Required=?, Company_Picture=? WHERE Job_ID=?";
        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setString(1, job.getJobName());
            stmt.setString(2, job.getJobDescription());
            stmt.setDate(3, job.getStartDate());
            stmt.setDate(4, job.getEndDate());
            stmt.setDouble(5, job.getSalary());
            stmt.setString(6, job.getSkillsRequired());
            stmt.setString(7, job.getCompanyPicture());
            stmt.setInt(8, job.getJobId());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

}
