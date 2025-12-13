package com.qfit.models;

import java.time.LocalDateTime;

public class User {

    private Long id;
    private String fullName;
    private String email;
    private String phone;
    private String passwordHash;
    private String role;   // STUDENT / COACH / ADMIN
    private String status; // PENDING / ACTIVE / REJECTED / DISABLED

    private String idFrontPath;
    private String idBackPath;
    private String coachingArea;

    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    private LocalDateTime lastLoginAt;

    // Getters and setters

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPasswordHash() {
        return passwordHash;
    }

    public void setPasswordHash(String passwordHash) {
        this.passwordHash = passwordHash;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getIdFrontPath() {
        return idFrontPath;
    }

    public void setIdFrontPath(String idFrontPath) {
        this.idFrontPath = idFrontPath;
    }

    public String getIdBackPath() {
        return idBackPath;
    }

    public void setIdBackPath(String idBackPath) {
        this.idBackPath = idBackPath;
    }

    public String getCoachingArea() {
        return coachingArea;
    }

    public void setCoachingArea(String coachingArea) {
        this.coachingArea = coachingArea;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(LocalDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }

    public LocalDateTime getLastLoginAt() {
        return lastLoginAt;
    }

    public void setLastLoginAt(LocalDateTime lastLoginAt) {
        this.lastLoginAt = lastLoginAt;
    }
}
