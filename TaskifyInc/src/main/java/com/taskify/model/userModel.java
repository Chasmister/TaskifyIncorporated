package com.taskify.model;

public class userModel {
	private int userID;
	private String username;
	private String usertype;
	private String password;
	
	public userModel(String username,String password) {
		this.userID=-1;
		this.username=username;
		this.password=password;
		this.usertype="NON-ADMIN";
		
	}
	public void setuser_ID(int userid) {
		this.userID=userid;
	}
	public int getuserID() {
		return this.userID;
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
	public String getusertype() {
		return this.usertype;
	}
	public int getuserid() {
		return this.userID;
	}

}
