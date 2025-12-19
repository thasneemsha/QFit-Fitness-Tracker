package edu.qc.qfit;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Random;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ChartDataServlet")
public class ChartDataServlet extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {

    HttpSession session = req.getSession(false);
    if (session == null || session.getAttribute("currentUser") == null) {
      resp.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
      return;
    }

    // Stable-ish random per user (so it doesn't change every refresh)
    String seedSource = session.getAttribute("currentUser").toString();
    Random r = new Random(seedSource.hashCode());

    // Dashboard metrics (mock Google Fit / Apple Health style)
    int restingHR = randRange(r, 56, 78);
    int stepsToday = randRange(r, 2500, 14000);
    int caloriesBurned = randRange(r, 180, 950);

    String[] workoutTypes = {"Strength Training", "Running", "Walking", "Cycling", "HIIT", "Yoga"};
    String lastWorkoutName = workoutTypes[randRange(r, 0, workoutTypes.length - 1)];

    LocalDateTime lastWorkoutTime =
        LocalDateTime.now().minusDays(randRange(r, 1, 6)).withSecond(0).withNano(0);

    // Nice display date for the dashboard (e.g., "Dec 16")
    String lastWorkoutDate =
        lastWorkoutTime.toLocalDate().format(DateTimeFormatter.ofPattern("MMM d"));

    // Existing weekly chart data (keep your exact structure for Chart.js)
    resp.setContentType("application/json");
    resp.setCharacterEncoding("UTF-8");

    String json =
        "{"
            + "\"labels\":[\"Mon\",\"Tue\",\"Wed\",\"Thu\",\"Fri\",\"Sat\",\"Sun\"],"
            + "\"datasets\":["
            + "  {\"label\":\"Weight (lbs)\",\"data\":[206,205,205,204,204,203,203]},"
            + "  {\"label\":\"Steps\",\"data\":[4000,5200,6100,3000,7000,8200,7600]}"
            + "],"

            // Add these for your dashboard “Real-time Status”
            + "\"restingHR\":" + restingHR + ","
            + "\"stepsToday\":" + stepsToday + ","
            + "\"caloriesBurned\":" + caloriesBurned + ","
            + "\"lastWorkoutName\":\"" + escapeJson(lastWorkoutName) + "\","
            + "\"lastWorkoutDate\":\"" + escapeJson(lastWorkoutDate) + "\""
            + "}";

    resp.getWriter().write(json);
  }

  private static int randRange(Random r, int min, int max) {
    return min + r.nextInt((max - min) + 1);
  }

  private static String escapeJson(String s) {
    if (s == null) return "";
    return s.replace("\\", "\\\\").replace("\"", "\\\"");
  }
}
