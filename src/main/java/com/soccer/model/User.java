package com.soccer.model;

import jakarta.persistence.*;

@Entity
@Table(name = "users") // Avoid reserved word "user"
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false, unique = true)
    private String userId;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false, unique = true)
    private String email;

    @Column(nullable = false)
    private String password;

    @Column(nullable = false)
    private boolean verified;

    @Column
    private String verificationCode;

    @Column(nullable = false)
    private String role;

    @Column
    private String resetToken;

    // Constructors
    public User() {}

    public User(String userId, String name, String email, String password, String verificationCode, String role) {
        this.userId = userId;
        this.name = name;
        this.email = email;
        this.password = password;
        this.verificationCode = verificationCode;
        this.role = role;
        this.verified = false;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getUserId() { return userId; }
    public void setUserId(String userId) { this.userId = userId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public boolean isVerified() { return verified; }
    public void setVerified(boolean verified) { this.verified = verified; }

    public String getVerificationCode() { return verificationCode; }
    public void setVerificationCode(String verificationCode) { this.verificationCode = verificationCode; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }

    public String getResetToken() { return resetToken; }
    public void setResetToken(String resetToken) { this.resetToken = resetToken; }

    @Override
    public String toString() {
        return "User{" +
                "userId='" + userId + '\'' +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", verified=" + verified +
                ", role='" + role + '\'' +
                '}';
    }
}