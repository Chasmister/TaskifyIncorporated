package com.taskify.model;

public class ApplicationModel {
    private int application_Id;
    private String application_Status;
    private jobModel job;

    // Constructor
    public ApplicationModel(int application_Id, String application_Status) {
        this.application_Id = application_Id;
        this.application_Status = application_Status;
    }
    
    public ApplicationModel(int application_Id, String application_Status,jobModel job) {
        this.application_Id = application_Id;
        this.application_Status = application_Status;
        this.job=job;
    }

    // Getter for application_Id
    public int getApplication_Id() {
        return application_Id;
    }

    // Setter for application_Id
    public void setApplication_Id(int application_Id) {
        this.application_Id = application_Id;
    }

    // Getter for application_Status
    public String getApplication_Status() {
        return application_Status;
    }

    // Setter for application_Status
    public void setApplication_Status(String application_Status) {
        this.application_Status = application_Status;
    }
    public jobModel getJob() {
        return job;
    }

    public void setJob(jobModel job) {
        this.job = job;
    }

}
