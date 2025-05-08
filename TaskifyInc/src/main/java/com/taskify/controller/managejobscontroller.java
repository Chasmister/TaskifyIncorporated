package com.taskify.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

import com.taskify.model.JobModel;
import com.taskify.model.userModel;
import com.taskify.service.jobService;
import com.taskify.service.ApplicationService;


;


@WebServlet(asyncSupported = true, urlPatterns = { "/managejobs" })
public class managejobscontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final ApplicationService applicationService = new ApplicationService();
    private final jobService jobService = new jobService(); // You'll need to create this if it doesn't exist

       
 

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 try {
             List<JobModel> jobList = jobService.getAllJobs();
             HttpSession session = request.getSession(false);
             userModel user = (userModel) session.getAttribute("user");
   
             request.setAttribute("jobList", jobList);
             request.setAttribute("user", user);
             System.out.println(user);            
             request.getRequestDispatcher("/WEB-INF/pages/managejob.jsp").forward(request, response);
         } catch (Exception e) {
             e.printStackTrace();
             response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to load jobs.");
         }
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}
