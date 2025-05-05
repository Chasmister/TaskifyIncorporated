package com.taskify.service;

import com.taskify.config.TaskifyDBconfig;
import com.taskify.model.memberModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

public class MemberService {

    public memberModel getMemberById(int memberId) {
        memberModel member = null;

        String query = "SELECT * FROM members WHERE Member_ID = ?";

        try (Connection connection = TaskifyDBconfig.getDbConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {

            ps.setInt(1, memberId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                member = new memberModel(
                        rs.getString("firstName"),
                        rs.getString("lastName"),
                        rs.getDate("dob").toLocalDate(),
                        rs.getString("gender"),
                        rs.getString("email"),
                        rs.getString("phonenumber")
                );

                member.setId(rs.getInt("id"));
                member.setPassword(rs.getString("password"));
                member.setUser_ID(rs.getInt("User_ID"));
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace(); // Replace with logging in production
        }

        return member;
    }
}
