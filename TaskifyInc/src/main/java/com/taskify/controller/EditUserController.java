package com.taskify.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import com.taskify.service.ManageUserService;
import com.taskify.model.memberModel;
import java.util.ArrayList; // for the list


;


/**
 * Servlet implementation class Job
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/edituser" })

public class EditUserController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final ManageUserService manageUserService = new ManageUserService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int memberId = Integer.parseInt(request.getParameter("memberId"));
        memberModel member = manageUserService.getMemberById(memberId);

        request.setAttribute("member", member);
        request.getRequestDispatcher("/WEB-INF/pages/edituser.jsp").forward(request, response);
    }





	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int memberId = Integer.parseInt(request.getParameter("memberId"));
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String gender = request.getParameter("gender");
        String dobString = request.getParameter("dob");

        LocalDate dob = null;
        if (dobString != null && !dobString.isEmpty()) {
            dob = LocalDate.parse(dobString); // Ensure format is yyyy-MM-dd
        }

        // ✅ Call the updated method with gender and dob included
        manageUserService.updateUser(memberId, firstName, lastName, email, phone, gender, dob);
        
        request.setAttribute("message", "User Details Updated!");
        request.setAttribute("redirectUrl", "manageuser"); // redirect path
        request.setAttribute("messageType", "success");
        request.getRequestDispatcher("/WEB-INF/pages/message.jsp").forward(request, response);
    }



}
