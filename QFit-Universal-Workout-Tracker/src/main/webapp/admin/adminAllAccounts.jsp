<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>All Accounts · QFit Admin</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                <h1 class="qfit-title">QFit Admin · All Accounts</h1>
                <p class="qfit-subtitle">View all approved students and coaches in the system</p>
            </div>
        </div>
    </header>

    <main class="qfit-main">
        <section class="qfit-glass-card qfit-admin-manage-card">

            <!-- Top row: breadcrumb + actions -->
            <div class="qfit-admin-header-row qfit-admin-manage-header">
                <div class="qfit-admin-breadcrumb">
                    <a href="adminDashboard.jsp" class="qfit-link">Dashboard</a>
                    <span>›</span>
                    <span>All Accounts</span>
                </div>
                <button type="button"
                        class="qfit-btn qfit-btn-secondary qfit-btn-sm"
                        onclick="window.location.href='../index.jsp'">
                    Log Out
                </button>
            </div>

            <!-- Filter row -->
            <div class="qfit-admin-filter-row">
                <div class="qfit-admin-toggle-group">
                    <button type="button"
                            class="qfit-toggle-btn"
                            onclick="window.location.href='adminUserManagement.jsp'">
                        Pending Approvals
                    </button>
                    <button type="button"
                            class="qfit-toggle-btn qfit-toggle-btn-active">
                        All Accounts
                    </button>
                </div>

                <div class="qfit-admin-search">
                    <input type="text" placeholder="Search by name, email, or role…">
                </div>
            </div>

            <!-- All Students -->
            <div class="qfit-admin-table-section">
                <h2 class="qfit-admin-heading">Student Accounts</h2>
                <p class="qfit-admin-subtext">
                    These are all approved student users currently in the QFit system.
                </p>

                <div class="qfit-table-wrapper">
                    <table class="qfit-table">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Student Name</th>
                            <th>Email</th>
                            <th>Status</th>
                            <th>Created</th>
                            <th>Last Login</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <!-- Placeholder rows for now -->
                        <tr>
                            <td>1</td>
                            <td>Ali Ahmed</td>
                            <td>ali.ahmed00@qmail.cuny.edu</td>
                            <td>
                                <span class="qfit-status-badge qfit-status-active">Active</span>
                            </td>
                            <td>2025-09-10</td>
                            <td>2025-11-22 14:15</td>
                            <td class="qfit-table-actions">
                                <button type="button" class="qfit-btn qfit-btn-sm qfit-btn-secondary">View</button>
                                <button type="button" class="qfit-btn qfit-btn-sm qfit-btn-reject">Deactivate</button>
                            </td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>Sara Khan</td>
                            <td>sara.khan01@qmail.cuny.edu</td>
                            <td>
                                <span class="qfit-status-badge qfit-status-active">Active</span>
                            </td>
                            <td>2025-10-02</td>
                            <td>2025-11-23 09:32</td>
                            <td class="qfit-table-actions">
                                <button type="button" class="qfit-btn qfit-btn-sm qfit-btn-secondary">View</button>
                                <button type="button" class="qfit-btn qfit-btn-sm qfit-btn-reject">Deactivate</button>
                            </td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>Mark Chen</td>
                            <td>mark.chen02@qmail.cuny.edu</td>
                            <td>
                                <span class="qfit-status-badge qfit-status-disabled">Disabled</span>
                            </td>
                            <td>2025-08-18</td>
                            <td>2025-10-01 11:05</td>
                            <td class="qfit-table-actions">
                                <button type="button" class="qfit-btn qfit-btn-sm qfit-btn-approve">Activate</button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- All Coaches -->
            <div class="qfit-admin-table-section">
                <h2 class="qfit-admin-heading">Coach Accounts</h2>
                <p class="qfit-admin-subtext">
                    Approved coaches who can view student workouts and leave feedback.
                </p>

                <div class="qfit-table-wrapper">
                    <table class="qfit-table">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Coach Name</th>
                            <th>Email</th>
                            <th>Coaching Area</th>
                            <th>Status</th>
                            <th>Created</th>
                            <th>Last Login</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <!-- Placeholder rows for now -->
                        <tr>
                            <td>1</td>
                            <td>David Lee</td>
                            <td>david.lee02@qmail.cuny.edu</td>
                            <td>Weightlifting / Strength</td>
                            <td>
                                <span class="qfit-status-badge qfit-status-active">Active</span>
                            </td>
                            <td>2025-09-20</td>
                            <td>2025-11-24 10:48</td>
                            <td class="qfit-table-actions">
                                <button type="button" class="qfit-btn qfit-btn-sm qfit-btn-secondary">View</button>
                                <button type="button" class="qfit-btn qfit-btn-sm qfit-btn-reject">Deactivate</button>
                            </td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>Emily Rodriguez</td>
                            <td>emily.rod03@qmail.cuny.edu</td>
                            <td>Cardio / Endurance</td>
                            <td>
                                <span class="qfit-status-badge qfit-status-active">Active</span>
                            </td>
                            <td>2025-10-05</td>
                            <td>2025-11-23 18:02</td>
                            <td class="qfit-table-actions">
                                <button type="button" class="qfit-btn qfit-btn-sm qfit-btn-secondary">View</button>
                                <button type="button" class="qfit-btn qfit-btn-sm qfit-btn-reject">Deactivate</button>
                            </td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>Maria Gomez</td>
                            <td>maria.gomez04@qmail.cuny.edu</td>
                            <td>Rehabilitation / Mobility</td>
                            <td>
                                <span class="qfit-status-badge qfit-status-disabled">Disabled</span>
                            </td>
                            <td>2025-07-29</td>
                            <td>2025-09-15 16:20</td>
                            <td class="qfit-table-actions">
                                <button type="button" class="qfit-btn qfit-btn-sm qfit-btn-approve">Activate</button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="qfit-note qfit-note-small qfit-admin-info-note">
                All records above are sample data. After MySQL and the admin servlets are connected,
                this page will load real student and coach accounts and allow you to activate or deactivate them.
            </div>

        </section>
    </main>

    <footer class="qfit-footer">
        <p>© 2025 QFit Universal Workout Tracker · Queens College</p>
    </footer>
</div>

</body>
</html>
