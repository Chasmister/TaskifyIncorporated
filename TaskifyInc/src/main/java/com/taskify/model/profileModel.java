package com.taskify.model;

/**
 * ProfileModel class representing the profile data structure
 * based on the database table schema.
 */
public class profileModel {
    
    private int profileId;
    private String occupation;
    private String profileDescription;
    private String displayPicture;
    private String achievements;
    private String experience;
    
    /**
     * Default constructor
     */
    
    
    /**
     * Parameterized constructor
     * 
     * @param profileId The profile's unique identifier
     * @param profileDescription The profile description
     * @param displayPicture Path or URL to the display picture
     * @param achievements User's achievements
     * @param experience User's experience
     */
    public profileModel() {
    	this.occupation="Freelancer";
        this.profileDescription = "Enter your profile description here";
        this.displayPicture = "/images/Default_pfp.png";
        this.achievements = "Enter your achievements here";
        this.experience = "Enter your experience here";
    }
    
    /**
     * @return the profileId
     */
    public int getProfileId() {
        return profileId;
    }
    public void setOccupation(String occupation) {
    	this.occupation=occupation;
    }
    
    public String getOccupation() {
    	return occupation;
    }
    
    /**
     * @param profileId the profileId to set
     */
    public void setProfileId(int profileId) {
        this.profileId = profileId;
    }
    
    /**
     * @return the profileDescription
     */
    public String getProfileDescription() {
        return profileDescription;
    }
    
    /**
     * @param profileDescription the profileDescription to set
     */
    public void setProfileDescription(String profileDescription) {
        this.profileDescription = profileDescription;
    }
    
    /**
     * @return the displayPicture
     */
    public String getDisplayPicture() {
        return displayPicture;
    }
    
    /**
     * @param displayPicture the displayPicture to set
     */
    public void setDisplayPicture(String displayPicture) {
        this.displayPicture = displayPicture;
    }
    
    /**
     * @return the achievements
     */
    public String getAchievements() {
        return achievements;
    }
    
    /**
     * @param achievements the achievements to set
     */
    public void setAchievements(String achievements) {
        this.achievements = achievements;
    }
    
    /**
     * @return the experience
     */
    public String getExperience() {
        return experience;
    }
    
    /**
     * @param experience the experience to set
     */
    public void setExperience(String experience) {
        this.experience = experience;
    }
    
    @Override
    public String toString() {
        return "ProfileModel{" +
                "profileId=" + profileId +
                ", profileDescription='" + profileDescription + '\'' +
                ", displayPicture='" + displayPicture + '\'' +
                ", achievements='" + achievements + '\'' +
                ", experience='" + experience + '\'' +
                '}';
    }
}