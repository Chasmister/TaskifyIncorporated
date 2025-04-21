package com.taskify.model;

public class User_Member_ProfileModel {

    // Fields representing foreign keys (IDs)
    private int userId;       // Foreign key to User table
    private int memberId;     // Foreign key to Member table
    private int profileId;    // Foreign key to Profile table

    // Constructor
    public User_Member_ProfileModel(int userId, int memberId, int profileId) {
        this.userId = userId;
        this.memberId = memberId;
        this.profileId = profileId;
    }

    // Getters and Setters
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getMemberId() {
        return memberId;
    }

    public void setMemberId(int memberId) {
        this.memberId = memberId;
    }

    public int getProfileId() {
        return profileId;
    }

    public void setProfileId(int profileId) {
        this.profileId = profileId;
    }

    // Optionally, override toString for debugging or logging purposes
    @Override
    public String toString() {
        return "User_Member_ProfileModel{" +
                "userId=" + userId +
                ", memberId=" + memberId +
                ", profileId=" + profileId +
                '}';
    }
}

