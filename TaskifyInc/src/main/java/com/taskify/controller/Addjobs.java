package com.taskify.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.sql.Date;

import com.taskify.model.JobModel;
import com.taskify.service.jobService;
import com.taskify.util.ImageUtil;

/**
 * Servlet implementation class Addjobs
 */
@MultipartConfig
@WebServlet(asyncSupported = true, urlPatterns = { "/addjobs" })
public class Addjobs extends HttpServlet {
    private static final long serialVersionUID = 1L;
    HttpSession HttpSession;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addjobs() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forward to the job form page
        request.getRequestDispatcher("/WEB-INF/pages/addjobs.jsp").forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
        	
            // 1. Get form data
            String jobTitle = request.getParameter("jobTitle");
            String companyName = request.getParameter("companyName");
            String jobDescription = request.getParameter("jobDescription");
            String location = request.getParameter("location"); // Optional
            String jobType = request.getParameter("jobType");
            double salary = Double.parseDouble(request.getParameter("salary"));
            Date startDate = Date.valueOf(request.getParameter("startDate"));

            String endDateStr = request.getParameter("endDate");
            Date endDate = null;
            if (endDateStr != null && !endDateStr.isEmpty()) {
                endDate = Date.valueOf(endDateStr);
            }
         
            // Get the session and check if it's valid
            HttpSession session = request.getSession(false);  // false means it won't create a new session if one doesn't exist
            
            if (session == null) {
                // No session exists, redirect to login page
                response.sendRedirect(request.getContextPath() + "/login");
                return;
            }
            System.out.println(session);
            // Get user info from session
            Integer userid = (Integer) session.getAttribute("User_ID");
            Integer memberid = (Integer) session.getAttribute("Member_ID");
            System.out.println(userid);
            System.out.println(memberid);
            System.out.println("here its working hai");
            if (userid == null || memberid == null) {
                // Session does not have the necessary attributes, redirect to login page
                response.sendRedirect(request.getContextPath() + "/login");
                return;
            }

            // Get other form data
            String skills = request.getParameter("skills");  // Should be comma-separated
            
            // 2. Handle image upload using ImageUtil
            Part logoPart = request.getPart("companyLogo");
            ImageUtil imageUtil = new ImageUtil();
            String imageName = imageUtil.getImageNameFromPart(logoPart);

            boolean uploaded = imageUtil.uploadImage(logoPart, "", "logos");
            if (!uploaded) {
                throw new IOException("Image upload failed.");
            }

            // 3. Create JobModel object
            JobModel job = new JobModel(0, jobTitle, jobDescription, startDate, endDate, salary, skills, imageName);
            System.out.println("its working till here");
            // 4. Use the service to add the job
            jobService jobService = new jobService();
            boolean isJobAdded = jobService.registerJob(job, userid, memberid);

            if (isJobAdded) {
                // If the job is added successfully, redirect to myJobs page
                request.setAttribute("message", "Job successfully added!");
                response.sendRedirect(request.getContextPath() + "/myJobs");
            } else {
                // If the job wasn't added successfully, show an error message
                request.setAttribute("error", "Failed to post job.");
                request.getRequestDispatcher("/WEB-INF/pages/addjobs.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            // In case of any exception, forward the error message to the form
            request.setAttribute("error", "Failed to post job: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/pages/addjobs.jsp").forward(request, response);
        }
    }

}
