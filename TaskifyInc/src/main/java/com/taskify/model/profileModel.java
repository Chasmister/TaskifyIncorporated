package com.taskify.model;

/**
 * ProfileModel class representing the profile data structure
 * based on the database table schema.
 */
public class profileModel {

    private int profileId;
    private String occupation;
    private String profileDescription;
    private String skills;
    private String displayPicture;
    private String achievements;
    private String experience;

    /**
     * Default constructor
     */
    public profileModel() {
        this.occupation = "Freelancer";
        this.profileDescription = "Enter your profile description here";
        this.displayPicture = "default.jpg";
        this.skills = "";
        this.achievements = "Enter your achievements here";
        this.experience = "Enter your experience here";
    }

    /**
     * Constructor without ID (used for inserts or where ID is not available)
     */
    public profileModel(String occupation, String description, String displayPicture, String skills, String achievements, String experience) {
        this.occupation = occupation;
        this.profileDescription = description;
        this.displayPicture = displayPicture;
        this.skills = skills;
        this.achievements = achievements;
        this.experience = experience;
    }

    /**
     * Constructor with ID (used for updates)
     */
    public profileModel(int profileId, String occupation, String description, String displayPicture, String skills, String achievements, String experience) {
        this.profileId = profileId;
        this.occupation = occupation;
        this.profileDescription = description;
        this.displayPicture = displayPicture;
        this.skills = skills;
        this.achievements = achievements;
        this.experience = experience;
    }

    // Getters and setters
    public int getProfileId() {
        return profileId;
    }

    public void setProfileId(int profileId) {
        this.profileId = profileId;
    }

    public String getOccupation() {
        return occupation;
    }

    public void setOccupation(String occupation) {
        this.occupation = occupation;
    }

    public String getProfileDescription() {
        return profileDescription;
    }

    public void setProfileDescription(String profileDescription) {
        this.profileDescription = profileDescription;
    }

    public String getSkills() {
        return skills;
    }

    public void setSkills(String skills) {
        this.skills = skills;
    }

    public String getDisplayPicture() {
        return displayPicture;
    }

    public void setDisplayPicture(String displayPicture) {
        this.displayPicture = displayPicture;
    }

    public String getAchievements() {
        return achievements;
    }

    public void setAchievements(String achievements) {
        this.achievements = achievements;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    @Override
    public String toString() {
        return "profileModel{" +
                "profileId=" + profileId +
                ", occupation='" + occupation + '\'' +
                ", profileDescription='" + profileDescription + '\'' +
                ", skills='" + skills + '\'' +
                ", displayPicture='" + displayPicture + '\'' +
                ", achievements='" + achievements + '\'' +
                ", experience='" + experience + '\'' +
                '}';
    }
}
