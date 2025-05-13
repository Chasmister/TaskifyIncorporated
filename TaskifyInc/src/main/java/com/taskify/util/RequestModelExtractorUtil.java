package com.taskify.util;



import com.taskify.model.userModel;
import com.taskify.model.memberModel;
import com.taskify.model.profileModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;


public class RequestModelExtractorUtil {

    public static userModel extractUserModel(HttpServletRequest req) {
        String username = req.getParameter("userName");
        String password = req.getParameter("password");
        return new userModel(username, password);
    }

    public static memberModel extractMemberModel(HttpServletRequest req) {
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        LocalDate dob = LocalDate.parse(req.getParameter("dob"));
        String gender = req.getParameter("gender");
        String email = req.getParameter("email");
        String number = req.getParameter("phoneNumber");

        return new memberModel(firstName, lastName, dob, gender, email, number);
    }
    public static memberModel extractMemberModel(memberModel memberobj) {
        String firstName = memberobj.getFirstName();
        String lastName = memberobj.getLastName();
        LocalDate dob = memberobj.getDob();
        String gender = memberobj.getGender();
        String email = memberobj.getEmail();
        String number = memberobj.getPhonenumber();

        return new memberModel(firstName, lastName, dob, gender, email, number);
    }
    
    public static memberModel extractMemberModel(ResultSet rs) throws SQLException {
        memberModel member = new memberModel(
            rs.getString("Member_FirstName"),
            rs.getString("Member_LastName"),
            rs.getDate("Member_DOB") != null ? rs.getDate("Member_DOB").toLocalDate() : null,
            rs.getString("Member_Gender"),
            rs.getString("Member_Email"),
            rs.getString("Member_ContactNumber")
        );

        // Set the primary key (auto-incremented Member_ID) and the User_ID
        member.setId(rs.getInt("Member_ID"));        // Member's primary key
        member.setUser_ID(rs.getInt("User_ID"));     // Links to the User table

        return member;
    }
    public static memberModel extractMemberinfo(HttpServletRequest req, memberModel existingMember) {
        // Extracting the email and contact number from the request
        String email = req.getParameter("email");
        String contactNumber = req.getParameter("phonenumber");

        // Preserve the existing values for the other fields (firstName, lastName, dob, gender)
        String firstName = existingMember.getFirstName();
        String lastName = existingMember.getLastName();
        LocalDate dob = existingMember.getDob();
        String gender = existingMember.getGender();

        // If the email or contactNumber is provided in the request, update the respective fields
        if (email != null && !email.isEmpty()) {
            existingMember.setEmail(email);
        }
        if (contactNumber != null && !contactNumber.isEmpty()) {
            existingMember.setPhonenumber(contactNumber);
        }

        // Return the updated member object
        return existingMember;
    }
    public static userModel extractUserInfo(HttpServletRequest req, userModel existingUser) {
        // Extract username from request
        String userName = req.getParameter("username");

        // Update only if a new username is provided
        if (userName != null && !userName.trim().isEmpty()) {
       
            existingUser = new userModel(userName, existingUser.getpassword());
            existingUser.setuser_ID(existingUser.getuserid()); // Retain user ID
            existingUser.setusertype("NON-ADMIN"); // Always NON-ADMIN
        }

        return existingUser;
    }


    public static profileModel extractProfileModel(HttpServletRequest request) throws SQLException {
        String occupation = request.getParameter("Occupation");
        String description = request.getParameter("Description");
        String experience = request.getParameter("Experience");
        String achievements = request.getParameter("Achievements");
        String skills = request.getParameter("Skills");
        System.out.println("Inside extractProfileModel");
        int profileId = 0;
        try {
            String idParam = request.getParameter("profileId");
            if (idParam != null && !idParam.isEmpty()) {
                profileId = Integer.parseInt(idParam);
            }
        } catch (NumberFormatException e) {
            System.err.println("Invalid profileId format: " + e.getMessage());
        }

        try {
            Part imagePart = request.getPart("profilepicture");
            
            ImageUtil imageUtil = new ImageUtil();
            String imageName = imageUtil.getImageNameFromPart(imagePart);
            System.out.println("lolol");
            System.out.println(imagePart);
            System.out.println(imageName);

            boolean uploaded = imageUtil.uploadImage(imagePart, "", "logos");
            if (!uploaded) {
            	System.out.println("lolol");
                throw new IOException("Image upload failed.");
            }

            return new profileModel(profileId, occupation, description, imageName, skills, achievements, experience);

        } catch (IOException | ServletException e) {
            e.printStackTrace();
        }

        return new profileModel(profileId, occupation, description, "default.jpg", skills, achievements, experience);
    }
    


}
