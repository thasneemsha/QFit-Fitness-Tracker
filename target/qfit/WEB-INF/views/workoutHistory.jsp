<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="history" value="${requestScope.history}" />
<c:set var="user" value="${sessionScope.currentUser}" />

<c:url var="dashboardUrl" value="/DashboardServlet" />
<c:url var="profileUrl" value="/ProfileServlet" />
<c:url var="logoutUrl" value="/LogoutServlet" />
<c:url var="logWorkoutUrl" value="/LogWorkoutServlet" />
<c:url var="cssUrl" value="/static/css/styles.css" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Workout History · QFit Fitness Tracker</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${cssUrl}">
</head>
<body class="qfit-body">

<div class="qfit-page-wrapper">
    <div class="qfit-bg-gradient"></div>

    <header class="qfit-nav">
        <div class="qfit-logo-group">
            <h1 class="qfit-title">QFit Fitness Tracker</h1>
        </div>

        <nav class="qfit-dashboard-nav">
            <a href="${dashboardUrl}" class="qfit-btn qfit-btn-secondary">Dashboard</a>
            <a href="${profileUrl}" class="qfit-btn qfit-btn-secondary">Profile</a>
            <a href="${logoutUrl}" class="qfit-btn qfit-btn-ghost">Log Out</a>
        </nav>
    </header>

    <main class="qfit-detail-main">

        <div class="qfit-dashboard-header">
            <h1>Logged Workout History</h1>
            <a href="${logWorkoutUrl}" class="qfit-btn qfit-btn-cute-action qfit-btn-sm">➕ Log New Session</a>
        </div>

        <div class="qfit-history-filters">
            <div class="qfit-form-group">
                <label for="filterDate">Filter by Date Range</label>
                <input type="month" id="filterDate" name="filterDate">
            </div>
            <div class="qfit-form-group">
                <label for="filterPlan">Filter by Plan</label>
                <select id="filterPlan" name="filterPlan">
                    <option value="">All Plans</option>
                    <%-- TODO: Populate dynamically from requestScope.allPlans --%>
                </select>
            </div>
            <button class="qfit-btn qfit-btn-secondary" type="button">Apply Filters</button>
        </div>

        <section class="qfit-section">
            <h2>Past Sessions</h2>

            <c:choose>
                <c:when test="${not empty history}">
                    <table class="qfit-history-table">
                        <thead>
                        <tr>
                            <th>Date</th>
                            <th>Plan Name</th>
                            <th>Duration</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="s" items="${history}">
                            <c:url var="viewUrl" value="/ViewSessionServlet">
                                <c:param name="sessionId" value="${s.id}" />
                            </c:url>

                            <tr>
                                <td><c:out value="${s.date}"/></td>
                                <td><c:out value="${s.planName}"/></td>
                                <td><c:out value="${s.durationMinutes}"/> min</td>
                                <td><span class="qfit-status-logged">Completed</span></td>
                                <td>
                                    <a class="qfit-link" href="${viewUrl}">View Details</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:when>

                <c:otherwise>
                    <p class="qfit-note">No logged workout history found. Log your first session to see it here!</p>
                </c:otherwise>
            </c:choose>

        </section>

    </main>

    <footer class="qfit-footer">
        <p>© 2025 QFit Fitness Tracker · Queens College</p>
    </footer>
</div>

</body>
</html>
