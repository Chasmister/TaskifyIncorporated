package com.taskify.util;



import com.taskify.model.userModel;
import com.taskify.model.memberModel;
import com.taskify.model.profileModel;

import jakarta.servlet.http.HttpServletRequest;

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


}
