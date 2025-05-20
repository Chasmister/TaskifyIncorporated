package com.taskify.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.taskify.model.JobModel;
import com.taskify.service.jobService;

/**
 * Servlet implementation class myJobs
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/myJobs" })
public class myJobs extends HttpServlet {
	private static final long serialVersionUID = 1L;
	jobService jobService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public myJobs() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
       

        if (session == null || session.getAttribute("User_ID") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = (int) session.getAttribute("User_ID");
        System.out.println("User ID: " + userId);


        // Get job list for this user
        jobService jobService = new jobService();
        List<JobModel> myJobList = jobService.getJobsByUserId(userId);
        

        // Set the job list as a request attribute
        request.setAttribute("jobList", myJobList);
        System.out.println("Number of jobs found: " + myJobList.size());

        // Forward to JSP
        request.getRequestDispatcher("/WEB-INF/pages/myJobs.jsp").forward(request, response);
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
