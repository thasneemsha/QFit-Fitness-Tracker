package edu.qc.qfit;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DashboardServlet")
public class DashboardServlet extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {

    resp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    resp.setHeader("Pragma", "no-cache");
    resp.setDateHeader("Expires", 0);

    HttpSession session = req.getSession(false);
    if (session == null || session.getAttribute("currentUser") == null) {
      resp.sendRedirect(req.getContextPath() + "/");
      return;
    }

    // Plans
    @SuppressWarnings("unchecked")
    List<WorkoutPlan> activePlans = (List<WorkoutPlan>) session.getAttribute("activePlans");
    if (activePlans == null) activePlans = new ArrayList<>();
    req.setAttribute("activePlans", activePlans);

    // ---- Mock “Google Fit / Apple Health” dashboard status (REQUEST scope) ----
    String seedSource = session.getAttribute("currentUser").toString();
    Random r = new Random(seedSource.hashCode());

    int restingHR = randRange(r, 56, 78);
    int stepsToday = randRange(r, 2500, 14000);
    int caloriesBurned = randRange(r, 180, 950);

    String[] workoutTypes = {"Strength Training", "Running", "Walking", "Cycling", "HIIT", "Yoga"};
    String lastWorkoutName = workoutTypes[randRange(r, 0, workoutTypes.length - 1)];

    LocalDateTime lastWorkoutTime =
        LocalDateTime.now().minusDays(randRange(r, 1, 6)).withSecond(0).withNano(0);

    String lastWorkoutDate =
        lastWorkoutTime.format(DateTimeFormatter.ofPattern("MMM d"));

    req.setAttribute("restingHR", restingHR);
    req.setAttribute("stepsToday", stepsToday);
    req.setAttribute("caloriesBurned", caloriesBurned);
    req.setAttribute("lastWorkoutName", lastWorkoutName);
    req.setAttribute("lastWorkoutDate", lastWorkoutDate);

    req.getRequestDispatcher("/WEB-INF/views/userDashboard.jsp").forward(req, resp);
  }

  private static int randRange(Random r, int min, int max) {
    return min + r.nextInt((max - min) + 1);
  }
}
