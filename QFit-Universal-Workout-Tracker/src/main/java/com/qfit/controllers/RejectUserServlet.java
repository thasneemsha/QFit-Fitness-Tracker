package com.qfit.controllers;

import com.qfit.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/rejectUser")
public class RejectUserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        long id = Long.parseLong(req.getParameter("userId"));

        UserDao dao = new UserDao();

        try {
            dao.rejectUser(id);
            resp.sendRedirect("admin/pending");

        } catch (Exception e) {
            resp.sendError(500, "Error rejecting user");
        }
    }
}
