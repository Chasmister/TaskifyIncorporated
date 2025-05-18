package com.taskify.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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
@WebServlet(asyncSupported = true, urlPatterns = { "/AddAdmin" })
public class AddAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddAdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
           
            
            // Forward to jobpage.jsp where the jobs will be displayed
            request.getRequestDispatcher("/WEB-INF/pages/AddAdmin.jsp").forward(request, response);
            
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
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String retypePassword = request.getParameter("retypePassword");
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");

            if (!password.equals(retypePassword)) {
                request.setAttribute("error", "Passwords do not match!");
                request.getRequestDispatcher("/WEB-INF/pages/AddAdmin.jsp").forward(request, response);
                return;
            }

            AdminService adminService = new AdminService();
            int userId = adminService.insertUser(username, password); // Create user
            AdminModel newAdmin = new AdminModel(firstName,lastName,email,password); // Create admin
            adminService.insertAdmin(newAdmin); // Insert into admins table

            response.sendRedirect(request.getContextPath() + "/admindashboard");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Failed to add admin: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/pages/AddAdmin.jsp").forward(request, response);
        }
    }
}
