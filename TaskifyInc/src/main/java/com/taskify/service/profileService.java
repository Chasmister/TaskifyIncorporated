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

    public int createProfile(profileModel profile, int userId, int memberId) throws SQLException, ClassNotFoundException {
        String profileSql = "INSERT INTO profiles (profile_Occupation, Profile_Description, Display_Picture, profile_Skills, Achievements, Experience) " +
                            "VALUES (?, ?, ?, ?, ?, ?)";

        String mappingSql = "INSERT INTO Users_Members_Profiles(Profile_Id, User_Id, Member_Id) VALUES (?, ?, ?)";

        try (Connection conn = TaskifyDBconfig.getDbConnection();
             PreparedStatement profilePs = conn.prepareStatement(profileSql, Statement.RETURN_GENERATED_KEYS)) {

            // Set parameters for profile insertion
            profilePs.setString(1, profile.getOccupation());
            profilePs.setString(2, profile.getProfileDescription());
            profilePs.setString(3, profile.getDisplayPicture());
            profilePs.setString(4, profile.getSkills());
            profilePs.setString(5, profile.getAchievements());
            profilePs.setString(6, profile.getExperience());

            int profileRows = profilePs.executeUpdate();

            if (profileRows > 0) {
                try (ResultSet rs = profilePs.getGeneratedKeys()) {
                    if (rs.next()) {
                        int profileId = rs.getInt(1); // Auto-generated profileId
                        profile.setProfileId(profileId); // ✅ Set it on the model

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
        String selectSql = "SELECT display_picture FROM profiles WHERE profile_id = ?";
        String updateSql = "UPDATE profiles SET profile_occupation = ?, profile_description = ?, display_picture = ?, achievements = ?, experience = ? WHERE profile_id = ?";

        try (Connection conn = TaskifyDBconfig.getDbConnection()) {

            // Step 1: If display_picture is null, fetch the existing one from DB
            if (profile.getDisplayPicture().equals("download.png") || profile.getDisplayPicture().isEmpty()) {
                try (PreparedStatement selectStmt = conn.prepareStatement(selectSql)) {
                    selectStmt.setInt(1, profile.getProfileId());
                    ResultSet rs = selectStmt.executeQuery();
                    if (rs.next()) {
                        profile.setDisplayPicture(rs.getString("display_picture"));
                    }
                }
            }

            // Step 2: Update the profile
            try (PreparedStatement updateStmt = conn.prepareStatement(updateSql)) {
                updateStmt.setString(1, profile.getOccupation());
                updateStmt.setString(2, profile.getProfileDescription());
                updateStmt.setString(3, profile.getDisplayPicture()); // Now this has either new or existing picture
                updateStmt.setString(4, profile.getAchievements());
                updateStmt.setString(5, profile.getExperience());
                updateStmt.setInt(6, profile.getProfileId());

                int rowsUpdated = updateStmt.executeUpdate();
                return rowsUpdated > 0;
            }
        }
    }

    public boolean updateUser(userModel user) throws SQLException, ClassNotFoundException {
        String sql = "UPDATE users SET user_name = ? WHERE user_id = ?";

        try (Connection conn = TaskifyDBconfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, user.getusername());
            stmt.setInt(2, user.getuserid());
          
            
            System.out.println(user.getusername());

            System.out.println("Updating user with ID: " + user.getuserid());

            int rowsUpdated = stmt.executeUpdate();
           
            return rowsUpdated<0;
        }
    }

    public boolean updateMemberInfo(memberModel member) throws SQLException, ClassNotFoundException {
        String sql = "UPDATE members SET member_email = ?, member_contactnumber = ? WHERE member_id = ?";

        try (Connection conn = TaskifyDBconfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, member.getEmail());
            stmt.setString(2, member.getPhonenumber());
            System.out.println(member.getPhonenumber());
            stmt.setInt(3, member.getId());
            System.out.println(stmt);
       
            int rowsUpdated = stmt.executeUpdate();
            
            return rowsUpdated > 0;
          
        }
    }
    

}

