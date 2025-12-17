<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="admin" value="${sessionScope.currentAdmin}" />

<c:url var="cssUrl" value="/static/css/styles.css" />
<c:url var="dashboardCssUrl" value="/static/css/dashboard.css" />
<c:url var="logoutUrl" value="/LogoutServlet" />
<c:url var="adminActionUrl" value="/AdminActionServlet" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Panel · QFit Fitness Tracker</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="${cssUrl}">
    <link rel="stylesheet" href="${dashboardCssUrl}">
</head>

<body class="qfit-body qfit-dashboard-body">

<div class="qfit-page-wrapper">
    <div class="qfit-bg-gradient"></div>

    <header class="qfit-nav">
        <div class="qfit-logo-group">
            <h1 class="qfit-title">QFit Admin Panel</h1>
        </div>

        <nav class="qfit-nav-actions">
            <a href="${logoutUrl}" class="qfit-btn qfit-btn-secondary qfit-logout-btn">Log Out</a>
        </nav>
    </header>

    <main class="qfit-dashboard-main qfit-admin-main">
        <div class="qfit-admin-card qfit-glass-card">

            <!-- HEADER -->
            <div class="qfit-admin-header-row">
                <div>
                    <h2 class="qfit-admin-heading">
                        Welcome back, <c:out value="${admin.fullName}" default="Admin"/>!
                    </h2>
                    <p class="qfit-admin-subtext">Quick overview of user activity and admin controls.</p>
                </div>

                <span class="qfit-admin-tag">
                    <span class="qfit-admin-dot"></span> Administrator
                </span>
            </div>

            <!-- SUMMARY -->
            <div class="qfit-admin-summary">
                <div class="qfit-admin-summary-item qfit-summary-pending">
                    <p class="qfit-admin-summary-label">Pending Verification</p>
                    <p class="qfit-admin-summary-value">
                        <c:out value="${requestScope.pendingCount}" default="0"/>
                    </p>
                </div>

                <div class="qfit-admin-summary-item qfit-summary-active">
                    <p class="qfit-admin-summary-label">Active Students</p>
                    <p class="qfit-admin-summary-value">
                        <c:out value="${requestScope.activeCount}" default="0"/>
                    </p>
                </div>

                <div class="qfit-admin-summary-item qfit-summary-total">
                    <p class="qfit-admin-summary-label">Total Users</p>
                    <p class="qfit-admin-summary-value">
                        <c:out value="${requestScope.totalCount}" default="0"/>
                    </p>
                </div>
            </div>

            <!-- QUICK ACTIONS -->
            <div class="qfit-admin-section">
                <h3>Quick Actions</h3>
                <div class="qfit-quick-actions">
                    <button class="qfit-btn qfit-btn-primary" id="reviewPendingBtn">
                        Review Pending
                    </button>
                    <button class="qfit-btn qfit-btn-secondary" id="viewAllStudentsBtn">
                        View All Students
                    </button>
                </div>
            </div>

            <!-- ✅ NEW: WORKOUT PLAN ADMIN CONTROL -->
            <div class="qfit-admin-section">
                <h3>Workout Plans (Admin Control)</h3>

                <div class="qfit-user-list-grid">
                    <c:forEach var="plan" items="${sessionScope.activePlans}">
                        <div class="qfit-user-card">

                            <div class="qfit-user-info">
                                <h4><c:out value="${plan.name}" /></h4>
                                <p>
                                    Status:
                                    <c:choose>
                                        <c:when test="${plan.active}">
                                            <span class="qfit-status-badge qfit-status-approved">ACTIVE</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="qfit-status-badge qfit-status-declined">INACTIVE</span>
                                        </c:otherwise>
                                    </c:choose>
                                </p>
                            </div>

                            <div class="qfit-user-actions">
                                <!-- 🔁 EXACT BLOCK YOU REQUESTED -->
                                <form method="post"
                                      action="${pageContext.request.contextPath}/TogglePlanStatusServlet">
                                    <input type="hidden" name="planId" value="${plan.id}" />

                                    <c:choose>
                                        <c:when test="${plan.active}">
                                            <button class="qfit-btn qfit-btn-danger">
                                                Deactivate
                                            </button>
                                        </c:when>
                                        <c:otherwise>
                                            <button class="qfit-btn qfit-btn-primary">
                                                Activate
                                            </button>
                                        </c:otherwise>
                                    </c:choose>
                                </form>
                            </div>

                        </div>
                    </c:forEach>

                    <c:if test="${empty sessionScope.activePlans}">
                        <p class="qfit-note">No workout plans available.</p>
                    </c:if>
                </div>
            </div>

            <!-- EXISTING PENDING USERS SECTION -->
            <div class="qfit-admin-section" id="pendingListSection">
                <h3>Awaiting Verification Cards</h3>

                <div class="qfit-user-list-grid">
                    <c:forEach var="user" items="${requestScope.pendingUsers}">
                        <div class="qfit-user-card qfit-card-pending">
                            <div class="qfit-user-info">
                                <h4><c:out value="${user.fullName}"/></h4>
                                <p>@<c:out value="${user.username}"/></p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>

        </div>
    </main>

    <footer class="qfit-footer">
        QFit Fitness Tracker Admin &copy; 2025
    </footer>
</div>

</body>
</html>
