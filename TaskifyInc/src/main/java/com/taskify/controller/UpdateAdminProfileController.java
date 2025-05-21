package com.taskify.controller;

import com.taskify.model.AdminModel;
import com.taskify.service.AdminService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/updateAdminProfile")
public class UpdateAdminProfileController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int userId = Integer.parseInt(request.getParameter("userId"));
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            System.out.print("Update Admin was called");

            AdminModel updatedAdmin = new AdminModel(userId, firstName, lastName, email, password);
            AdminService adminService = new AdminService();
            boolean updated = adminService.updateAdminProfile(updatedAdmin);

            if (updated) {
                request.setAttribute("message", "Profile updated successfully!");
                request.setAttribute("redirectUrl", "adminprofileedit"); 
                request.setAttribute("messageType", "success");
                System.out.print("updated");
            } else {
                request.setAttribute("message", "Failed to update profile.");
                request.setAttribute("messageType", "error");
                System.out.print("Not updated");
            }
            
            
            request.getRequestDispatcher("/WEB-INF/pages/message.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "An error occurred while updating the profile.");
            request.getRequestDispatcher("/WEB-INF/pages/adminprofiledit.jsp").forward(request, response);
        }
    }
}
