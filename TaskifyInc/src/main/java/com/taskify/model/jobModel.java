package com.taskify.model;

public class jobModel {
	private String job_name;
	public jobModel(String job_name){
		this.job_name=job_name;		
	}
	
	//setter
	public void setjob(String job_name) {
		this.job_name=job_name;

	}
	public String getjob() {
		return this.job_name;
		
	}
	

}
