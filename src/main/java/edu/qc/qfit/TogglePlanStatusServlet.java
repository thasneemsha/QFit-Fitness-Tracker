package edu.qc.qfit;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/TogglePlanStatusServlet")
public class TogglePlanStatusServlet extends HttpServlet {

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {

    HttpSession session = req.getSession(false);

    if (session == null || session.getAttribute("currentUser") == null) {
      resp.sendRedirect(req.getContextPath() + "/");
      return;
    }

    Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
    if (isAdmin == null || !isAdmin) {
      resp.sendRedirect(req.getContextPath() + "/DashboardServlet");
      return;
    }

    int planId = Integer.parseInt(req.getParameter("planId"));

    @SuppressWarnings("unchecked")
    List<WorkoutPlan> plans =
        (List<WorkoutPlan>) session.getAttribute("activePlans");

    if (plans != null) {
      for (int i = 0; i < plans.size(); i++) {
        WorkoutPlan p = plans.get(i);
        if (p.getId() == planId) {

          WorkoutPlan updated = new WorkoutPlan(
              p.getId(),
              p.getName(),
              p.getExercises(),
              p.getColor(),
              p.getDaysOfWeek(),
              p.getDurationMinutes(),
              p.getPreviewExercises(),
              !p.isActive()   // ✅ TOGGLE
          );

          plans.set(i, updated);
          break;
        }
      }
    }

    session.setAttribute("activePlans", plans);
    resp.sendRedirect(req.getContextPath() + "/AdminDashboardServlet");
  }
}
