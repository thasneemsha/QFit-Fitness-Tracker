package edu.qc.qfit;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ProfileUpdateServlet")
public class ProfileUpdateServlet extends HttpServlet {

  private static final String PROFILE_VIEW = "/WEB-INF/views/profile.jsp";

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {

    HttpSession session = req.getSession(false);
    if (session == null || session.getAttribute("currentUser") == null) {
      resp.sendRedirect(req.getContextPath() + "/");
      return;
    }

    Student user = (Student) session.getAttribute("currentUser");
    String action = req.getParameter("action"); // "personal" or "fitness"

    try {
      if ("personal".equalsIgnoreCase(action)) {

        String fullName = trim(req.getParameter("fullName"));
        String phone = trim(req.getParameter("phone"));

        if (isEmpty(fullName)) {
          req.setAttribute("error", "Full name is required.");
          req.getRequestDispatcher(PROFILE_VIEW).forward(req, resp);
          return;
        }

        user.setFullName(fullName);
        user.setPhone(phone);

        req.setAttribute("message", "Personal information updated.");
        req.getRequestDispatcher(PROFILE_VIEW).forward(req, resp);
        return;
      }

      if ("fitness".equalsIgnoreCase(action)) {

        String heightStr = trim(req.getParameter("height"));
        String weightStr = trim(req.getParameter("weight"));

        if (isEmpty(heightStr) || isEmpty(weightStr)) {
          req.setAttribute("error", "Height and weight are required.");
          req.getRequestDispatcher(PROFILE_VIEW).forward(req, resp);
          return;
        }

        int height = Integer.parseInt(heightStr);
        int weight = Integer.parseInt(weightStr);

        String primaryGoal = trim(req.getParameter("primaryGoal"));
        String experienceLevel = trim(req.getParameter("experienceLevel"));

        user.setHeight(height);
        user.setWeight(weight);
        user.setPrimaryGoal(primaryGoal);
        user.setExperienceLevel(experienceLevel);

        req.setAttribute("message", "Fitness profile updated.");
        req.getRequestDispatcher(PROFILE_VIEW).forward(req, resp);
        return;
      }

      // Unknown action
      req.setAttribute("error", "Unknown profile update action.");
      req.getRequestDispatcher(PROFILE_VIEW).forward(req, resp);

    } catch (NumberFormatException e) {
      req.setAttribute("error", "Height and weight must be valid numbers.");
      req.getRequestDispatcher(PROFILE_VIEW).forward(req, resp);
    }
  }

  private static boolean isEmpty(String s) {
    return s == null || s.trim().isEmpty();
  }

  private static String trim(String s) {
    return s == null ? null : s.trim();
  }
}
