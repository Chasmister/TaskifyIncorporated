package com.taskify.controller;

import com.taskify.model.JobModel;
import com.taskify.service.jobService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/editjob")
public class EditJobController extends HttpServlet {
    private final jobService jobService = new jobService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int jobId = Integer.parseInt(request.getParameter("jobId"));
        JobModel job = jobService.getJobModelById(jobId);
        request.setAttribute("job", job);
        request.getRequestDispatcher("/WEB-INF/pages/editjob.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int jobId = Integer.parseInt(request.getParameter("jobId"));
        String jobName = request.getParameter("jobName");
        String jobDescription = request.getParameter("jobDescription");
        java.sql.Date startDate = java.sql.Date.valueOf(request.getParameter("startDate"));
        java.sql.Date endDate = java.sql.Date.valueOf(request.getParameter("endDate"));
        double salary = Double.parseDouble(request.getParameter("salary"));
        String skillsRequired = request.getParameter("skillsRequired");
        String companyPicture = request.getParameter("companyPicture");

        JobModel updatedJob = new JobModel(jobId, jobName, jobDescription, startDate, endDate, salary, skillsRequired, companyPicture);
        jobService.updateJob(updatedJob);

        response.sendRedirect(request.getContextPath() + "/managejobs");
    }
}
