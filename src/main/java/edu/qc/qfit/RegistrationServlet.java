package edu.qc.qfit;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.*;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/RegistrationServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,      // 1MB
    maxFileSize = 5 * 1024 * 1024,         // 5MB per file
    maxRequestSize = 12 * 1024 * 1024      // 12MB total
)
public class RegistrationServlet extends HttpServlet {

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {

    // --- Read fields ---
    String fullName = trim(req.getParameter("fullName"));
    String email = trim(req.getParameter("email"));
    String password = req.getParameter("password");
    String confirmPassword = req.getParameter("confirmPassword");

    String heightStr = trim(req.getParameter("height"));
    String weightStr = trim(req.getParameter("weight"));
    String primaryGoal = trim(req.getParameter("primaryGoal"));
    String experienceLevel = trim(req.getParameter("experienceLevel"));

    // --- Validate (minimal, matches JSP intent) ---
    String error = null;

    if (isEmpty(fullName)) error = "Full name is required.";
    else if (isEmpty(email)) error = "Email is required.";
    else if (!email.toLowerCase().endsWith("@qmail.cuny.edu")) error = "Email must end with @qmail.cuny.edu.";
    else if (isEmpty(password) || isEmpty(confirmPassword)) error = "Password and confirm password are required.";
    else if (!password.equals(confirmPassword)) error = "Passwords do not match.";
    else if (isEmpty(heightStr) || isEmpty(weightStr)) error = "Height and weight are required.";
    else if (isEmpty(primaryGoal)) error = "Please select a primary fitness goal.";
    else if (isEmpty(experienceLevel)) error = "Please select an experience level.";

    Integer height = null;
    Integer weight = null;
    if (error == null) {
      try {
        height = Integer.valueOf(heightStr);
        weight = Integer.valueOf(weightStr);
      } catch (NumberFormatException e) {
        error = "Height and weight must be valid numbers.";
      }
    }

    Part idFront = null;
    Part idBack = null;
    if (error == null) {
      try {
        idFront = req.getPart("idFront");
        idBack  = req.getPart("idBack");
      } catch (IllegalStateException tooBig) {
        error = "Uploaded file is too large (max 5MB per file).";
      }
    }

    if (error == null) {
      if (idFront == null || idFront.getSize() == 0) error = "Please upload your QC ID front image.";
      else if (idBack == null || idBack.getSize() == 0) error = "Please upload your QC ID back image.";
    }

    // --- If error: forward back to register.jsp with values preserved ---
    if (error != null) {
      req.setAttribute("error", error);
      req.setAttribute("fullName", fullName);
      req.setAttribute("email", email);
      req.setAttribute("height", heightStr);
      req.setAttribute("weight", weightStr);

      // NOTE: your JSP currently does NOT bind these hidden values from requestScope.
      // We'll fix that in the next step if you want.
      req.setAttribute("primaryGoal", primaryGoal);
      req.setAttribute("experienceLevel", experienceLevel);

      req.getRequestDispatcher("/register.jsp").forward(req, resp);
      return;
    }

    // --- TEMP storage for uploads (no DB yet) ---
    // Save files under: <catalina.base>/qfit_uploads/<uuid>/
    String catalinaBase = System.getProperty("catalina.base");
    if (catalinaBase == null) catalinaBase = System.getProperty("user.home");

    String regId = UUID.randomUUID().toString();
    Path uploadDir = Paths.get(catalinaBase, "qfit_uploads", regId);
    Files.createDirectories(uploadDir);

    savePart(idFront, uploadDir.resolve(safeName("idFront", idFront)));
    savePart(idBack,  uploadDir.resolve(safeName("idBack",  idBack)));

    // --- NEXT PAGE ---
    // IMPORTANT: do NOT forward directly to /WEB-INF/views/*.jsp
    // Always go through a servlet.
    resp.sendRedirect(req.getContextPath() + "/PendingApprovalServlet");
  }

  private static void savePart(Part part, Path dest) throws IOException {
    try (InputStream in = part.getInputStream()) {
      Files.copy(in, dest, StandardCopyOption.REPLACE_EXISTING);
    }
  }

  private static String safeName(String prefix, Part part) {
    String submitted = part.getSubmittedFileName();
    String ext = "";

    if (submitted != null) {
      int dot = submitted.lastIndexOf('.');
      if (dot >= 0 && dot < submitted.length() - 1) {
        String candidate = submitted.substring(dot).toLowerCase();
        // allow only basic image extensions
        if (candidate.matches("\\.(png|jpg|jpeg|gif|webp)")) ext = candidate;
      }
    }
    return prefix + ext;
  }

  private static boolean isEmpty(String s) { return s == null || s.trim().isEmpty(); }
  private static String trim(String s) { return s == null ? null : s.trim(); }
}
