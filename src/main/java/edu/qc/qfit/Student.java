package edu.qc.qfit;

public class Student {
  private String fullName;
  private String email;
  private String phone;

  private String status; // e.g. "PENDING", "APPROVED"
  private int height;    // cm
  private int weight;    // kg
  private String primaryGoal;
  private String experienceLevel;

  private String verificationStatus; // "PENDING", "APPROVED", "REJECTED"
  private String submissionDate;     // simple string for now

  // Minimal constructor used by LoginServlet right now
  public Student(String fullName) {
    this.fullName = fullName;

    // Defaults so JSP won't crash
    this.email = fullName; // TEMP: emailOrPhone is passed in for now
    this.phone = "";
    this.status = "PENDING";

    this.height = 170;
    this.weight = 70;
    this.primaryGoal = "Strength";
    this.experienceLevel = "Beginner";

    this.verificationStatus = "PENDING";
    this.submissionDate = "N/A";
  }

  // Getters (JSP uses these)
  public String getFullName() { return fullName; }
  public String getEmail() { return email; }
  public String getPhone() { return phone; }
  public String getStatus() { return status; }
  public int getHeight() { return height; }
  public int getWeight() { return weight; }
  public String getPrimaryGoal() { return primaryGoal; }
  public String getExperienceLevel() { return experienceLevel; }
  public String getVerificationStatus() { return verificationStatus; }
  public String getSubmissionDate() { return submissionDate; }

  // Setters (ProfileUpdateServlet will use these)
  public void setFullName(String fullName) { this.fullName = fullName; }
  public void setPhone(String phone) { this.phone = phone; }
  public void setHeight(int height) { this.height = height; }
  public void setWeight(int weight) { this.weight = weight; }
  public void setPrimaryGoal(String primaryGoal) { this.primaryGoal = primaryGoal; }
  public void setExperienceLevel(String experienceLevel) { this.experienceLevel = experienceLevel; }

  // Optional setters if you want later
  public void setEmail(String email) { this.email = email; }
  public void setStatus(String status) { this.status = status; }
  public void setVerificationStatus(String verificationStatus) { this.verificationStatus = verificationStatus; }
  public void setSubmissionDate(String submissionDate) { this.submissionDate = submissionDate; }
}
