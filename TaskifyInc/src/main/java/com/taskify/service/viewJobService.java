package com.taskify.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.taskify.config.TaskifyDBconfig;
import com.taskify.model.JobModel;

public class viewJobService {

    // Use TaskifyDBconfig to get the connection
    private Connection getConnection() throws SQLException, ClassNotFoundException {
        return TaskifyDBconfig.getDbConnection();
    }

    // Method to get all jobs with updated fields from the new schema
    public List<JobModel> getAllJobs() {
        List<JobModel> jobList = new ArrayList<>();
        String sql = "SELECT Job_ID, Job_Name, Job_Description, Start_Date, End_Date, Salary, Skills_Required, Company_Picture FROM jobs"; // Updated SQL query

        try (Connection connection = getConnection(); 
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {
            
            while (resultSet.next()) {
                int jobId = resultSet.getInt("Job_ID");
                String jobName = resultSet.getString("Job_Name");
                String jobDescription = resultSet.getString("Job_Description");
                Date startDate = resultSet.getDate("Start_Date");
                Date endDate = resultSet.getDate("End_Date");
                double salary = resultSet.getDouble("Salary");
                String skillsRequired = resultSet.getString("Skills_Required");
                String companyPicture = resultSet.getString("Company_Picture");
                
                // Assuming the Job class has the appropriate constructor
                JobModel job = new JobModel(jobId, jobName, jobDescription, startDate, endDate, salary, skillsRequired, companyPicture);
                jobList.add(job);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace(); // Log error in a real application
        }
        return jobList;
    }

}
