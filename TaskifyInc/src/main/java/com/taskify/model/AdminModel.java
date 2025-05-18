package com.taskify.model;

public class AdminModel {
    private int adminId;
    private String firstName;
    private String lastName;
    private String email;
    private String password;

    // Constructor
    public AdminModel(String firstName, String lastName, String email, String password) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
    }

    // Getters and setters
    public String getFirstName() { return firstName; }
    public String getLastName() { return lastName; }
    public String getEmail() { return email; }
    public String getPassword() { return password; }
}
