package edu.qc.qfit;

import java.io.Serializable;
import java.util.UUID;

public class LoggedSession implements Serializable {
  private static final long serialVersionUID = 1L;

  private final String id;
  private final String date;
  private final String planName;
  private final int durationMinutes;

  // Constructor you are already using everywhere
  public LoggedSession(String date, String planName, int durationMinutes) {
    this.id = UUID.randomUUID().toString();
    this.date = date;
    this.planName = planName;
    this.durationMinutes = durationMinutes;
  }

  // --- Getters (JSP EL needs these) ---
  public String getId() {
    return id;
  }

  public String getDate() {
    return date;
  }

  public String getPlanName() {
    return planName;
  }

  public int getDurationMinutes() {
    return durationMinutes;
  }
}
