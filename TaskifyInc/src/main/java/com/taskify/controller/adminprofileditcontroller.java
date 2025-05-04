package com.taskify.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.taskify.model.JobModel;
import com.taskify.service.jobService;

;


/**
 * Servlet implementation class Job
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/adminprofileedit" })
public class adminprofileditcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminprofileditcontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
           
            
            // Forward to jobpage.jsp where the jobs will be displayed
            request.getRequestDispatcher("/WEB-INF/pages/adminprofiledit.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            jobService jobService = new jobService();
            List<JobModel> jobList = jobService.getAllJobs();

            // Set the job list as a request attribute
            request.setAttribute("jobs", jobList);

            // Forward to JSP to display one-by-one
            request.getRequestDispatcher("/jobList.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Failed to retrieve jobs: " + e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }
}
