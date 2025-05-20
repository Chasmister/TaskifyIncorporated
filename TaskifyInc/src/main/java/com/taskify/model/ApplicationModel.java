package com.taskify.model;

public class ApplicationModel {
    private int applicationId;
    private String applicationStatus;
    private JobModel job;
    private userModel user;
    private profileModel profile;

    // Constructors
    public ApplicationModel(int applicationId, String applicationStatus) {
        this.applicationId = applicationId;
        this.applicationStatus = applicationStatus;
    }

    public ApplicationModel(int applicationId, String applicationStatus, JobModel job) {
        this.applicationId = applicationId;
        this.applicationStatus = applicationStatus;
        this.job = job;
    }

    public ApplicationModel(int applicationId, String applicationStatus, userModel user, profileModel profile) {
        this.applicationId = applicationId;
        this.applicationStatus = applicationStatus;
        this.user = user;
        this.profile = profile;
    }

    // Getter and Setter
    public int getApplicationId() {
        return applicationId;
    }

    public void setApplicationId(int applicationId) {
        this.applicationId = applicationId;
    }

    public String getApplicationStatus() {
        return applicationStatus;
    }

    public void setApplicationStatus(String applicationStatus) {
        this.applicationStatus = applicationStatus;
    }

    public JobModel getJob() {
        return job;
    }

    public void setJob(JobModel job) {
        this.job = job;
    }

    public userModel getUser() {
        return user;
    }

    public void setUser(userModel user) {
        this.user = user;
    }

    public profileModel getProfile() {
        return profile;
    }

    public void setProfile(profileModel profile) {
        this.profile = profile;
    }
}


