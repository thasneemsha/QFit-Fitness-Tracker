package edu.qc.qfit;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/CreateWorkoutPlanServlet")
public class CreateWorkoutPlanServlet extends HttpServlet {

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {

    // Require login
    HttpSession session = req.getSession(false);
    if (session == null || session.getAttribute("currentUser") == null) {
      resp.sendRedirect(req.getContextPath() + "/");
      return;
    }

    // Read form values
    String planName = req.getParameter("planName");
    String planColor = req.getParameter("planColor");
    String[] days = req.getParameterValues("days"); // MON, TUE, etc.

    // Validate
    if (planName == null || planName.trim().isEmpty()) {
      resp.sendRedirect(req.getContextPath() + "/DashboardServlet");
      return;
    }

    // Default color if empty
    if (planColor == null || planColor.trim().isEmpty()) {
      planColor = "#5b78ff";
    }

    // Build daysOfWeek string
    String daysOfWeek = "Not set";
    if (days != null && days.length > 0) {
      StringBuilder sb = new StringBuilder();
      for (int i = 0; i < days.length; i++) {
        if (i > 0) sb.append(", ");
        sb.append(days[i]);
      }
      daysOfWeek = sb.toString();
    }

    // TEMP: not building Exercise objects yet
    List<Exercise> exercises = new ArrayList<>();

    // Pull existing plans from session
    @SuppressWarnings("unchecked")
    List<WorkoutPlan> activePlans = (List<WorkoutPlan>) session.getAttribute("activePlans");
    if (activePlans == null) activePlans = new ArrayList<>();

    // Generate a unique id
    int nextId = 1;
    for (WorkoutPlan p : activePlans) {
      if (p.getId() >= nextId) nextId = p.getId() + 1;
    }

    // Placeholders for dashboard display
    int durationMinutes = 0;
    String previewExercises = "Exercises saved (placeholder)";

    // Create plan using your UPDATED WorkoutPlan constructor
    WorkoutPlan plan = new WorkoutPlan(
    	    nextId,
    	    planName.trim(),
    	    exercises,
    	    planColor,
    	    daysOfWeek,
    	    durationMinutes,
    	    previewExercises,
    	    true   // default active
    	);


    // Save back to session
    activePlans.add(plan);
    session.setAttribute("activePlans", activePlans);

    // Back to dashboard
    resp.sendRedirect(req.getContextPath() + "/DashboardServlet");
  }

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    // If someone hits it directly, just go back
    resp.sendRedirect(req.getContextPath() + "/DashboardServlet");
  }
}
