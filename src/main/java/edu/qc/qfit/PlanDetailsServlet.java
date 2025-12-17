package edu.qc.qfit;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/PlanDetailsServlet")
public class PlanDetailsServlet extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {

    // Require login
    HttpSession session = req.getSession(false);
    if (session == null || session.getAttribute("currentUser") == null) {
      resp.sendRedirect(req.getContextPath() + "/");
      return;
    }

    // Read planId
    String planIdStr = req.getParameter("planId");
    int planId;
    try {
      planId = Integer.parseInt(planIdStr);
    } catch (Exception e) {
      resp.sendRedirect(req.getContextPath() + "/DashboardServlet");
      return;
    }

    @SuppressWarnings("unchecked")
    List<WorkoutPlan> activePlans = (List<WorkoutPlan>) session.getAttribute("activePlans");
    if (activePlans == null) {
      resp.sendRedirect(req.getContextPath() + "/DashboardServlet");
      return;
    }

    WorkoutPlan found = null;
    for (WorkoutPlan p : activePlans) {
      if (p.getId() == planId) {
        found = p;
        break;
      }
    }

    if (found == null) {
      resp.sendRedirect(req.getContextPath() + "/DashboardServlet");
      return;
    }

    req.setAttribute("plan", found);
    req.getRequestDispatcher("/WEB-INF/views/planDetails.jsp").forward(req, resp);
  }
}
