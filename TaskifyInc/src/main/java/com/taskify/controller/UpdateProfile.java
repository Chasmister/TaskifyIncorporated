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

	       

	        //  Get the original profile, member, and user from session (must contain profileId, userId, memberId)
	        HttpSession session = request.getSession(false);
	        profileModel sessionProfile = (profileModel) session.getAttribute("profile");
	        
	        
	      // userModel sessionUser = (userModel) session.getAttribute("user");
	        
	        memberModel sessionMember = (memberModel) session.getAttribute("member");
	        memberModel member = RequestModelExtractorUtil.extractMemberinfo(request, sessionMember);
	        
	      
	        // Extract the updated profile, member, and user data from the request
	        profileModel profile = RequestModelExtractorUtil.extractProfileModel(request);
	        //userModel user = RequestModelExtractorUtil.extractUserInfo(request,sessionUser);
	      

	        if (sessionProfile == null || sessionMember == null) {
	            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "No user, member, or profile found in session.");
	            return;
	        }

	        //  Set the profileId, memberId, and userId on the respective models to be updated
	        profile.setProfileId(sessionProfile.getProfileId());
	        member.setId(sessionMember.getId()); // Assuming member ID is needed for updating
	        //user.setuser_ID(sessionUser.getuserid()); // Assuming user ID is needed for updating

	        // Update the profile, member, and user in the database
	        boolean profileUpdated = profileService.updateProfile(profile);
	        boolean memberUpdated = profileService.updateMemberInfo(member);
	        

	        if (profileUpdated || memberUpdated) {
	            // Refresh session with updated profile, member, and user
	            if (profileUpdated) {
	                session.setAttribute("profile", profile);
	            }
	            if (memberUpdated) {
	                session.setAttribute("member", member);
	            }
	           
	        }

	        request.setAttribute("updateSuccess", true); // Indicate that the update was successful
	        request.getRequestDispatcher("/WEB-INF/pages/profiletest.jsp").forward(request, response);

	    } catch (SQLException | ClassNotFoundException e) {
	        e.printStackTrace();
	        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Profile update failed.");
	    }
	}



}
