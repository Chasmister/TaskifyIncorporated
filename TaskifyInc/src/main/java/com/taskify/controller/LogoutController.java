package com.taskify.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.taskify.util.CookieUtil;
import com.taskify.util.SessionUtil;

/**
 * Servlet implementation class LogoutController
 */
@WebServlet(asyncSupported = true, urlPatterns = {"/logout"})
public class LogoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CookieUtil.deleteCookie(response, "userType");
	    SessionUtil.invalidateSession(request);
	    System.out.println("logged out");
	   
	    HttpSession session = request.getSession(false); // don't create if it doesn't exist
	    if (session != null) {
	    	
	        session.invalidate(); // removes all session attributes and ends session
	    }else {
	    	System.out.println("session isnt empty");
	    }
	    request.getRequestDispatcher("/WEB-INF/pages/home.jsp").forward(request, response);
	
	}

}
