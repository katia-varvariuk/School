package com.example.Project.dto;

public class UserRegistrationDto {
    private String firstName;
    private String lastName;
    private String username;
    private String password;
    private String confirmPassword;
    private String role = "STUDENT";

    public UserRegistrationDto() {}

    public UserRegistrationDto(String firstName, String lastName, String username,
                               String password, String confirmPassword, String role) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.username = username;
        this.password = password;
        this.confirmPassword = confirmPassword;
        this.role = role;
    }

    public String getFirstName() { return firstName; }
    public void setFirstName(String firstName) { this.firstName = firstName; }

    public String getLastName() { return lastName; }
    public void setLastName(String lastName) { this.lastName = lastName;  }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getConfirmPassword() { return confirmPassword; }
    public void setConfirmPassword(String confirmPassword) { this.confirmPassword = confirmPassword; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }

    public boolean isPasswordMatching() {
        return password != null && password.equals(confirmPassword);
    }

    public boolean isValidRole() {
        return role != null && (role.equals("STUDENT") || role.equals("TEACHER"));
    }

    @Override
    public String toString() {
        return "UserRegistrationDto{" +
                "firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", username='" + username + '\'' +
                ", role='" + role + '\'' +
                '}';
    }
}