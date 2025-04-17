package com.taskify.model;

public class userModel {
	private int userID;
	private String username;
	private String usertype;
	private String password;
	
	public userModel(String username,String password) {
		this.username=username;
		this.password=password;
		
	}
	
	public void setusertype(String usertype) {
		this.usertype=usertype;
	}
	public String getusername() {
		return this.username;
	}
	public String getpassword() {
		return this.password;
	}

}
