package com.taskify.service;

import com.taskify.config.TaskifyDBconfig;
import com.taskify.model.memberModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

public class AdminDashboardService {
	int rowCount = 0;
	int jobCount = 0;
	int PendingJobCount = 0;
	int AdminCount = 0;

    public int getUserCount() {

        String TotalUsers = "SELECT count(*) FROM members";
        // String TotalJobs = "SELECT count(*) FROM jobs";

        try (Connection connection = TaskifyDBconfig.getDbConnection();
             PreparedStatement ps = connection.prepareStatement(TotalUsers)) {

            ResultSet rs = ps.executeQuery();
            
            
            if (rs.next()) {
            	rowCount = rs.getInt(1);
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace(); // Replace with logging in production
        }
        return rowCount;
    }
    
    public int getJobCount() {

        String TotalJobs = "SELECT count(*) FROM jobs";

        try (Connection connection = TaskifyDBconfig.getDbConnection();
             PreparedStatement ps = connection.prepareStatement(TotalJobs)) {

            ResultSet rs = ps.executeQuery();
            
            
            if (rs.next()) {
            	jobCount = rs.getInt(1);
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace(); // Replace with logging in production
        }
        return jobCount;
    }
    
    public int getPendingJobApprovals() {

        String PendingJob = "SELECT count(*) FROM `applications` WHERE application_Status='pending'";

        try (Connection connection = TaskifyDBconfig.getDbConnection();
             PreparedStatement ps = connection.prepareStatement(PendingJob)) {

            ResultSet rs = ps.executeQuery();
            
            
            if (rs.next()) {
            	PendingJobCount = rs.getInt(1);
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace(); // Replace with logging in production
        }
        return PendingJobCount;
    }
    
    public int getTotalAdmin() {

        String TotalAdmin = "SELECT count(*) FROM `users` WHERE User_Type = 'Admin'";

        try (Connection connection = TaskifyDBconfig.getDbConnection();
             PreparedStatement ps = connection.prepareStatement(TotalAdmin)) {

            ResultSet rs = ps.executeQuery();
            
            
            if (rs.next()) {
            	AdminCount = rs.getInt(1);
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace(); // Replace with logging in production
        }
        System.out.print(AdminCount);
        return AdminCount;
    }
}
