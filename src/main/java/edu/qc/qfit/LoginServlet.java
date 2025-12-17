package edu.qc.qfit;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {

    String emailOrPhone = req.getParameter("emailOrPhone");
    String password = req.getParameter("password");

    // Basic validation
    if (emailOrPhone == null || emailOrPhone.trim().isEmpty()
        || password == null || password.trim().isEmpty()) {

      req.setAttribute("loginError", "Please enter your email/phone and password.");
      req.getRequestDispatcher("/index.jsp").forward(req, resp);
      return;
    }

    // Create session
    HttpSession session = req.getSession(true);

    // Create temp user (demo-safe)
    Student user = new Student(emailOrPhone);
    session.setAttribute("currentUser", user);

    // API demo state (default = not connected)
    session.setAttribute("googleFitConnected", false);

    // ✅ ADMIN CHECK (simple, hardcoded for demo)
    boolean isAdmin =
        emailOrPhone.equalsIgnoreCase("admin@qfit.com") ||
        emailOrPhone.equalsIgnoreCase("bryan@admin.com");

    session.setAttribute("isAdmin", isAdmin);

    // Redirect based on role
    if (isAdmin) {
      resp.sendRedirect(req.getContextPath() + "/AdminDashboardServlet");
    } else {
      resp.sendRedirect(req.getContextPath() + "/DashboardServlet");
    }
  }

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    resp.sendRedirect(req.getContextPath() + "/");
  }
}
