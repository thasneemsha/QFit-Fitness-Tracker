<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- The 'session' object is set by ViewSessionServlet --%>
<c:set var="session" value="${requestScope.session}" />
<c:set var="user" value="${sessionScope.currentUser}" />


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Session Details · QFit</title>
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
            <a href="WorkoutHistoryServlet" class="qfit-btn qfit-btn-secondary">View History</a>
            <a href="DashboardServlet" class="qfit-btn qfit-btn-secondary">Dashboard</a>
            <a href="LogoutServlet" class="qfit-btn qfit-btn-ghost">Log Out</a>
        </nav>
    </header>


    <main class="qfit-detail-main">
        <c:choose>
            <c:when test="${not empty session}">
                <div class="qfit-log-header">
                    <h1>Session Details: <c:out value="${session.planName}"/></h1>
                    <p class="qfit-note">Logged on **<c:out value="${session.date}"/>** | Duration: **<c:out value="${session.durationMinutes}"/> minutes**</p>
                </div>


                <div class="qfit-section qfit-glass-card">
                    <h2>Performance Summary</h2>
                   
                    <table class="qfit-history-table" style="margin-top: 15px;">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Exercise</th>
                                <th>Sets Performed</th>
                                <th>Reps/Time Achieved</th>
                                <th>Weight (lbs) Achieved</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="detail" items="${session.performanceDetails}" varStatus="loop">
                                <tr>
                                    <td><c:out value="${loop.index + 1}"/></td>
                                    <td><c:out value="${detail.exerciseName}"/></td>
                                    <td><c:out value="${detail.setsAchieved}"/></td>
                                    <td><c:out value="${detail.repsTimeAchieved}"/></td>
                                    <td><c:out value="${detail.weightAchieved}"/></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                   
                    <c:if test="${empty session.performanceDetails}">
                        <p class="qfit-note">No exercise details were recorded for this session.</p>
                    </c:if>
                   
                </div>
               
                <%-- Section for API-tracked metrics (e.g., steps, calories) --%>
                <div class="qfit-section qfit-glass-card" style="margin-top: 20px;">
                    <h2>API Metrics During Session</h2>
                    <div class="qfit-exercise-details-row">
                         <div><strong>Avg Heart Rate</strong><p><c:out value="${session.avgHeartRate}" default="N/A"/> bpm</p></div>
                         <div><strong>Calories Burned</strong><p><c:out value="${session.caloriesBurned}" default="N/A"/> kcal</p></div>
                         <div><strong>Steps During Session</strong><p><c:out value="${session.stepsDuringSession}" default="N/A"/></p></div>
                    </div>
                </div>


            </c:when>
            <c:otherwise>
                <div class="qfit-status-card qfit-glass-card">
                    <h2 style="color: #ff6b81;">Session Not Found</h2>
                    <p>The workout session ID could not be loaded. It may not exist.</p>
                    <a href="WorkoutHistoryServlet" class="qfit-btn qfit-btn-primary">View Full History</a>
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

