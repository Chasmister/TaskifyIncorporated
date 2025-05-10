
package com.taskify.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;

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
			
			boolean loggedin=taskifyLoginService.verifyuser(userModelDetails);
			//System.out.println(loggedin);
			if(loggedin==true) {
				// Set the session timeout to 100 minutes (6000 seconds)
	            request.getSession().setMaxInactiveInterval(100 * 60); // 100 minutes = 6000 seconds
	            
				SessionUtil.setAttribute(request, "user", userModelDetails);
				
				int userid=userModelDetails.getuserid();
				
				memberModel memberinfo=taskifyLoginService.getuserinfo(userid);
				
				SessionUtil.setAttribute(request,"member",memberinfo);
				

				
				String memberuser=taskifyLoginService.checkusertype(userModelDetails);
				
				profileModel profile = new profileService().getProfileById(userid);  // Assuming you have this method
				SessionUtil.setAttribute(request, "profile", profile);
				
				
				

				if(memberuser.equals("NON-ADMIN")) {
					CookieUtil.addCookie(response, "userType", "NON-ADMIN", 30*60);
					
					request.getRequestDispatcher("/WEB-INF/pages/home.jsp").forward(request, response);
					
				}else if(memberuser.equals("ADMIN")){
					CookieUtil.addCookie(response, "userType", "ADMIN", 30*60);
					
					request.getRequestDispatcher("/WEB-INF/pages/admindashboard.jsp").forward(request, response);
						
				}else {
					System.out.println("ERROR");
				}
				
			}else {
				request.getRequestDispatcher("/WEB-INF/pages/newLoginTest.jsp").forward(request, response);
				
			}
		
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	

	
}
