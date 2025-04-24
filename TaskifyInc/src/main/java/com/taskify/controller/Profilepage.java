package com.taskify.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.taskify.model.memberModel;
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
        // Extract the user model from the session
        userModel userModelDetails = (userModel) request.getSession().getAttribute("user");

        // Create the profile model (this will have default values from the constructor)
        profileModel profile = new profileModel();

        // Set attributes before forwarding
        request.setAttribute("profile", profile);
        request.setAttribute("user", userModelDetails); // Don't forget to set the user attribute as well!

        // Print out for debugging purposes
        System.out.println(profile.getDisplayPicture());

        // Forward the request to the profiletest.jsp page for rendering
        request.getRequestDispatcher("/WEB-INF/pages/profiletest.jsp").forward(request, response);
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		userModel user = (userModel) SessionUtil.getAttribute(request, "user");
		memberModel member = (memberModel) SessionUtil.getAttribute(request, "member");
		System.out.println(user);
		if (user != null && member != null) {
		    String username = user.getusername();         // or getFullName(), etc.
		    String email = member.getEmail();
		    String contact = member.getPhonenumber();   // assuming that's the method name

		 

		}
	}

}
