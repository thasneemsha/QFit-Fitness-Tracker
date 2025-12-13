package com.qfit.dao;

import com.qfit.models.User;

/**
 * TEMPORARY UserDao with NO real database connection.
 *
 * This version is just to keep the project compiling and
 * let the registration + admin flow work for the demo
 * (pendingApproval.jsp, admin pages) WITHOUT talking to MySQL.
 *
 * Later, when you are ready for MySQL / AWS,
 * we will replace these methods with real JDBC code using DBUtil.
 */
public class UserDao {

    /**
     * Check if an email already exists.
     * TEMP: no database, so always return false (email not found).
     */
    public boolean emailExists(String email) {
        // No DB yet → pretend email does NOT exist
        return false;
    }

    /**
     * Create a new pending STUDENT user.
     * TEMP: no database, so just pretend success and return fake ID.
     */
    public Long createPendingStudent(User user) {
        // No DB yet → pretend we inserted and got ID = 1
        return 1L;
    }

    /**
     * TEMP: Approve user by ID.
     * No real DB → just pretend success and return true.
     */
    public boolean approveUser(long userId) {
        // Later: real UPDATE users SET status='active' WHERE id = ?
        return true;
    }

    /**
     * TEMP: Reject user by ID.
     * No real DB → just pretend success and return true.
     */
    public boolean rejectUser(long userId) {
        // Later: real UPDATE users SET status='rejected' WHERE id = ?
        return true;
    }

    // Later we can add real DB methods:
    // - findByStatus(String status)
    // - findAllStudents()
    // - findAllCoaches()
    // - etc.
}
