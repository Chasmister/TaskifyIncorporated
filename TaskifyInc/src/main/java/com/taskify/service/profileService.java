package com.taskify.service;

import com.taskify.config.TaskifyDBconfig;
import com.taskify.model.memberModel;
import com.taskify.model.profileModel;
import com.taskify.model.userModel;

import java.sql.*;

public class profileService {
    private Connection dbConn;

    public profileService() {
        try {
            this.dbConn = TaskifyDBconfig.getDbConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            System.err.println("Database connection error: " + ex.getMessage());
            ex.printStackTrace();
        }
    }

    // Create profile (no changes needed here, already handles displayPicture well)
    public int createProfile(profileModel profile, int userId, int memberId) throws SQLException, ClassNotFoundException {
        String profileSql = "INSERT INTO profiles (profile_Occupation, Profile_Description, Display_Picture, profile_Skills, Achievements, Experience) " +
                            "VALUES (?, ?, ?, ?, ?, ?)";

        String mappingSql = "INSERT INTO Users_Members_Profiles(Profile_Id, User_Id, Member_Id) VALUES (?, ?, ?)";

        try (Connection conn = TaskifyDBconfig.getDbConnection();
             PreparedStatement profilePs = conn.prepareStatement(profileSql, Statement.RETURN_GENERATED_KEYS)) {

            // Set parameters for profile insertion
            profilePs.setString(1, profile.getOccupation());
            profilePs.setString(2, profile.getProfileDescription());
            profilePs.setString(3, profile.getDisplayPicture()); // We use the displayPicture from the model
            profilePs.setString(4, profile.getSkills());
            profilePs.setString(5, profile.getAchievements());
            profilePs.setString(6, profile.getExperience());

            int profileRows = profilePs.executeUpdate();

            if (profileRows > 0) {
                try (ResultSet rs = profilePs.getGeneratedKeys()) {
                    if (rs.next()) {
                        int profileId = rs.getInt(1); // Auto-generated profileId
                        profile.setProfileId(profileId); // Set it on the model

                        // Now insert into the mapping table
                        try (PreparedStatement mappingPs = conn.prepareStatement(mappingSql)) {
                            mappingPs.setInt(1, profileId);
                            mappingPs.setInt(2, userId);
                            mappingPs.setInt(3, memberId);

                            int mappingRows = mappingPs.executeUpdate();
                            if (mappingRows > 0) {
                                return profileId; // Success
                            }
                        }
                    }
                }
            }
        }

        return -1; // Error
    }

    // Retrieve profile by userId (No changes needed here)
    public profileModel getProfileById(int userId) throws SQLException, ClassNotFoundException {
        String findProfileIdSql = "SELECT profile_id FROM users_members_profiles WHERE user_id = ?";
        String getProfileSql = "SELECT * FROM profiles WHERE profile_id = ?";
        profileModel profile = null;

        try (Connection conn = TaskifyDBconfig.getDbConnection();
             PreparedStatement findProfileStmt = conn.prepareStatement(findProfileIdSql)) {

            findProfileStmt.setInt(1, userId);
            ResultSet rs1 = findProfileStmt.executeQuery();
            System.out.println("worked 1");

            if (rs1.next()) {
                int profileId = rs1.getInt("profile_id");
                System.out.println("worked 2");
                try (PreparedStatement getProfileStmt = conn.prepareStatement(getProfileSql)) {
                    getProfileStmt.setInt(1, profileId);
                    ResultSet rs2 = getProfileStmt.executeQuery();

                    if (rs2.next()) {
                    	 System.out.println("worked 3");
                        profile = new profileModel();
                        profile.setProfileId(rs2.getInt("profile_id"));
                        profile.setOccupation(rs2.getString("profile_occupation"));
                        profile.setSkills(rs2.getString("profile_skills"));
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
        // First, get the current profile from the database using profileId
        String getCurrentDisplayPicSql = "SELECT display_picture FROM profiles WHERE profile_id = ?";
        
        String currentDisplayPicture = null;
        try (Connection conn = TaskifyDBconfig.getDbConnection();
             PreparedStatement stmtGetCurrentPic = conn.prepareStatement(getCurrentDisplayPicSql)) {

            stmtGetCurrentPic.setInt(1, profile.getProfileId());
            ResultSet rs = stmtGetCurrentPic.executeQuery();

            if (rs.next()) {
                currentDisplayPicture = rs.getString("display_picture");
            }
        }

        // Now, check if a new display picture is provided; otherwise, use the old one.
        String newDisplayPicture = profile.getDisplayPicture();
        if (newDisplayPicture == null || newDisplayPicture.isEmpty() || newDisplayPicture.equals("default.png")) {
            // If no new display picture, retain the old one
            profile.setDisplayPicture(currentDisplayPicture);
        }

        // Proceed with the update using the correct display picture
        String sqlUpdateProfile = "UPDATE profiles SET profile_occupation = ?, profile_description = ?, display_picture = ?, achievements = ?, experience = ? WHERE profile_id = ?";

        try (Connection conn = TaskifyDBconfig.getDbConnection();
             PreparedStatement stmtUpdateProfile = conn.prepareStatement(sqlUpdateProfile)) {

            stmtUpdateProfile.setString(1, profile.getOccupation());
            stmtUpdateProfile.setString(2, profile.getProfileDescription());
            stmtUpdateProfile.setString(3, profile.getDisplayPicture()); // Use the correct display picture
            stmtUpdateProfile.setString(4, profile.getAchievements());
            stmtUpdateProfile.setString(5, profile.getExperience());
            stmtUpdateProfile.setInt(6, profile.getProfileId()); // Use the profile_id from the model

            int rowsUpdated = stmtUpdateProfile.executeUpdate();
            return rowsUpdated > 0; // Return true if update was successful
        }
    }



    // Update User method (no changes needed here)
    public boolean updateUser(userModel user) throws SQLException, ClassNotFoundException {
        String sql = "UPDATE users SET user_name = ? WHERE user_id = ?";

        try (Connection conn = TaskifyDBconfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, user.getusername());
            stmt.setInt(2, user.getuserid());

            System.out.println(user.getusername());
            System.out.println("Updating user with ID: " + user.getuserid());

            int rowsUpdated = stmt.executeUpdate();

            return rowsUpdated > 0; // Return true if update was successful
        }
    }

    // Update member info method (no changes needed here)
    public boolean updateMemberInfo(memberModel member) throws SQLException, ClassNotFoundException {
        String sql = "UPDATE members SET member_email = ?, member_contactnumber = ? WHERE member_id = ?";

        try (Connection conn = TaskifyDBconfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, member.getEmail());
            stmt.setString(2, member.getPhonenumber());
            stmt.setInt(3, member.getId());

            System.out.println("Updating member with ID: " + member.getId());

            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0; // Return true if update was successful
        }
    }
}
