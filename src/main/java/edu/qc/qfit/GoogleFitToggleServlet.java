package edu.qc.qfit;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/GoogleFitToggleServlet")
public class GoogleFitToggleServlet extends HttpServlet {

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

    HttpSession session = req.getSession(false);
    if (session == null || session.getAttribute("currentUser") == null) {
      resp.sendRedirect(req.getContextPath() + "/");
      return;
    }

    Boolean connected = (Boolean) session.getAttribute("googleFitConnected");
    boolean newValue = (connected == null) ? true : !connected;

    session.setAttribute("googleFitConnected", newValue);

    resp.sendRedirect(req.getContextPath() + "/DashboardServlet");
  }
}
