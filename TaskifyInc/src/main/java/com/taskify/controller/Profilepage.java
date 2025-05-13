package com.taskify.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.taskify.model.profileModel;
import com.taskify.model.userModel;
import com.taskify.service.taskifyLoginService;
import com.taskify.util.RequestModelExtractorUtil;
import com.taskify.util.SessionUtil;

/**
 * Servlet implementation class Profilepage
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/profile" })
public class Profilepage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Profilepage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/pages/profiletest.jsp").forward(request, response);
		 // Extract the user model from the session
        userModel userModelDetails = (userModel) request.getSession().getAttribute("user");
        //request.setAttribute("profile", new profileModel());


        // If user is found in session, forward the user details to the profile page
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String popupAction = request.getParameter("popupAction");

	        if ("show".equals(popupAction)) {
	            request.setAttribute("showEditPopup", true);
	        }

	        // Set other necessary data (user/member/profile) here...

	        request.getRequestDispatcher("/WEB-INF/pages/profiletest.jsp").forward(request, response);
	    }

}
