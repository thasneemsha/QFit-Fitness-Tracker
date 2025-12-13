<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Roles &amp; Permissions · QFit Admin</title>
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
                <h1 class="qfit-title">QFit Admin · Roles &amp; Permissions</h1>
                <p class="qfit-subtitle">Assign coaches to students and manage system roles</p>
            </div>
        </div>
    </header>

    <main class="qfit-main">
        <section class="qfit-glass-card qfit-admin-roles-card">

            <!-- Top row: breadcrumb + logout -->
            <div class="qfit-admin-header-row qfit-admin-manage-header">
                <div class="qfit-admin-breadcrumb">
                    <a href="adminDashboard.jsp" class="qfit-link">Dashboard</a>
                    <span>›</span>
                    <span>Roles &amp; Permissions</span>
                </div>
                <button type="button"
                        class="qfit-btn qfit-btn-secondary qfit-btn-sm"
                        onclick="window.location.href='../index.jsp'">
                    Log Out
                </button>
            </div>

            <!-- Quick description -->
            <div class="qfit-admin-roles-intro">
                <p class="qfit-admin-subtext">
                    Use this page to assign students to coaches, change roles (student / coach / admin),
                    and keep access levels up to date. All data below is placeholder until MySQL and servlets
                    are connected.
                </p>
            </div>

            <!-- Assign coach form -->
            <div class="qfit-admin-roles-grid">

                <div class="qfit-admin-assign-card">
                    <h2 class="qfit-admin-heading">Assign Student to Coach</h2>
                    <p class="qfit-admin-subtext">
                        Select a student and coach. When we add the backend, this will create or update their assignment.
                    </p>

                    <form class="qfit-assign-form">
                        <div class="qfit-form-group">
                            <label for="studentSelect">Student</label>
                            <select id="studentSelect" name="studentId">
                                <option value="">Select student…</option>
                                <option value="1">Ali Ahmed · ali.ahmed00@qmail.cuny.edu</option>
                                <option value="2">Sara Khan · sara.khan01@qmail.cuny.edu</option>
                                <option value="3">Mark Chen · mark.chen02@qmail.cuny.edu</option>
                            </select>
                        </div>

                        <div class="qfit-form-group">
                            <label for="coachSelect">Coach</label>
                            <select id="coachSelect" name="coachId">
                                <option value="">Select coach…</option>
                                <option value="10">David Lee · Weightlifting / Strength</option>
                                <option value="11">Emily Rodriguez · Cardio / Endurance</option>
                                <option value="12">Maria Gomez · Rehab / Mobility</option>
                            </select>
                        </div>

                        <div class="qfit-form-group">
                            <label for="notes">Notes (optional)</label>
                            <textarea id="notes" name="notes"
                                      placeholder="Example: Focus on strength training before midterm break."></textarea>
                        </div>

                        <div class="qfit-assign-actions">
                            <!-- Later this will submit to a servlet -->
                            <button type="button" class="qfit-btn qfit-btn-primary qfit-btn-sm">
                                Save Assignment (UI only)
                            </button>
                        </div>
                    </form>
                </div>

                <!-- Current assignments list -->
                <div class="qfit-admin-assign-card">
                    <h2 class="qfit-admin-heading">Current Coach–Student Assignments</h2>
                    <p class="qfit-admin-subtext">
                        Overview of which coach is responsible for each student.
                    </p>

                    <div class="qfit-table-wrapper qfit-table-wrapper-compact">
                        <table class="qfit-table qfit-table-compact">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>Student</th>
                                <th>Coach</th>
                                <th>Coaching Area</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <!-- Sample rows -->
                            <tr>
                                <td>1</td>
                                <td>Ali Ahmed</td>
                                <td>David Lee</td>
                                <td>Weightlifting / Strength</td>
                                <td><span class="qfit-status-badge qfit-status-active">Active</span></td>
                                <td class="qfit-table-actions">
                                    <button type="button"
                                            class="qfit-btn qfit-btn-sm qfit-btn-secondary">
                                        Reassign
                                    </button>
                                    <button type="button"
                                            class="qfit-btn qfit-btn-sm qfit-btn-reject">
                                        Remove
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Sara Khan</td>
                                <td>Emily Rodriguez</td>
                                <td>Cardio / Endurance</td>
                                <td><span class="qfit-status-badge qfit-status-active">Active</span></td>
                                <td class="qfit-table-actions">
                                    <button type="button"
                                            class="qfit-btn qfit-btn-sm qfit-btn-secondary">
                                        Reassign
                                    </button>
                                    <button type="button"
                                            class="qfit-btn qfit-btn-sm qfit-btn-reject">
                                        Remove
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>Mark Chen</td>
                                <td>Maria Gomez</td>
                                <td>Rehab / Mobility</td>
                                <td><span class="qfit-status-badge qfit-status-disabled">On hold</span></td>
                                <td class="qfit-table-actions">
                                    <button type="button"
                                            class="qfit-btn qfit-btn-sm qfit-btn-approve">
                                        Reactivate
                                    </button>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>

            <!-- Role matrix -->
            <div class="qfit-admin-table-section qfit-admin-roles-matrix">
                <h2 class="qfit-admin-heading">Role Overview</h2>
                <p class="qfit-admin-subtext">
                    Summary of user accounts by role. Later this will be driven by live data from the database.
                </p>

                <div class="qfit-table-wrapper qfit-table-wrapper-compact">
                    <table class="qfit-table qfit-table-compact">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>User Name</th>
                            <th>Email</th>
                            <th>Current Role</th>
                            <th>Change Role</th>
                        </tr>
                        </thead>
                        <tbody>
                        <!-- Sample data -->
                        <tr>
                            <td>1</td>
                            <td>Ali Ahmed</td>
                            <td>ali.ahmed00@qmail.cuny.edu</td>
                            <td><span class="qfit-role-pill qfit-role-student">Student</span></td>
                            <td class="qfit-table-actions">
                                <button type="button" class="qfit-btn qfit-btn-sm qfit-btn-secondary">
                                    Make Coach
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>David Lee</td>
                            <td>david.lee02@qmail.cuny.edu</td>
                            <td><span class="qfit-role-pill qfit-role-coach">Coach</span></td>
                            <td class="qfit-table-actions">
                                <button type="button" class="qfit-btn qfit-btn-sm qfit-btn-secondary">
                                    Make Admin
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>System Owner</td>
                            <td>admin@qfit.local</td>
                            <td><span class="qfit-role-pill qfit-role-admin">Admin</span></td>
                            <td class="qfit-table-actions">
                                <button type="button" class="qfit-btn qfit-btn-sm qfit-btn-secondary" disabled>
                                    Locked
                                </button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <p class="qfit-note qfit-note-small qfit-admin-info-note">
                    The buttons above are UI only for now. Once we connect the backend, they will update
                    user roles in the database and enforce permissions across the QFit system.
                </p>
            </div>

        </section>
    </main>

    <footer class="qfit-footer">
        <p>© 2025 QFit Universal Workout Tracker · Queens College</p>
    </footer>
</div>

</body>
</html>
