package com.taskify.controller;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

import com.taskify.model.JobModel;
import com.taskify.model.userModel;
import com.taskify.service.ApplicationService;
import com.taskify.service.jobService;
import com.taskify.service.MemberService;

@WebServlet("/jobs")
public class JobsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final ApplicationService applicationService = new ApplicationService();
    private final jobService jobService = new jobService(); // You'll need to create this if it doesn't exist
    private final MemberService memberService = new MemberService(); // Likewise

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
        	 HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("User_ID") == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            Integer userId = (Integer) session.getAttribute("User_ID");
            
            String keyword = request.getParameter("keyword");
            
            List<JobModel> jobList = jobService.getAllJobs(userId);
            //System.out.println(jobList.size());
            if(keyword != null && !keyword.trim().isEmpty()) {
            	System.out.println("Searching all jobs with keyword: " + keyword);
            	jobList = jobService.searchAllJobs(keyword);
            } else {
            	jobList = jobService.getAllJobs(userId);
            }

            userModel user = (userModel) session.getAttribute("user");

            request.setAttribute("jobList", jobList);
            request.setAttribute("user", user);
            request.setAttribute("member", memberService.getMemberById(user.getuserID())); // adjust based on your model

            request.getRequestDispatcher("/WEB-INF/pages/jobpage2.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to load jobs.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int jobId = Integer.parseInt(request.getParameter("jobId"));
            int memberId = Integer.parseInt(request.getParameter("memberid"));
            int userId = Integer.parseInt(request.getParameter("userid"));

            applicationService.newApplication(memberId, userId, jobId);

            // Reload job list and return to job listings page
            HttpSession session = request.getSession(false);
            userModel user = (userModel) session.getAttribute("user");

            if (user != null) {
                List<JobModel> jobList = jobService.getAllJobs();
                request.setAttribute("jobList", jobList);
                request.setAttribute("user", user);
                request.setAttribute("member", memberService.getMemberById(memberId));
                
                
                request.setAttribute("message", "Successful Application");
                request.setAttribute("redirectUrl", "myApplications");
                request.setAttribute("messageType", "success");
                request.getRequestDispatcher("/WEB-INF/pages/message.jsp").forward(request, response);
           

                
            } else {
                response.sendRedirect("login.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Something went wrong while applying.");
        }
    }
}
