package edu.qc.qfit;

import edu.qc.qfit.WorkoutPlan;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/UpdatePlanServlet")
public class UpdatePlanServlet extends HttpServlet {

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {

    // Require login
    HttpSession session = req.getSession(false);
    if (session == null || session.getAttribute("currentUser") == null) {
      resp.sendRedirect(req.getContextPath() + "/");
      return;
    }

    @SuppressWarnings("unchecked")
    List<WorkoutPlan> activePlans =
        (List<WorkoutPlan>) session.getAttribute("activePlans");

    if (activePlans == null) activePlans = new ArrayList<>();

    // Get planId from request
    int planId = parseIntOrDefault(req.getParameter("planId"), -1);
    if (planId == -1) {
      resp.sendRedirect(req.getContextPath() + "/DashboardServlet");
      return;
    }

    // Find existing plan
    int planIndex = -1;
    WorkoutPlan existingPlan = null;
    for (int i = 0; i < activePlans.size(); i++) {
      if (activePlans.get(i).getId() == planId) {
        existingPlan = activePlans.get(i);
        planIndex = i;
        break;
      }
    }

    if (existingPlan == null) {
      resp.sendRedirect(req.getContextPath() + "/DashboardServlet");
      return;
    }

    // Read updated top-level fields
    String planName = req.getParameter("planName");
    if (planName == null || planName.trim().isEmpty()) {
      planName = existingPlan.getName();
    } else {
      planName = planName.trim();
    }

    String planColor = req.getParameter("planColor");
    if (planColor == null || planColor.trim().isEmpty()) {
      planColor = existingPlan.getColor();
    } else {
      planColor = planColor.trim();
    }

    String[] days = req.getParameterValues("days"); // MON/TUE/...
    String daysOfWeek = existingPlan.getDaysOfWeek();
    if (days != null && days.length > 0) {
      StringBuilder sb = new StringBuilder();
      for (int i = 0; i < days.length; i++) {
        if (i > 0) sb.append(", ");
        sb.append(days[i]);
      }
      daysOfWeek = sb.toString();
    }

    // Build updated exercises from fields like:
    // exName1, exSets1, exWeight1, exTime1
    List<Exercise> updatedExercises = new ArrayList<>();
    int totalMinutes = 0;

    // Supports up to 50 exercises (adjust if needed)
    for (int i = 1; i <= 50; i++) {
      String name = req.getParameter("exName" + i);
      if (name == null || name.trim().isEmpty()) {
        continue; // skip blanks
      }

      int sets = parseIntOrDefault(req.getParameter("exSets" + i), 0);
      int weight = parseIntOrDefault(req.getParameter("exWeight" + i), 0);
      int time = parseIntOrDefault(req.getParameter("exTime" + i), 0);

      // Your Exercise expects repsOrDuration as STRING
      // We’ll store time like "15 min" if > 0, else "N/A"
      String repsOrDuration = (time > 0) ? (time + " min") : "N/A";

      totalMinutes += Math.max(time, 0);

      // Generate an int id
      int exId = updatedExercises.size() + 1;

      // ✅ Correct constructor for YOUR Exercise.java
      Exercise ex = new Exercise(exId, name.trim(), Math.max(sets, 0), repsOrDuration, Math.max(weight, 0));
      updatedExercises.add(ex);
    }

    // Duration: if they entered any time, use it; otherwise keep existing
    int durationMinutes = (totalMinutes > 0) ? totalMinutes : existingPlan.getDurationMinutes();

    // Preview text (first 3 exercise names)
    String previewExercises = buildPreview(updatedExercises);

    // Create updated plan object (your WorkoutPlan has the “extra fields” constructor)
    WorkoutPlan updatedPlan = new WorkoutPlan(
    	    existingPlan.getId(),
    	    planName,
    	    updatedExercises,
    	    planColor,
    	    daysOfWeek,
    	    durationMinutes,
    	    previewExercises,
    	    existingPlan.isActive()
    	);


    // Replace existing plan in list + store back in session
    if (planIndex >= 0) {
      activePlans.set(planIndex, updatedPlan);
    } else {
      activePlans.add(updatedPlan);
    }
    session.setAttribute("activePlans", activePlans);

    // Back to dashboard
    resp.sendRedirect(req.getContextPath() + "/DashboardServlet");
  }

  private int parseIntOrDefault(String s, int defaultVal) {
    if (s == null) return defaultVal;
    try {
      return Integer.parseInt(s.trim());
    } catch (NumberFormatException e) {
      return defaultVal;
    }
  }

  private String buildPreview(List<Exercise> exercises) {
    if (exercises == null || exercises.isEmpty()) return "No exercises yet";

    StringBuilder sb = new StringBuilder();
    int limit = Math.min(3, exercises.size());
    for (int i = 0; i < limit; i++) {
      if (i > 0) sb.append(", ");
      sb.append(exercises.get(i).getName());
    }
    if (exercises.size() > 3) sb.append("...");
    return sb.toString();
  }
}
