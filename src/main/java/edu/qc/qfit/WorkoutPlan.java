package edu.qc.qfit;

import java.util.List;

public class WorkoutPlan {

  private final int id;
  private final String name;
  private final List<Exercise> exercises;

  private final String color;
  private final String daysOfWeek;
  private final int durationMinutes;
  private final String previewExercises;

  private final boolean active;

  // Added for planDetails.jsp
  private final String lastLoggedDate;

  // ✅ OLD constructor (so LogWorkoutServlet keeps compiling)
  public WorkoutPlan(int id, String name, List<Exercise> exercises) {
    this(
        id,
        name,
        exercises,
        "#5b78ff",        // default color
        "Not set",        // default days
        0,                // default duration
        "No exercises",   // default preview
        true,             // default active
        "Never"           // default last logged
    );
  }

  // ✅ Your existing 8-arg constructor
  public WorkoutPlan(
      int id,
      String name,
      List<Exercise> exercises,
      String color,
      String daysOfWeek,
      int durationMinutes,
      String previewExercises,
      boolean active
  ) {
    this(id, name, exercises, color, daysOfWeek, durationMinutes, previewExercises, active, "Never");
  }

  // ✅ Full constructor (includes lastLoggedDate)
  public WorkoutPlan(
      int id,
      String name,
      List<Exercise> exercises,
      String color,
      String daysOfWeek,
      int durationMinutes,
      String previewExercises,
      boolean active,
      String lastLoggedDate
  ) {
    this.id = id;
    this.name = name;
    this.exercises = exercises;

    this.color = (color == null || color.trim().isEmpty()) ? "#5b78ff" : color.trim();
    this.daysOfWeek = (daysOfWeek == null || daysOfWeek.trim().isEmpty()) ? "Not set" : daysOfWeek.trim();
    this.durationMinutes = Math.max(durationMinutes, 0);
    this.previewExercises = (previewExercises == null || previewExercises.trim().isEmpty()) ? "No exercises" : previewExercises.trim();

    this.active = active;

    this.lastLoggedDate = (lastLoggedDate == null || lastLoggedDate.trim().isEmpty())
        ? "Never"
        : lastLoggedDate.trim();
  }

  public int getId() { return id; }
  public String getName() { return name; }
  public List<Exercise> getExercises() { return exercises; }

  public String getColor() { return color; }
  public String getDaysOfWeek() { return daysOfWeek; }
  public int getDurationMinutes() { return durationMinutes; }
  public String getPreviewExercises() { return previewExercises; }

  // For JSP EL: ${plan.active}
  public boolean isActive() { return active; }

  // For JSP EL: ${plan.lastLoggedDate}
  public String getLastLoggedDate() { return lastLoggedDate; }
}
