
package com.taskify.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.ResultSet;

import com.taskify.model.AdminModel;
import com.taskify.model.memberModel;
import com.taskify.model.profileModel;
import com.taskify.model.userModel;
import com.taskify.service.profileService;
import com.taskify.service.taskifyLoginService;
import com.taskify.service.taskifyRegisterService;
import com.taskify.util.CookieUtil;
import com.taskify.util.SessionUtil;
import com.taskify.util.RequestModelExtractorUtil;

/**
 * Servlet implementation class login
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/login" })
public class TaskifyLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final taskifyLoginService taskifyLoginService=new taskifyLoginService();
    
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TaskifyLoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/pages/newLoginTest.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			userModel userModelDetails = RequestModelExtractorUtil.extractUserModel(request);
			//memberModel memberModelDetails=RequestModelExtractorUtil.extractMemberModel(request);
			
			
			
			//verify the user for login
			
			//to change
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
                
                //checking user type
                String usertype=taskifyLoginService.checkusertype(userModelDetails);
              
               

                // Retrieve user type and profile
                String memberUserType = taskifyLoginService.checkusertype(userModelDetails);
                

                // Store user type in session and cookie
                if ("NON-ADMIN".equals(memberUserType)) {
                	 memberModel memberInfo = taskifyLoginService.getuserinfo(userId);
                	 profileModel profile = new profileService().getProfileById(userId);
                     SessionUtil.setAttribute(request, "profile", profile);
                     SessionUtil.setAttribute(request, "member", memberInfo);
                     SessionUtil.setAttribute(request, "Member_ID", memberInfo.getId());
                    CookieUtil.addCookie(response, "userType", "NON-ADMIN", 30 * 60);
                    session.setAttribute("userType", "NON-ADMIN");

                    // ✅ Show message page with OK button
                    request.setAttribute("message", "Login successful!");
                    request.setAttribute("redirectUrl", "home"); // use your actual redirect path
                    request.setAttribute("messageType", "success");
                    request.getRequestDispatcher("/WEB-INF/pages/home.jsp").forward(request, response);
                } else if ("ADMIN".equals(memberUserType)) {
                	AdminModel memberInfo = taskifyLoginService.getadmininfo(userId);
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
