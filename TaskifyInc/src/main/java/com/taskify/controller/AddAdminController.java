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
import com.taskify.util.PasswordUtil;
import com.taskify.util.ValidationUtil;

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

        	// Validate fields
        	if (ValidationUtil.isNullOrEmpty(username) ||
        	    ValidationUtil.isNullOrEmpty(password) ||
        	    ValidationUtil.isNullOrEmpty(retypePassword) ||
        	    ValidationUtil.isNullOrEmpty(firstName) ||
        	    ValidationUtil.isNullOrEmpty(lastName) ||
        	    ValidationUtil.isNullOrEmpty(email)) {

        	    request.setAttribute("message", "Please fill in all the fields.");
        	    request.setAttribute("redirectUrl", "AddAdmin"); // your JSP or controller path
        	    request.setAttribute("messageType", "error");
        	    request.getRequestDispatcher("/WEB-INF/pages/message.jsp").forward(request, response);
        	    return;
        	}
         
            
    		if (!ValidationUtil.isAlphanumericStartingWithLetter(username)) {
    			request.setAttribute("message", "Username must start with a letter and contain only letters and numbers");
                request.setAttribute("redirectUrl", "AddAdmin"); // redirect path
                request.setAttribute("messageType", "error");
                request.getRequestDispatcher("/WEB-INF/pages/message.jsp").forward(request, response);
                return;
    		}
    			
    		if (!ValidationUtil.isValidEmail(email)) {
    			request.setAttribute("message", "Invalid Email Format");
                request.setAttribute("redirectUrl", "AddAdmin"); // redirect path
                request.setAttribute("messageType", "error");
                request.getRequestDispatcher("/WEB-INF/pages/message.jsp").forward(request, response);
                return;
    		}

    			
    		if (!ValidationUtil.isValidPassword(password)) {
    			request.setAttribute("message", "Password must be at least 8 characters long, with 1 uppercase letter, 1 number, and 1 symbol.");
                request.setAttribute("redirectUrl", "AddAdmin"); // redirect path
                request.setAttribute("messageType", "error");
                request.getRequestDispatcher("/WEB-INF/pages/message.jsp").forward(request, response);
                return;
    		}
    			
    		if (!ValidationUtil.doPasswordsMatch(password, retypePassword)) {
    			request.setAttribute("message", "Passwords Do not Match");
                request.setAttribute("redirectUrl", "AddAdmin"); // redirect path
                request.setAttribute("messageType", "error");
                request.getRequestDispatcher("/WEB-INF/pages/message.jsp").forward(request, response);
                return;
    		}

    		AdminService adminService = new AdminService();

    		// Insert into users table
    		String encryptedPassword = PasswordUtil.encrypt(username, password);
    		int userId = adminService.insertUser(username, encryptedPassword);

    		//  Create AdminModel object with encrypted password
    		AdminModel newAdmin = new AdminModel(userId, firstName, lastName, email, encryptedPassword);

    		// Insert into admin table
    		int adminId = adminService.insertAdmin(newAdmin);

    		// Link user and admin
    		adminService.insertUserAdminLink(userId, adminId);
            
            
            request.setAttribute("message", "New Admin added!");
            request.setAttribute("redirectUrl", "admindashboard"); // redirect path
            request.setAttribute("messageType", "success");
            request.getRequestDispatcher("/WEB-INF/pages/message.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Failed to add admin: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/pages/AddAdmin.jsp").forward(request, response);
        }
    }
}
