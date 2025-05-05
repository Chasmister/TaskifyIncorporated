package com.taskify.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Date;

import com.taskify.config.TaskifyDBconfig;
import com.taskify.model.JobModel;

public class AddJobsService {

    public boolean addJob(JobModel job) {
        boolean isInserted = false;
        System.out.println("this is working");

        String sql = "INSERT INTO jobs (job_name, job_description, start_date, end_date, salary, skills_required, company_picture) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = TaskifyDBconfig.getDbConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, job.getJobName());
            // Convert LocalDate to java.sql.Date for the start and end date
            ps.setString(2, job.getJobDescription());
            ps.setDate(3, job.getStartDate());  // Convert LocalDate to java.sql.Date

            if (job.getEndDate() != null) {
                ps.setDate(4, job.getEndDate());  // Convert LocalDate to java.sql.Date
            } else {
                ps.setNull(4, java.sql.Types.DATE);
            }

            ps.setDouble(5, job.getSalary());
            ps.setString(6, job.getSkillsRequired());
            ps.setString(7, job.getCompanyPicture());

            int rowsAffected = ps.executeUpdate();
            isInserted = rowsAffected > 0;

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return isInserted;
    }
}
