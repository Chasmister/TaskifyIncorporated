package com.taskify.model;

import java.time.LocalDate;

public class memberModel {

    private int id;
    private String firstName;
    private String lastName;
    private LocalDate dob;
    private String gender;
    private String email;
    private String phonenumber;
    private String password;
	private int User_ID;

    // Constructor
    public memberModel( String firstName, String lastName, LocalDate dob, String gender,
            String email, String phonenumber) {
        super();
        
        this.firstName = firstName;
        this.lastName = lastName;
        this.dob = dob;
        this.gender = gender;
        this.email = email;
        this.phonenumber = phonenumber;
        this.User_ID=-1;
    }
    

    // Getters and Setters

    // Getter and Setter for id
    public int getId() {
        return this.id;
    }
   

    public void setId(int id) {
        this.id = id;
    }

    // Getter and Setter for firstName
    public String getFirstName() {
        return this.firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    // Getter and Setter for lastName
    public String getLastName() {
        return this.lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

 

    // Getter and Setter for dob (Date of Birth)
    public LocalDate getDob() {
        return this.dob;
    }

    public void setDob(LocalDate dob) {
        this.dob = dob;
    }

    // Getter and Setter for gender
    public String getGender() {
        return this.gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    // Getter and Setter for email
    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    // Getter and Setter for phonenumber
    public String getPhonenumber() {
        return this.phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    // Getter and Setter for password
    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    public void setUser_ID(int userid) {
    	this.User_ID=userid;
    	
    }
    public int getUser_ID() {
    	return this.User_ID;
    }
}
