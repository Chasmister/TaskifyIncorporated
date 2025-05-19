package com.taskify.controller;

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
import com.taskify.service.profileService;
import com.taskify.service.taskifyLoginService;
import com.taskify.util.CookieUtil;
import com.taskify.util.SessionUtil;
import com.taskify.util.RequestModelExtractorUtil;

@WebServlet(asyncSupported = true, urlPatterns = { "/login" })
public class TaskifyLoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final taskifyLoginService taskifyLoginService = new taskifyLoginService();

    public TaskifyLoginController() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the session from the request
        HttpSession session = request.getSession(false);  // Don't create a new session if it doesn't exist

        // Check if the user is already logged in
        if (session != null && session.getAttribute("user") != null) {
            // If the user is logged in, get the user type from the session
            String userType = (String) session.getAttribute("userType");
            
            // Redirect the user to the appropriate page based on user type
            if ("ADMIN".equals(userType)) {
                response.sendRedirect("/admindashboard");  // Redirect to admin dashboard
            } else {
                response.sendRedirect("/home");  // Redirect to home page for non-admin
            }
            return;  // Exit early to avoid showing the login page again
        }

        // If the user is not logged in, display the login page
        request.getRequestDispatcher("/WEB-INF/pages/newLoginTest.jsp").forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Extract the user model from the request
            userModel userModelDetails = RequestModelExtractorUtil.extractUserModel(request);

            // Verify the user credentials for login
            boolean loggedin = taskifyLoginService.verifyuser(userModelDetails);
            System.out.println(loggedin);            
            if (loggedin==true) {
                // Set session timeout to 100 minutes (6000 seconds)
                HttpSession session = request.getSession();  // Get the session object
                session.setMaxInactiveInterval(100 * 60);  // 100 minutes = 6000 seconds

                // Save the user details and member information in the session
                SessionUtil.setAttribute(request, "user", userModelDetails);
                SessionUtil.setAttribute(request,"User_ID", userModelDetails.getuserID());


                int userId = userModelDetails.getuserid();
                memberModel memberInfo = taskifyLoginService.getuserinfo(userId);
                SessionUtil.setAttribute(request, "member", memberInfo);

                // Retrieve user type and profile
                String memberUserType = taskifyLoginService.checkusertype(userModelDetails);
                profileModel profile = new profileService().getProfileById(userId);
                SessionUtil.setAttribute(request, "profile", profile);

                // Store user type in session and cookie
                if ("NON-ADMIN".equals(memberUserType)) {
                    CookieUtil.addCookie(response, "userType", "NON-ADMIN", 30 * 60);
                    session.setAttribute("userType", "NON-ADMIN");

                    // ✅ Show message page with OK button
                    request.setAttribute("message", "Login successful!");
                    request.setAttribute("redirectUrl", "home"); // use your actual redirect path
                    request.setAttribute("messageType", "success");
                    request.getRequestDispatcher("/WEB-INF/pages/home.jsp").forward(request, response);

                } else if ("ADMIN".equals(memberUserType)) {
                    CookieUtil.addCookie(response, "userType", "ADMIN", 30 * 60);
                    session.setAttribute("userType", "ADMIN");

                    request.setAttribute("message", "Welcome Admin!");
                    request.setAttribute("redirectUrl", "admindashboard");
                    request.setAttribute("messageType", "success");
                    request.getRequestDispatcher("/WEB-INF/pages/admindashboard.jsp").forward(request, response);

                } else {
                    request.setAttribute("message", "Invalid user type.");
                    request.setAttribute("redirectUrl", "login");
                    request.setAttribute("messageType", "error");
                    request.getRequestDispatcher("/WEB-INF/pages/message.jsp").forward(request, response);
                }

                
            } else {
            	
            	request.setAttribute("message", "Incorrect login details, try again.");
                request.setAttribute("redirectUrl", "login");
                request.setAttribute("messageType", "error");
                // If login fails, stay on the login page and show an error message
                request.getRequestDispatcher("/WEB-INF/pages/message.jsp").forward(request, response);
            }

        } catch (Exception e) {
            // Handle any exceptions here
            e.printStackTrace();
        }
    }
}
