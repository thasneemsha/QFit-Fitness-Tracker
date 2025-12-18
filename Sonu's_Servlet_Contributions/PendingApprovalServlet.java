package edu.qc.qfit;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/PendingApprovalServlet")
public class PendingApprovalServlet extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {

    // Show the pending approval page (now located under WEB-INF/views)
    req.getRequestDispatcher("/WEB-INF/views/pendingAproval.jsp").forward(req, resp);
  }
}
