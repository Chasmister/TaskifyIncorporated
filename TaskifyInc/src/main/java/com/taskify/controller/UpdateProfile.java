package com.taskify.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

import com.taskify.model.memberModel;
import com.taskify.model.profileModel;
import com.taskify.model.userModel;
import com.taskify.service.profileService;
import com.taskify.util.RequestModelExtractorUtil;


@MultipartConfig
@WebServlet(asyncSupported = true, urlPatterns = {"/updateProfile"})
public class UpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	profileModel profile;
	profileService profileService;
       

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		  request.getRequestDispatcher("/WEB-INF/pages/profiletest.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    try {
	        profileService = new profileService();

	        HttpSession session = request.getSession(false);
	        if (session == null) {
	            response.sendRedirect("login.jsp");
	            return;
	        }

	        profileModel sessionProfile = (profileModel) session.getAttribute("profile");
	        memberModel sessionMember = (memberModel) session.getAttribute("member");

	        profileModel profile = RequestModelExtractorUtil.extractProfileModel(request);
	        memberModel member = RequestModelExtractorUtil.extractMemberinfo(request);

	        if (sessionProfile == null || sessionMember == null) {
	            request.setAttribute("errorMessage", "Session expired. Please log in again.");
	            request.getRequestDispatcher("/WEB-INF/pages/profiletest.jsp").forward(request, response);
	            return;
	        }

	        profile.setProfileId(sessionProfile.getProfileId());
	        member.setId(sessionMember.getId());

	        boolean profileUpdated = profileService.updateProfile(profile);
	        boolean memberUpdated = profileService.updateMemberInfo(member);

	        if (profileUpdated || memberUpdated) {
	            if (profileUpdated) session.setAttribute("profile", profile);
	            if (memberUpdated) session.setAttribute("member", member);
	            request.setAttribute("updateSuccess", true);
	        }

	    } catch (SQLException sqlEx) {
	        if (sqlEx.getMessage().contains("Data too long")) {
	            request.setAttribute("errorMessage", "One of the fields has too much data. Please shorten the input.");
	        } else {
	            request.setAttribute("errorMessage", "A database error occurred: " + sqlEx.getMessage());
	        }
	        sqlEx.printStackTrace();
	    } catch (Exception e) {
	        request.setAttribute("errorMessage", "An unexpected error occurred: " + e.getMessage());
	        e.printStackTrace();
	    }

	    // Always forward to the JSP so it shows messages
	    request.getRequestDispatcher("/WEB-INF/pages/profiletest.jsp").forward(request, response);
	}




}
