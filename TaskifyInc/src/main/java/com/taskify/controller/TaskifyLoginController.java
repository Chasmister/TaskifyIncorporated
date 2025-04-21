
package com.taskify.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.taskify.model.memberModel;
import com.taskify.model.userModel;
import com.taskify.service.taskifyLoginService;
import com.taskify.service.taskifyRegisterService;
import com.taskify.util.CookieUtil;
import com.taskify.util.SessionUtil;

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
			userModel userModelDetails = extractUserModel(request);
			
			//verify the user for login
			
			boolean loggedin=taskifyLoginService.verifyuser(userModelDetails);
			//System.out.println(loggedin);
			if(loggedin==true) {
				SessionUtil.setAttribute(request,"userName",userModelDetails.getusername());
				boolean memberuser=taskifyLoginService.checkusertype(userModelDetails);
						
				if(memberuser==true) {
					CookieUtil.addCookie(response, "userType", "NON-ADMIN", 5*30);
					request.getRequestDispatcher("/WEB-INF/pages/home.jsp").forward(request, response);
					
				}else {
					CookieUtil.addCookie(response, "userType", "ADMIN", 5*30);
					request.getRequestDispatcher("/WEB-INF/pages/admindashboard.jsp").forward(request, response);
						
				}
				
			}
		
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	private userModel extractUserModel(HttpServletRequest req) throws Exception {
        String username = req.getParameter("userName");
        String password = req.getParameter("password");
        return new userModel(username, password);
    }

	
}
