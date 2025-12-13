 <%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="history" value="${requestScope.workoutHistory}" />
<c:set var="user" value="${sessionScope.currentUser}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Workout History · QFit Fitness Tracker</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="static/css/styles.css">

</head>
<body class="qfit-body">

<div class="qfit-page-wrapper">
    <div class="qfit-bg-gradient"></div>

    <header class="qfit-nav">
        <div class="qfit-logo-group">
            <h1 class="qfit-title">QFit Fitness Tracker</h1>
        </div>

        <nav class="qfit-dashboard-nav">
            <a href="DashboardServlet" class="qfit-btn qfit-btn-secondary">Dashboard</a>
            <a href="profile.jsp" class="qfit-btn qfit-btn-secondary">Profile</a>
            <a href="LogoutServlet" class="qfit-btn qfit-btn-ghost">Log Out</a>
        </nav>
    </header>

    <main class="qfit-detail-main">

        <div class="qfit-dashboard-header">
            <h1>Logged Workout History</h1>
            <a href="#" onclick="openCreateWorkoutModal()" class="qfit-btn qfit-btn-cute-action qfit-btn-sm">➕ Log New Session</a>
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
                    <option value="1">Strength Phase 1</option>
                    <option value="2">Cardio Day</option>
                </select>
            </div>
            <button class="qfit-btn qfit-btn-secondary">Apply Filters</button>
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
                            <%-- TODO: Loop through workout history items (e.g., LoggedSession objects) --%>
                            <c:forEach var="session" items="${history}">
                                <tr>
                                    <td><c:out value="${session.date}"/></td>
                                    <td><c:out value="${session.planName}"/></td>
                                    <td><c:out value="${session.durationMinutes}"/> min</td>
                                    <td><span class="qfit-status-logged">Completed</span></td>
                                    <td><a href="ViewSessionServlet?sessionId=${session.id}" class="qfit-link">View Details</a></td>
                                </tr>
                            </c:forEach>
                            <%-- Placeholder entry --%>
                             <tr>
                                <td>2025-04-10</td>
                                <td>Full Body Routine</td>
                                <td>65 min</td>
                                <td><span class="qfit-status-logged">Completed</span></td>
                                <td><a href="#" class="qfit-link">View Details</a></td>
                            </tr>
                            <tr>
                                <td>2025-04-08</td>
                                <td>Cardio Day</td>
                                <td>40 min</td>
                                <td><span class="qfit-status-missed">Missed</span></td>
                                <td><span style="opacity:0.6;">N/A</span></td>
                            </tr>
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

<%-- You would need the modal definition and JS from dashboard.jsp here if you want the "Log New Session" button to work --%>

</body>
</html>
