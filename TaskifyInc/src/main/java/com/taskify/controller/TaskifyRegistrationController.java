
package com.taskify.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;


import com.taskify.model.memberModel;
import com.taskify.model.userModel;
import com.taskify.service.taskifyRegisterService;
import com.taskify.util.ValidationUtil;

/**
 * Servlet implementation class registrationController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/register" })
public class TaskifyRegistrationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final taskifyRegisterService taskifyRegistrationService=new taskifyRegisterService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TaskifyRegistrationController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String validationMessage = validateRegistrationForm(request);
			System.out.println(validationMessage);
			if (validationMessage != null) {
	
				request.setAttribute("alertMessage", validationMessage);
				
				handleError(request, response, validationMessage);
				return;
			}
			userModel userModelDetails = extractUserModel(request);
			memberModel memberModelDetails= extractMemberModel(request);
			
			Boolean isAdded=taskifyRegistrationService.registerUserandMember(userModelDetails,memberModelDetails);
			if (isAdded == null) {
				handleError(request, response, "Our server is under maintenance. Please try again later!");
			} else if (isAdded) {
				handleSuccess(request, response, "Your account is successfully created!", "/WEB-INF/pages/login.jsp");
				
			} else {
				handleError(request, response, "Could not register your account. Please try again later!");
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

	private String validateRegistrationForm(HttpServletRequest req) {
		String firstName = req.getParameter("firstName");
		String lastName = req.getParameter("lastName");
		String username = req.getParameter("userName");
		String dobStr = req.getParameter("dob");
		String gender = req.getParameter("gender");
		String email = req.getParameter("email");
		String number = req.getParameter("phoneNumber");
		String password = req.getParameter("password");
		String retypePassword = req.getParameter("retypePassword");

		// Check for null or empty fields first
		if (ValidationUtil.isNullOrEmpty(firstName))
			return "First name is required.";
		if (ValidationUtil.isNullOrEmpty(lastName))
			return "Last name is required.";
		if (ValidationUtil.isNullOrEmpty(username))
			return "Username is required.";
		if (ValidationUtil.isNullOrEmpty(dobStr))
			return "Date of birth is required.";
		if (ValidationUtil.isNullOrEmpty(gender))
			return "Gender is required.";
		if (ValidationUtil.isNullOrEmpty(email))
			return "Email is required.";
		if (ValidationUtil.isNullOrEmpty(number))
			return "Phone number is required.";
		
		if (ValidationUtil.isNullOrEmpty(password))
			return "Password is required.";
		if (ValidationUtil.isNullOrEmpty(retypePassword))
			return "Please retype the password.";

		// Convert date of birth
		LocalDate dob;
		try {
			dob = LocalDate.parse(dobStr);
		} catch (Exception e) {
			return "Invalid date format. Please use YYYY-MM-DD.";
		}

		// Validate fields
		if (!ValidationUtil.isAlphanumericStartingWithLetter(username))
			return "Username must start with a letter and contain only letters and numbers.";
		if (!ValidationUtil.isValidGender(gender))
			
			return "Gender must be 'male' or 'female'.";
		if (!ValidationUtil.isValidEmail(email))
			return "Invalid email format.";
		if (!ValidationUtil.isValidPhoneNumber(number))
			return "Phone number must be 10 digits and start with the digits 98.";
		if (!ValidationUtil.isValidPassword(password))
			return "Password must be at least 8 characters long, with 1 uppercase letter, 1 number, and 1 symbol.";
		if (!ValidationUtil.doPasswordsMatch(password, retypePassword))
			return "Passwords do not match.";

		// Check if the date of birth is at least 16 years before today
		if (!ValidationUtil.isAgeAtLeast16(dob))
			return "You must be at least 16 years old to register.";

		

		return null; // All validations passed
	}

	
	  private userModel extractUserModel(HttpServletRequest req) throws Exception {
	        String username = req.getParameter("userName");
	        String password = req.getParameter("password");
	        return new userModel(username, password);
	    }

	    private memberModel extractMemberModel(HttpServletRequest req) throws Exception {
	        String firstName = req.getParameter("firstName");
	        String lastName = req.getParameter("lastName");
	        LocalDate dob = LocalDate.parse(req.getParameter("dob"));
	        String gender = req.getParameter("gender");
	        String email = req.getParameter("email");
	        String number = req.getParameter("phoneNumber");
	
	        return new memberModel(firstName, lastName, dob, gender, email, number);
	    }
	    private void handleSuccess(HttpServletRequest req, HttpServletResponse resp, String message, String redirectPage)
				throws ServletException, IOException {
			req.setAttribute("success", message);
			req.getRequestDispatcher(redirectPage).forward(req, resp);
		}

		private void handleError(HttpServletRequest req, HttpServletResponse resp, String message)
				throws ServletException, IOException {
			req.setAttribute("error", message);
			req.setAttribute("firstName", req.getParameter("firstName"));
			req.setAttribute("lastName", req.getParameter("lastName"));
			req.setAttribute("username", req.getParameter("username"));
			req.setAttribute("dob", req.getParameter("dob"));
			req.setAttribute("gender", req.getParameter("gender"));
			req.setAttribute("email", req.getParameter("email"));
			req.setAttribute("phoneNumber", req.getParameter("phoneNumber"));
			req.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(req, resp);
		}
}
