package com.taskify.controller;

import com.taskify.model.ApplicationModel; // Assuming you have an ApplicationModel class
import com.taskify.service.ApplicationService; // Assuming you have an ApplicationService class that fetches data from DB

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class ApplicationList
 */
@WebServlet(asyncSupported = true, urlPatterns = {"/ApplicationList"})
public class ApplicationList extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ApplicationList() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Integer jobId = Integer.parseInt(request.getParameter("jobId"));
            
            if (jobId == null) {
                response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Job not selected.");
                return;
            }

            ApplicationService applicationService = new ApplicationService();
            List<ApplicationModel> applicationList = applicationService.getApplicationsForJob(jobId);

            request.setAttribute("applicationList", applicationList);
            request.getRequestDispatcher("/WEB-INF/pages/ApplicationList.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Unable to retrieve applications.");
        }
    }

        
    

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
