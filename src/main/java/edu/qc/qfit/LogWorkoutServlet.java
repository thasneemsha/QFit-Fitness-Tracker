package edu.qc.qfit;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LogWorkoutServlet")
public class LogWorkoutServlet extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {

    // Require login
    HttpSession session = req.getSession(false);
    if (session == null || session.getAttribute("currentUser") == null) {
      resp.sendRedirect(req.getContextPath() + "/");
      return;
    }

    // planId is optional (default to 1)
    int planId = 1;
    String planIdParam = req.getParameter("planId");
    if (planIdParam != null && !planIdParam.trim().isEmpty()) {
      try {
        planId = Integer.parseInt(planIdParam.trim());
      } catch (Exception ignore) {
        planId = 1;
      }
    }
    if (planId <= 0) planId = 1;

    // TEMP plan until DB exists
    WorkoutPlan plan = new WorkoutPlan(
        planId,
        "Sample Plan " + planId,
        Arrays.asList(
            new Exercise(101, "Bench Press", 3, "8 reps", 135),
            new Exercise(102, "Squat", 3, "8 reps", 185),
            new Exercise(103, "Row", 3, "10 reps", 95)
        )
    );

    req.setAttribute("plan", plan);
    req.setAttribute("defaultDate", LocalDate.now().toString());

    req.getRequestDispatcher("/WEB-INF/views/logWorkout.jsp").forward(req, resp);
  }
}
