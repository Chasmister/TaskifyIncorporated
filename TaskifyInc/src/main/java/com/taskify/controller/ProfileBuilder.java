package com.taskify.controller;

import com.taskify.model.memberModel;
import com.taskify.model.profileModel;
import com.taskify.model.userModel;
import com.taskify.service.profileService;
import com.taskify.util.RequestModelExtractorUtil;
import com.taskify.util.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@MultipartConfig
@WebServlet(asyncSupported = true, urlPatterns = { "/buildProfile" })
public class ProfileBuilder extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static profileService profileService = new profileService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/BuildProfile.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Session expired or not found.");
            return;
        }

        userModel user = (userModel) session.getAttribute("user");
        memberModel member = (memberModel) session.getAttribute("member");

        if (user == null || member == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "User or member details not found in session.");
            return;
        }

        try {
            profileModel profile = RequestModelExtractorUtil.extractProfileModel(request);
            int userId = user.getuserid();
            int memberId = member.getId();

            int generatedProfileId = profileService.createProfile(profile, userId, memberId);

            if (generatedProfileId > 0) {
                profile.setProfileId(generatedProfileId);
                SessionUtil.setAttribute(request, "profile", profile);
                request.getRequestDispatcher("/WEB-INF/pages/newLoginTest.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Profile creation failed.");
                request.getRequestDispatcher("/WEB-INF/pages/BuildProfile.jsp").forward(request, response);
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error while creating profile.");
            request.getRequestDispatcher("/WEB-INF/pages/BuildProfile.jsp").forward(request, response);
        }
    }
}
