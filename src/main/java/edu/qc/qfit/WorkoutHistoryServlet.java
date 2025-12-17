package edu.qc.qfit;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/WorkoutHistoryServlet")
public class WorkoutHistoryServlet extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {

    // Require login
    HttpSession session = req.getSession(false);
    if (session == null || session.getAttribute("currentUser") == null) {
      resp.sendRedirect(req.getContextPath() + "/");
      return;
    }

    @SuppressWarnings("unchecked")
    List<LoggedSession> loggedSessions =
        (List<LoggedSession>) session.getAttribute("loggedSessions");

    if (loggedSessions == null) {
      loggedSessions = new ArrayList<>();
    }

    // IMPORTANT: workoutHistory.jsp expects attribute name "history"
    req.setAttribute("history", loggedSessions);

    req.getRequestDispatcher("/WEB-INF/views/workoutHistory.jsp").forward(req, resp);
  }
}
