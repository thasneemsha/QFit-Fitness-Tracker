package edu.qc.qfit;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AdminDashboardServlet")
public class AdminDashboardServlet extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {

    HttpSession session = req.getSession(false);
    if (session == null || session.getAttribute("currentUser") == null) {
      resp.sendRedirect(req.getContextPath() + "/");
      return;
    }

    // ✅ Admin-only gate
    Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
    if (isAdmin == null || !isAdmin) {
      resp.sendRedirect(req.getContextPath() + "/DashboardServlet");
      return;
    }

    // Optional: show admin data (demo-friendly)
    @SuppressWarnings("unchecked")
    List<WorkoutPlan> plans = (List<WorkoutPlan>) session.getAttribute("activePlans");
    req.setAttribute("plans", plans);

    req.getRequestDispatcher("/WEB-INF/views/adminDashboard.jsp").forward(req, resp);
  }
}
