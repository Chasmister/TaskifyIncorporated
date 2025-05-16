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

@WebServlet(asyncSupported = true, urlPatterns = {"/logout"})
public class LogoutController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Delete the userType cookie
        CookieUtil.deleteCookie(response, "userType");

        // Invalidate the session (removes all attributes)
        SessionUtil.invalidateSession(request);
        System.out.println("User logged out successfully");

        // Optionally, check if the session was null and log it
        HttpSession session = request.getSession(false); // Don't create a new session if it doesn't exist
        if (session != null) {
            session.invalidate(); // This removes all session attributes and ends the session
            System.out.println("Session invalidated");
        } else {
            System.out.println("No session found");
        }

        // Redirect the user to the home page (or wherever is appropriate)
        response.sendRedirect(request.getContextPath() + "/home"); // Or redirect to a specific page
    }
}
