<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Management · QFit Admin</title>
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
                <h1 class="qfit-title">QFit Admin · User Management</h1>
                <p class="qfit-subtitle">Review pending accounts and manage active student users</p>
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
                    <span>User Management</span>
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
                    <button type="button" class="qfit-toggle-btn qfit-toggle-btn-active">
                        Pending Approvals
                    </button>
                    <!-- Navigation to All Accounts page -->
                    <button type="button"
                            class="qfit-toggle-btn"
                            onclick="window.location.href='adminAllAccounts.jsp'">
                        All Accounts
                    </button>
                </div>

                <div class="qfit-admin-search">
                    <input type="text" placeholder="Search by name or email…">
                </div>
            </div>

            <!-- Pending approvals table (students only) -->
            <div class="qfit-admin-table-section">
                <h2 class="qfit-admin-heading">Pending Student Accounts</h2>
                <p class="qfit-admin-subtext">
                    Review each student’s registration and verify their Queens College ID images before approval.
                </p>

                <div class="qfit-table-wrapper">
                    <table class="qfit-table">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Student Name</th>
                            <th>Email</th>
                            <th>Submitted</th>
                            <th>ID Front</th>
                            <th>ID Back</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <!-- Placeholder rows for now; later we will loop over DB results -->
                        <tr>
                            <td>1</td>
                            <td>Ali Ahmed</td>
                            <td>ali.ahmed00@qmail.cuny.edu</td>
                            <td>2025-11-24 18:30</td>
                            <td><a href="#" class="qfit-link">View</a></td>
                            <td><a href="#" class="qfit-link">View</a></td>
                            <td class="qfit-table-actions">
                                <button type="button" class="qfit-btn qfit-btn-approve qfit-btn-sm">Approve</button>
                                <button type="button" class="qfit-btn qfit-btn-reject  qfit-btn-sm">Reject</button>
                            </td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>Sara Khan</td>
                            <td>sara.khan01@qmail.cuny.edu</td>
                            <td>2025-11-24 17:55</td>
                            <td><a href="#" class="qfit-link">View</a></td>
                            <td><a href="#" class="qfit-link">View</a></td>
                            <td class="qfit-table-actions">
                                <button type="button" class="qfit-btn qfit-btn-approve qfit-btn-sm">Approve</button>
                                <button type="button" class="qfit-btn qfit-btn-reject  qfit-btn-sm">Reject</button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Info note -->
            <div class="qfit-note qfit-note-small qfit-admin-info-note">
                All records above are sample data. After we connect MySQL and servlets,
                this page will display real pending student users from the database,
                and the Approve / Reject buttons will update their status.
            </div>
        </section>
    </main>

    <footer class="qfit-footer">
        <p>© 2025 QFit Universal Workout Tracker · Queens College</p>
    </footer>
</div>

</body>
</html>
