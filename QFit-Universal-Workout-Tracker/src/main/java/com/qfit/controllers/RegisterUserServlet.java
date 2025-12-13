package com.qfit.controllers;

import com.qfit.dao.UserDao;
import com.qfit.models.User;
import com.qfit.utils.PasswordUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;

@WebServlet(name = "RegisterUserServlet", urlPatterns = {"/registerUser"})
@MultipartConfig
public class RegisterUserServlet extends HttpServlet {

    /**
     * NEW: Relative uploads folder inside the project.
     * This works for ALL teammates without modification.
     */
    private static String UPLOAD_BASE_DIR;

    @Override
    public void init() throws ServletException {
        // Resolve relative path: <project>/uploads
        UPLOAD_BASE_DIR = getServletContext().getRealPath("/") + "uploads";

        // Ensure base folder exists
        File base = new File(UPLOAD_BASE_DIR);
        if (!base.exists()) {
            base.mkdirs();
        }

        System.out.println("UPLOAD DIR = " + UPLOAD_BASE_DIR);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        Part idFrontPart = request.getPart("idFront");
        Part idBackPart = request.getPart("idBack");

        // Basic validation
        if (isBlank(fullName) || isBlank(email) || isBlank(password)
                || idFrontPart == null || idFrontPart.getSize() == 0
                || idBackPart == null || idBackPart.getSize() == 0) {

            request.setAttribute("error", "Please fill all required fields and upload both ID images.");
            request.getRequestDispatcher("registerUser.jsp").forward(request, response);
            return;
        }

        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Passwords do not match.");
            request.getRequestDispatcher("registerUser.jsp").forward(request, response);
            return;
        }

        // Save ID images
        String frontPath;
        String backPath;
        try {
            frontPath = saveUpload(idFrontPart, "id/front");
            backPath = saveUpload(idBackPart, "id/back");
        } catch (IOException e) {
            e.printStackTrace();
            request.setAttribute("error", "Error saving ID images. Please try again.");
            request.getRequestDispatcher("registerUser.jsp").forward(request, response);
            return;
        }

        // Build user object
        User user = new User();
        user.setFullName(fullName.trim());
        user.setEmail(email.trim());
        user.setPhone(phone != null ? phone.trim() : null);
        user.setPasswordHash(PasswordUtil.hashPassword(password));

        // Matches ENUM in future DB
        user.setRole("student");
        user.setStatus("pending");

        user.setIdFrontPath(frontPath);
        user.setIdBackPath(backPath);

        UserDao userDao = new UserDao();

        // TEMP fake DB
        if (userDao.emailExists(user.getEmail())) {
            request.setAttribute("error", "An account with this email already exists.");
            request.getRequestDispatcher("registerUser.jsp").forward(request, response);
            return;
        }

        Long id = userDao.createPendingStudent(user);
        if (id == null) {
            request.setAttribute("error", "Could not create account. Please try again.");
            request.getRequestDispatcher("registerUser.jsp").forward(request, response);
            return;
        }

        // success
        request.setAttribute("fullName", user.getFullName());
        request.setAttribute("email", user.getEmail());
        request.getRequestDispatcher("pendingApproval.jsp").forward(request, response);
    }

    private String saveUpload(Part part, String subFolder) throws IOException {

        String submittedName = getFileName(part);
        String extension = "";
        if (submittedName != null && submittedName.contains(".")) {
            extension = submittedName.substring(submittedName.lastIndexOf('.'));
        }

        String fileName = System.currentTimeMillis() + extension;

        File dir = new File(UPLOAD_BASE_DIR, subFolder);
        if (!dir.exists()) {
            dir.mkdirs();
        }

        File file = new File(dir, fileName);
        part.write(file.getAbsolutePath());

        // Return relative path (stored for future DB)
        return subFolder + "/" + fileName;
    }

    private String getFileName(Part part) {
        String cd = part.getHeader("content-disposition");
        if (cd == null) return null;
        for (String token : cd.split(";")) {
            token = token.trim();
            if (token.startsWith("filename=")) {
                return token.substring(token.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }

    private boolean isBlank(String s) {
        return s == null || s.trim().isEmpty();
    }
}
