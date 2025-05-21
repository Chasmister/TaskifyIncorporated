package com.taskify.controller;

import com.taskify.model.ApplicationModel;
import com.taskify.service.ApplicationService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(asyncSupported = true, urlPatterns = {"/ApplicationList"})
public class ApplicationList extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // ✅ Declare instance variable (fixed)
    private ApplicationService applicationService;

    // ✅ Init method to instantiate applicationService (this is what was missing)
    @Override
    public void init() throws ServletException {
        super.init();
        applicationService = new ApplicationService();
    }

    /**
     * Handles GET requests to fetch application list for a job
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String jobIdParam = request.getParameter("jobId");
            
            if (jobIdParam == null) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Job ID not provided.");
                return;
            }

            int jobId = Integer.parseInt(jobIdParam);
            System.out.println("Do get Job ID: " + jobId);

            List<ApplicationModel> applicationList = applicationService.getApplicationsForJob(jobId);

            request.setAttribute("applicationList", applicationList);
            request.getRequestDispatcher("/WEB-INF/pages/ApplicationList.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Unable to retrieve applications.");
        }
    }

    /**
     * Handles POST requests to update application status
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String status = request.getParameter("status"); // "Accepted" or "Rejected"
            System.out.println("Status: " + status);

            // Check if applicationId is present and not empty
            String applicationIdParam = request.getParameter("applicationId");
            if (applicationIdParam != null && !applicationIdParam.trim().isEmpty()) {
                int applicationId = Integer.parseInt(applicationIdParam);
                System.out.println("Application ID: " + applicationId);

                boolean changeStatus = applicationService.handleApplications(applicationId, status);

                if (changeStatus) {
                    request.setAttribute("message", "Application status updated successfully.");
                    request.setAttribute("message", "Status updated.");
                    request.setAttribute("redirectUrl", "myJobs");
                    request.setAttribute("messageType", "success");
                    request.getRequestDispatcher("/WEB-INF/pages/message.jsp").forward(request, response);
                } else {
                    request.setAttribute("error", "Failed to update application status.");
                }
            } else {
                System.out.println("Application ID is missing or empty");
                request.setAttribute("error", "Application ID is missing.");
            }

            // Get jobId from the request and check if it's not empty
            String jobIdParam = request.getParameter("jobId");
            if (jobIdParam != null && !jobIdParam.trim().isEmpty()) {
                int jobId = Integer.parseInt(jobIdParam);
            	
                System.out.println("Job ID: " + jobId);

                // Fetch updated list of applications for the job
                List<ApplicationModel> applicationList = applicationService.getApplicationsForJob(jobId);
                System.out.println(applicationList);
                if (applicationList != null && !applicationList.isEmpty()) {
                    request.setAttribute("applicationList", applicationList);
                    System.out.println("Updated application list fetched: " + applicationList);
                } else {
                    request.setAttribute("error", "No applications found.");
                    System.out.println("No applications found for job ID: " + jobId);
                }
            } else {
                System.out.println("Job ID is missing or empty");
                request.setAttribute("error", "Job ID is missing.");
            }

            // Always forward to the JSP with updated data
            
            request.getRequestDispatcher("/WEB-INF/pages/ApplicationList.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to update application.");
        }
    }



}
