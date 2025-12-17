package edu.qc.qfit;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {

    HttpSession session = req.getSession(false);
    if (session != null) {
      session.removeAttribute("currentUser");
      session.removeAttribute("loggedSessions");
      session.removeAttribute("activePlans");
      session.invalidate();
    }

    resp.sendRedirect(req.getContextPath() + "/");
  }

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    doGet(req, resp);
  }
}
