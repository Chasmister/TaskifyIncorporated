package com.taskify.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.taskify.model.ApplicationModel;
import com.taskify.model.JobModel;
import com.taskify.model.userModel;
import com.taskify.service.ApplicationService;

/**
 * Servlet implementation class myApplications
 */
@WebServlet("/myApplications")
public class myApplications extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ApplicationService applicationService=new ApplicationService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public myApplications() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		  userModel user = (userModel) request.getSession().getAttribute("user"); // Assuming userID is an Integer
          
	            // Fetch job data from the service
		  List<ApplicationModel> ApplicationList=new ArrayList<>();
		try {
			ApplicationList = applicationService.getMyApplications(user);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    
		  // Add the job list to the request
		  request.setAttribute("ApplicationList", ApplicationList);

		  request.getRequestDispatcher("/WEB-INF/pages/myApplications.jsp").forward(request, response);
         
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 try {
		        // 1. Get parameters from the form
		        int jobId = Integer.parseInt(request.getParameter("jobId"));
		        int memberId = Integer.parseInt(request.getParameter("memberid"));
		        int userId = Integer.parseInt(request.getParameter("userid"));

		        // 2. Call the service to create a new application
		     // 2. Call the service to create a new application
		        ApplicationService appService = new ApplicationService();
		        appService.newApplication(memberId, userId, jobId);

		        // 3. Retrieve user from session
		        HttpSession session = request.getSession(false);
		        userModel user = (userModel) session.getAttribute("user");

		        if (user != null) {
		            // 4. Fetch updated applications for this user
		            List<ApplicationModel> applicationList = appService.getMyApplications(user);
		            request.setAttribute("ApplicationList", applicationList);

		            // 5. Forward to the applications.jsp
		            request.getRequestDispatcher("/WEB-INF/pages/applications.jsp").forward(request, response);
		        } else {
		            // If user is not found in session, redirect to login or show error
		            response.sendRedirect("login.jsp");
		        }

		 } catch (Exception e) {
		        e.printStackTrace();
		        // You might want to show an error page or set an error message
		        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Something went wrong while applying.");
		    }
	}

}
