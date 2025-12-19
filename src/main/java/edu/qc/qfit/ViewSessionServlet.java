package edu.qc.qfit;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ViewSessionServlet")
public class ViewSessionServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // Require login
        HttpSession httpSession = req.getSession(false);
        if (httpSession == null || httpSession.getAttribute("currentUser") == null) {
            resp.sendRedirect(req.getContextPath() + "/");
            return;
        }

        // Get sessionId from URL
        String sessionId = req.getParameter("sessionId");

        @SuppressWarnings("unchecked")
        List<LoggedSession> loggedSessions =
                (List<LoggedSession>) httpSession.getAttribute("loggedSessions");

        LoggedSession found = null;

        if (sessionId != null && loggedSessions != null) {
            for (LoggedSession s : loggedSessions) {
                if (s.getId().equals(sessionId)) {
                    found = s;
                    break;
                }
            }
        }

        // Pass result (found OR null) to JSP
        req.setAttribute("session", found);

        // ✅ UPDATED PATH (THIS WAS THE BUG)
        req.getRequestDispatcher("/WEB-INF/views/viewSession.jsp")
           .forward(req, resp);
    }
}
