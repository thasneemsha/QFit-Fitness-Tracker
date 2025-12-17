<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%-- ViewSessionServlet sets request attribute name "session" --%>
<c:set var="loggedSession" value="${requestScope.session}" />
<c:set var="user" value="${sessionScope.currentUser}" />

<c:url var="cssUrl" value="/static/css/styles.css" />
<c:url var="historyUrl" value="/WorkoutHistoryServlet" />
<c:url var="dashboardUrl" value="/DashboardServlet" />
<c:url var="logoutUrl" value="/LogoutServlet" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Session Details · QFit</title>
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
            <a href="${historyUrl}" class="qfit-btn qfit-btn-secondary">View History</a>
            <a href="${dashboardUrl}" class="qfit-btn qfit-btn-secondary">Dashboard</a>
            <a href="${logoutUrl}" class="qfit-btn qfit-btn-ghost">Log Out</a>
        </nav>
    </header>

    <main class="qfit-detail-main">
        <c:choose>
            <c:when test="${not empty loggedSession}">
                <div class="qfit-log-header">
                    <h1>Session Details: <c:out value="${loggedSession.planName}"/></h1>
                    <p class="qfit-note">
                        Logged on <strong><c:out value="${loggedSession.date}"/></strong>
                        | Duration: <strong><c:out value="${loggedSession.durationMinutes}"/></strong> minutes
                    </p>
                </div>

                <div class="qfit-section qfit-glass-card">
                    <h2>Performance Summary</h2>
                    <p class="qfit-note" style="margin-top: 15px;">
                        Detailed exercise breakdown will appear here once we store per-exercise results (sets/reps/weight) in the LoggedSession model.
                    </p>
                </div>

                <div class="qfit-section qfit-glass-card" style="margin-top: 20px;">
                    <h2>API Metrics During Session</h2>
                    <p class="qfit-note">
                        API metrics (heart rate, calories, steps) will appear here later when we integrate Google Fit / Apple Health or simulated metrics.
                    </p>
                </div>
            </c:when>

            <c:otherwise>
                <div class="qfit-status-card qfit-glass-card">
                    <h2 style="color: #ff6b81;">Session Not Found</h2>
                    <p>The workout session ID could not be loaded. It may not exist.</p>
                    <a href="${historyUrl}" class="qfit-btn qfit-btn-primary">View Full History</a>
                </div>
            </c:otherwise>
        </c:choose>
    </main>

    <footer class="qfit-footer">
        <p>© 2025 QFit Fitness Tracker · Queens College | Support: qfit.support@qc.edu</p>
    </footer>
</div>

</body>
</html>
