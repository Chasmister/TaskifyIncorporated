package com.taskify.model;

public class AdminModel {
    private int adminId;
    private int userId;
    private String firstName;
    private String lastName;
    private String email;
    private String password;

    public AdminModel() {
        // No-arg constructor (required for setters to be useful)
    }

    public AdminModel(int userId, String firstName, String lastName, String email, String password) {
        this.userId = userId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
    }
    public AdminModel( String firstName, String lastName, String email) {
        
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        
    }

    // Getters
    public int getAdminId() { return adminId; }
    public int getUserId() { return userId; }
    public String getFirstName() { return firstName; }
    public String getLastName() { return lastName; }
    public String getEmail() { return email; }
    public String getPassword() { return password; }

    // Setters
    public void setAdminId(int adminId) { this.adminId = adminId; }
    public void setUserId(int userId) { this.userId = userId; }
    public void setFirstName(String firstName) { this.firstName = firstName; }
    public void setLastName(String lastName) { this.lastName = lastName; }
    public void setEmail(String email) { this.email = email; }
    public void setPassword(String password) { this.password = password; }
}
