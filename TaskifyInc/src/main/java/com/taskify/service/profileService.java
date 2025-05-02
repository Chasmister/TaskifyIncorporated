package com.taskify.service;

import com.taskify.config.TaskifyDBconfig;
import com.taskify.model.profileModel;

import java.sql.*;

public class profileService {

    public profileModel createProfile(profileModel profile) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO profiles (occupation, profile_description, display_picture, achievements, experience) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = TaskifyDBconfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            stmt.setString(1, profile.getOccupation());
            stmt.setString(2, profile.getProfileDescription());
            stmt.setString(3, profile.getDisplayPicture());
            stmt.setString(4, profile.getAchievements());
            stmt.setString(5, profile.getExperience());

            int affectedRows = stmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Creating profile failed, no rows affected.");
            }

            try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    profile.setProfileId(generatedKeys.getInt(1));
                }
            }
        }
        return profile;
    }

    public profileModel getProfileById(int userId) throws SQLException, ClassNotFoundException {
        String findProfileIdSql = "SELECT profile_id FROM users_members_profiles WHERE user_id = ?";
        String getProfileSql = "SELECT * FROM profiles WHERE profile_id = ?";
        profileModel profile = null;

        try (Connection conn = TaskifyDBconfig.getDbConnection();
             PreparedStatement findProfileStmt = conn.prepareStatement(findProfileIdSql)) {

            // Step 1: Get profile_id from junction table
            findProfileStmt.setInt(1, userId);
            ResultSet rs1 = findProfileStmt.executeQuery();

            if (rs1.next()) {
                int profileId = rs1.getInt("profile_id");

                // Step 2: Use profile_id to get full profile details
                try (PreparedStatement getProfileStmt = conn.prepareStatement(getProfileSql)) {
                    getProfileStmt.setInt(1, profileId);
                    ResultSet rs2 = getProfileStmt.executeQuery();

                    if (rs2.next()) {
                        profile = new profileModel();
                        profile.setProfileId(rs2.getInt("profile_id"));
                        profile.setOccupation(rs2.getString("profile_occupation"));
                        profile.setProfileDescription(rs2.getString("profile_description"));
                        profile.setDisplayPicture(rs2.getString("display_picture"));
                        profile.setAchievements(rs2.getString("achievements"));
                        profile.setExperience(rs2.getString("experience"));
                    }
                }
            }
        }

        return profile;
    }

    public boolean updateProfile(profileModel profile) throws SQLException, ClassNotFoundException {
        String sql = "UPDATE profiles SET occupation = ?, profile_description = ?, display_picture = ?, achievements = ?, experience = ? WHERE profile_id = ?";

        try (Connection conn = TaskifyDBconfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, profile.getOccupation());
            stmt.setString(2, profile.getProfileDescription());
            stmt.setString(3, profile.getDisplayPicture());
            stmt.setString(4, profile.getAchievements());
            stmt.setString(5, profile.getExperience());
            stmt.setInt(6, profile.getProfileId());

            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;
        }
    }

    public boolean deleteProfile(int profileId) throws SQLException, ClassNotFoundException {
        String sql = "DELETE FROM profiles WHERE profile_id = ?";

        try (Connection conn = TaskifyDBconfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, profileId);
            int rowsDeleted = stmt.executeUpdate();
            return rowsDeleted > 0;
        }
    }
}
