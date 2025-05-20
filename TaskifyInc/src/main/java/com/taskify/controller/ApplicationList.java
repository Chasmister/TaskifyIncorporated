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
            String status = request.getParameter("status"); // "accepted" or "rejected"
            int applicationId = Integer.parseInt(request.getParameter("applicationId"));

            // ✅ Use the instance variable here (not static call)
            boolean changeStatus = applicationService.handleApplications(applicationId, status);

            if (changeStatus) {
                request.setAttribute("message", "Application status updated successfully.");
            } else {
                request.setAttribute("error", "Failed to update application status.");
            }

            // Redirect or forward to the same JSP
            request.getRequestDispatcher("ApplicationList.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to update application.");
        }
    }
}
