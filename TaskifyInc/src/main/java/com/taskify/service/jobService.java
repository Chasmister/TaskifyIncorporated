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

    // Method to register a new job in the database
    public Boolean registerJob(JobModel jobModel) {
        if (dbConn == null) {
            System.err.println("Database connection is not available.");
            return false;
        }

        // Insert query to insert a job into the database
        String insertQuery = "INSERT INTO jobs (Job_Name, Job_Description, Start_Date, End_Date, Salary, Skills_Required, Company_Picture) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement stmt = dbConn.prepareStatement(insertQuery)) {
            // Setting values in the prepared statement from jobModel
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
                return true;
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

        String deleteDependenciesQuery = "DELETE FROM users_members_jobs_applications WHERE Job_ID = ?";
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
                dbConn.rollback(); // undo if any error
            } catch (SQLException rollbackEx) {
                rollbackEx.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            try {
                dbConn.setAutoCommit(true); // reset autocommit
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }
    
    public JobModel getJobById(int jobId) {
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
