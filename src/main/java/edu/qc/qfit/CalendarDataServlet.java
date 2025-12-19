// This servlet simulates scheduled workout events that would normally
// be stored in a database or retrieved from an external calendar service.
// It returns JSON event data consumed by JavaScript (FullCalendar).


package edu.qc.qfit;

import java.io.IOException;
import java.time.LocalDate;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/CalendarDataServlet")
public class CalendarDataServlet extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {

    HttpSession session = req.getSession(false);
    if (session == null || session.getAttribute("currentUser") == null) {
      resp.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
      return;
    }

    resp.setContentType("application/json");
    resp.setCharacterEncoding("UTF-8");

    LocalDate today = LocalDate.now();
    String d1 = today.toString();
    String d2 = today.plusDays(2).toString();

    String json =
        "["
            + "{\"title\":\"Strength Day\",\"start\":\"" + d1 + "\"},"
            + "{\"title\":\"Cardio\",\"start\":\"" + d2 + "\"}"
            + "]";

    resp.getWriter().write(json);
  }
}
