<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard · QFit</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- note the ../ because this file is in /admin -->
    <link rel="stylesheet" href="../static/css/styles.css">
</head>
<body class="qfit-body">

<div class="qfit-page-wrapper">
    <div class="qfit-bg-gradient"></div>

    <!-- Header -->
    <header class="qfit-header">
        <div class="qfit-logo-group">
            <img src="../static/images/logo.png" alt="QFit Logo" class="qfit-logo">
            <div class="qfit-title-block">
                <h1 class="qfit-title">QFit Admin Dashboard</h1>
                <p class="qfit-subtitle">Manage users, approvals, and system roles</p>
            </div>
        </div>
    </header>

    <main class="qfit-main">
        <section class="qfit-glass-card qfit-admin-card">
            <!-- Top row: welcome + quick info -->
            <div class="qfit-admin-header-row">
                <div>
                    <h2 class="qfit-admin-heading">Welcome, Admin</h2>
                    <p class="qfit-admin-subtext">
                        Review pending registrations, monitor active users and coaches,
                        and keep the QFit system running smoothly.
                    </p>
                </div>
                <div class="qfit-admin-tag">
                    <span class="qfit-admin-dot"></span>
                    System Status: Online
                </div>
            </div>

            <!-- Summary stats (static placeholders for now) -->
            <div class="qfit-admin-summary">
                <div class="qfit-admin-summary-item">
                    <p class="qfit-admin-summary-label">Pending Approvals</p>
                    <p class="qfit-admin-summary-value">12</p>
                    <p class="qfit-admin-summary-note">Students + coaches awaiting review</p>
                </div>

                <div class="qfit-admin-summary-item">
                    <p class="qfit-admin-summary-label">Active Students</p>
                    <p class="qfit-admin-summary-value">85</p>
                    <p class="qfit-admin-summary-note">Approved student accounts</p>
                </div>

                <div class="qfit-admin-summary-item">
                    <p class="qfit-admin-summary-label">Active Coaches</p>
                    <p class="qfit-admin-summary-value">14</p>
                    <p class="qfit-admin-summary-note">Approved coach accounts</p>
                </div>
            </div>

            <!-- Two-column layout: quick actions + recent activity -->
            <div class="qfit-admin-grid">
                <!-- Left: Quick actions -->
                <div class="qfit-admin-section">
                    <h3>Quick Actions</h3>
                    <p class="qfit-admin-subtext">
                        Common admin tasks you will perform daily.
                    </p>

                    <div class="qfit-admin-actions">
                        <button type="button"
                                class="qfit-btn qfit-btn-primary"
                                onclick="window.location.href='adminUserManagement.jsp'">
                            Review Pending Accounts
                        </button>

                        <!-- 🔽 Changed to go to All Accounts page -->
                        <button type="button"
                                class="qfit-btn qfit-btn-secondary"
                                onclick="window.location.href='adminAllAccounts.jsp'">
                            View All Users &amp; Coaches
                        </button>

                        <button type="button"
                                class="qfit-btn qfit-btn-secondary"
                                onclick="window.location.href='adminRoles.jsp'">
                            Manage Roles &amp; Permissions
                        </button>
                    </div>
                </div>

                <!-- Right: Recent system notes (static for now) -->
                <div class="qfit-admin-section">
                    <h3>System Notes</h3>
                    <ul class="qfit-admin-list">
                        <li>
                            <span class="qfit-admin-pill qfit-pill-pending">Pending</span>
                            5 new student registrations require ID verification.
                        </li>
                        <li>
                            <span class="qfit-admin-pill qfit-pill-pending">Pending</span>
                            2 new coach applications submitted today.
                        </li>
                        <li>
                            <span class="qfit-admin-pill qfit-pill-info">Info</span>
                            Remember to deactivate accounts for graduated students at the end of term.
                        </li>
                        <li>
                            <span class="qfit-admin-pill qfit-pill-info">Info</span>
                            Admin actions will be logged for audit in a future version.
                        </li>
                    </ul>

                    <p class="qfit-note qfit-note-small">
                        All numbers above are placeholders. After we connect the database,
                        this dashboard will show real-time statistics for the QFit system.
                    </p>
                </div>
            </div>

            <!-- Bottom row: logout -->
            <div class="qfit-admin-footer-row">
                <button type="button"
                        class="qfit-btn qfit-role-btn-ghost"
                        onclick="window.location.href='../index.jsp'">
                    Log Out
                </button>
            </div>
        </section>
    </main>

    <footer class="qfit-footer">
        <p>© 2025 QFit Universal Workout Tracker · Queens College</p>
    </footer>
</div>

</body>
</html>
