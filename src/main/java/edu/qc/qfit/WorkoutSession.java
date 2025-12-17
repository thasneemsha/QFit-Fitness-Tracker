package edu.qc.qfit;

public class WorkoutSession {
  private final String date;
  private final String planName;
  private final String summary;

  public WorkoutSession(String date, String planName, String summary) {
    this.date = date;
    this.planName = planName;
    this.summary = summary;
  }

  public String getDate() { return date; }
  public String getPlanName() { return planName; }
  public String getSummary() { return summary; }
}
