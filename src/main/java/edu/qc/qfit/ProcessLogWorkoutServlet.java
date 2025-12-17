package edu.qc.qfit;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ProcessLogWorkoutServlet")
public class ProcessLogWorkoutServlet extends HttpServlet {

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

    // Require login (do NOT create a new session if logged out)
    HttpSession session = req.getSession(false);
    if (session == null || session.getAttribute("currentUser") == null) {
      resp.sendRedirect(req.getContextPath() + "/");
      return;
    }

    // Read what the JSP actually sends
    String logDate = req.getParameter("logDate");
    String planIdStr = req.getParameter("planId");

    // Fallbacks
    if (logDate == null || logDate.trim().isEmpty()) logDate = "N/A";

    int planId = 1;
    try {
      if (planIdStr != null && !planIdStr.trim().isEmpty()) {
        planId = Integer.parseInt(planIdStr.trim());
      }
    } catch (Exception ignore) {
      planId = 1;
    }
    if (planId <= 0) planId = 1;

    // planName is NOT currently posted by logWorkout.jsp, so derive it safely
    String planName = req.getParameter("planName");
    if (planName == null || planName.trim().isEmpty()) {
      planName = "Sample Plan " + planId;
    }

    // durationMinutes is NOT currently posted either; keep a consistent fallback
    int durationMinutes = 45;
    String durationStr = req.getParameter("durationMinutes");
    try {
      if (durationStr != null && !durationStr.trim().isEmpty()) {
        durationMinutes = Integer.parseInt(durationStr.trim());
      }
    } catch (Exception ignore) {
      durationMinutes = 45;
    }

    @SuppressWarnings("unchecked")
    List<LoggedSession> loggedSessions =
        (List<LoggedSession>) session.getAttribute("loggedSessions");

    if (loggedSessions == null) {
      loggedSessions = new ArrayList<>();
      session.setAttribute("loggedSessions", loggedSessions);
    }

    // Add the new session
    loggedSessions.add(new LoggedSession(logDate, planName, durationMinutes));

    // Go to history
    resp.sendRedirect(req.getContextPath() + "/WorkoutHistoryServlet");
  }
}
