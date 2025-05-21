package com.taskify.model;

import java.sql.Date;
import java.util.List;

public class JobModel {

    private int jobId;
    private String jobName;
    private String jobDescription;
    private Date startDate;
    private Date endDate;
    private double salary;
    private String skillsRequired;
    private String companyPicture;
    private List<ApplicationModel> ApplicationList;
     // Constructor
    public JobModel(int jobId, String jobName, String jobDescription, Date startDate, Date endDate, double salary, String skillsRequired, String companyPicture) {
        this.jobId = jobId;
        this.jobName = jobName;
        this.jobDescription = jobDescription;
        this.startDate = startDate;
        this.endDate = endDate;
        this.salary = salary;
        this.skillsRequired = skillsRequired;
        this.companyPicture = companyPicture;
    }
    
    public JobModel(int jobId, String jobName, String jobDescription, Date startDate, Date endDate, double salary, String skillsRequired, String companyPicture, List<ApplicationModel> applicationList) {
        this.jobId = jobId;
        this.jobName = jobName;
        this.jobDescription = jobDescription;
        this.startDate = startDate;
        this.endDate = endDate;
        this.salary = salary;
        this.skillsRequired = skillsRequired;
        this.companyPicture = companyPicture;
        this.ApplicationList = applicationList;  // Set applications here
    }


    // Getters and Setters
    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public String getJobName() {
        return jobName;
    }

    public void setJobName(String jobName) {
        this.jobName = jobName;
    }

    public String getJobDescription() {
        return jobDescription;
    }

    public void setJobDescription(String jobDescription) {
        this.jobDescription = jobDescription;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public String getSkillsRequired() {
        return skillsRequired;
    }

    public void setSkillsRequired(String skillsRequired) {
        this.skillsRequired = skillsRequired;
    }

    public String getCompanyPicture() {
        return companyPicture;
    }

    public void setCompanyPicture(String companyPicture) {
        this.companyPicture = companyPicture;
    }
    
    public void setList(List<ApplicationModel> ApplicationList) {
    	this.ApplicationList=ApplicationList;
    }

    // Optional: Override toString() for better output display
    @Override
    public String toString() {
        return "jobModel{" +
                "jobId=" + jobId +
                ", jobName='" + jobName + '\'' +
                ", jobDescription='" + jobDescription + '\'' +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                ", salary=" + salary +
                ", skillsRequired='" + skillsRequired + '\'' +
                ", companyPicture='" + companyPicture + '\'' +
                '}';
    }
}