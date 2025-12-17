package edu.qc.qfit;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.*;

@WebFilter("/*")
public class AuthCacheFilter implements Filter {

  @Override
  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
      throws IOException, ServletException {

    HttpServletRequest req = (HttpServletRequest) request;
    HttpServletResponse resp = (HttpServletResponse) response;

    String ctx = req.getContextPath();     // /qfit
    String uri = req.getRequestURI();      // /qfit/login
    String path = uri.substring(ctx.length()); // /login

    // Allow static assets
    boolean isStatic =
        path.startsWith("/static/") ||
        path.startsWith("/images/") ||
        path.startsWith("/css/") ||
        path.startsWith("/js/");

    // Public routes (NO login required)
    boolean isPublic =
        path.equals("/") ||
        path.equals("/index.jsp") ||
        path.equals("/register.jsp") ||
        path.equals("/error.jsp") ||
        path.equals("/login") ||                 // <-- IMPORTANT (your LoginServlet mapping)
        path.equals("/RegistrationServlet") ||
        path.equals("/PendingApprovalServlet");  // if/when you add it

    if (isStatic || isPublic) {
      chain.doFilter(request, response);
      return;
    }

    // Protected routes -> prevent caching (fixes back button after logout)
    resp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    resp.setHeader("Pragma", "no-cache");
    resp.setDateHeader("Expires", 0);

    // Require login
    HttpSession session = req.getSession(false);
    boolean loggedIn = (session != null && session.getAttribute("currentUser") != null);

    if (!loggedIn) {
      resp.sendRedirect(ctx + "/");
      return;
    }

    // Block direct JSP access (since you moved JSPs under WEB-INF/views)
    if (path.endsWith(".jsp")) {
      resp.sendRedirect(ctx + "/DashboardServlet");
      return;
    }

    chain.doFilter(request, response);
  }
}
