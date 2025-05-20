package com.taskify.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.taskify.model.AdminModel;
import com.taskify.model.JobModel;
import com.taskify.service.AdminService;
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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            //  Get user ID from session
        	HttpSession session = request.getSession();
        	Integer userId = (Integer) session.getAttribute("User_ID");

        	if (userId != null) {
        	    AdminService adminService = new AdminService();
        	    AdminModel admin = adminService.getAdminByUserId(userId);
        	    request.setAttribute("admin", admin);
        	}

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
            int userId = Integer.parseInt(request.getParameter("userId"));
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");

            AdminModel admin = new AdminModel();
            admin.setUserId(userId);
            admin.setFirstName(firstName);
            admin.setLastName(lastName);
            admin.setEmail(email);

            AdminService adminService = new AdminService();
            boolean updated = adminService.updateAdminProfile(admin);

            if (updated) {
                request.setAttribute("message", "Profile updated successfully.");
                System.out.print("Updated");
            } else {
                request.setAttribute("message", "Failed to update profile.");
                System.out.print("Not updated");
            }

            // Reload updated admin data and forward
            AdminModel updatedAdmin = adminService.getAdminByUserId(userId);
            request.setAttribute("admin", updatedAdmin);

            request.getRequestDispatcher("/WEB-INF/pages/adminprofiledit.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error updating profile.");
            request.getRequestDispatcher("/WEB-INF/pages/adminprofiledit.jsp").forward(request, response);
        }
    }
}
