package edu.qc.qfit;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/EditPlanServlet")
public class EditPlanServlet extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {

    HttpSession session = req.getSession(false);
    if (session == null || session.getAttribute("currentUser") == null) {
      resp.sendRedirect(req.getContextPath() + "/");
      return;
    }

    // For now: just load the edit page (you can wire updates later)
    req.getRequestDispatcher("/WEB-INF/views/editPlan.jsp").forward(req, resp);
  }
}
