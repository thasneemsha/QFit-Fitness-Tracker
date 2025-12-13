<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- The 'plan' object is set by LogWorkoutServlet --%>
<c:set var="plan" value="${requestScope.plan}" />
<c:set var="user" value="${sessionScope.currentUser}" />


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Log Workout: <c:out value="${plan.name}" default="Session"/> · QFit</title>
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
            <a href="LogoutServlet" class="qfit-btn qfit-btn-ghost">Log Out</a>
        </nav>
    </header>


    <main class="qfit-detail-main">
        <c:choose>
            <c:when test="${not empty plan}">
                <div class="qfit-log-header">
                    <h1>Log Session: <c:out value="${plan.name}"/></h1>
                    <p class="qfit-note">Adjust the values below to record your actual performance.</p>
                </div>
               
                <form method="post" action="ProcessLogWorkoutServlet" class="qfit-log-form qfit-glass-card">
                   
                    <input type="hidden" name="planId" value="<c:out value="${plan.id}"/>">
                   
                    <div class="qfit-form-group">
                        <label for="logDate">Date of Workout</label>
                        <input type="date" id="logDate" name="logDate" value="${requestScope.defaultDate}" required>
                    </div>
                   
                    <hr style="margin: 20px 0;">
                   
                    <c:forEach var="exercise" items="${plan.exercises}" varStatus="loop">
                        <div class="qfit-exercise-log-card">
                            <h3><c:out value="${loop.index + 1}"/>. <c:out value="${exercise.name}"/></h3>
                           
                            <div class="qfit-log-row">
                               
                                <div class="qfit-form-group qfit-small-input">
                                    <label>Sets</label>
                                    <input type="number" name="sets_${exercise.id}"
                                           value="<c:out value="${exercise.sets}"/>" min="1" required>
                                </div>
                               
                                <div class="qfit-form-group qfit-small-input">
                                    <label>Reps/Duration</label>
                                    <input type="text" name="repsDuration_${exercise.id}"
                                           value="<c:out value="${exercise.repsOrDuration}"/>" required>
                                </div>
                               
                                <div class="qfit-form-group qfit-small-input">
                                    <label>Weight (lbs)</label>
                                    <input type="number" name="weightLbs_${exercise.id}"
                                           value="<c:out value="${exercise.weightLbs}"/>" min="0" required>
                                </div>
                               
                            </div>
                            <input type="hidden" name="exerciseId" value="<c:out value="${exercise.id}"/>">
                        </div>
                    </c:forEach>
                   
                    <c:if test="${empty plan.exercises}">
                        <p class="qfit-note">This plan has no exercises defined. Please edit the plan first.</p>
                    </c:if>


                    <button type="submit" class="qfit-btn qfit-btn-primary qfit-full-width" style="margin-top: 25px;">
                        ✔ Finish & Log Workout
                    </button>
                </form>


            </c:when>
            <c:otherwise>
                <div class="qfit-status-card qfit-glass-card">
                    <h2 style="color: #ff6b81;">Plan Not Found</h2>
                    <p>Cannot load plan details for logging. Please select a valid plan from the dashboard.</p>
                    <a href="DashboardServlet" class="qfit-btn qfit-btn-primary">Go to Dashboard</a>
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

