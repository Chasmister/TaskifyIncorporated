package com.taskify.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.taskify.service.ManageUserService;
import com.taskify.model.memberModel;
import java.util.ArrayList; // for the list


;


/**
 * Servlet implementation class Job
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/manageuser" })
public class ManageUsersController extends HttpServlet {
	private static final long serialVersionUID = 1L;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageUsersController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            ManageUserService manageUserService = new ManageUserService();
            List<memberModel> userList = manageUserService.getAllUsers();

            request.setAttribute("members", userList);
            System.out.println("User list size: " + userList.size());
            request.getRequestDispatcher("/WEB-INF/pages/manageuser.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to load users.");
        }
    }




	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            int memberId = Integer.parseInt(request.getParameter("memberId"));
            ManageUserService manageUserService = new ManageUserService();
            manageUserService.deleteUserById(memberId);
        }

        // Redirect back to refresh the user list
        response.sendRedirect(request.getContextPath() + "/manageuser");
    }


}
