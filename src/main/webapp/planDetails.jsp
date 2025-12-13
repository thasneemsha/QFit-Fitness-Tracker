<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- <<< ADD THIS LINE --%>
<%-- Set the Plan object loaded by PlanDetailsServlet into a variable --%>
<c:set var="plan" value="${requestScope.plan}" />
<c:set var="user" value="${sessionScope.currentUser}" />


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><c:out value="${plan.name}" default="Plan Details"/> · QFit</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <link rel="stylesheet" href="static/css/styles.css">


    <%-- Set the plan color dynamically for the border highlight --%>
    <style>
        :root {
            --plan-color: <c:out value="${plan.color}" default="#4b5eff"/>;
        }
        /* Override specific class for dynamic color */
        .qfit-plan-metadata {
            border-left: 5px solid var(--plan-color);
        }
    </style>
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


        <c:choose>
            <c:when test="${not empty plan}">
                <div class="qfit-plan-header">
                    <h1>Plan: <c:out value="${plan.name}"/></h1>
                    <a href="LogWorkoutServlet?planId=${plan.id}" class="qfit-btn qfit-btn-primary">Log this Workout Today</a>
                </div>


                <div class="qfit-plan-info-grid">
                   
                    <%-- Left Column: Plan Metadata --%>
                    <div class="qfit-plan-metadata qfit-glass-card">
                        <h3>Plan Overview</h3>
                        <div class="qfit-metadata-item">
                            <h4>Status</h4>
                            <p>
                                <c:choose>
                                    <c:when test="${plan.active}">
                                        <span class="qfit-status-badge qfit-status-approved">Active</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="qfit-status-badge qfit-status-pending">Archived</span>
                                    </c:otherwise>
                                </c:choose>
                            </p>
                        </div>
                        <div class="qfit-metadata-item">
                            <h4>Scheduled Days</h4>
                            <p><c:out value="${plan.daysOfWeek}"/></p>
                        </div>
                        <div class="qfit-metadata-item">
                            <h4>Estimated Duration</h4>
                            <p>~<c:out value="${plan.durationMinutes}"/> Minutes</p>
                        </div>
                        <div class="qfit-metadata-item">
                            <h4>Last Logged</h4>
                            <p><c:out value="${plan.lastLoggedDate}" default="Never"/></p>
                        </div>
                       
                        <a href="EditPlanServlet?planId=${plan.id}" class="qfit-btn qfit-btn-secondary qfit-edit-btn">Edit Plan</a>
                    </div>
                   
                    <%-- Right Column: Exercise List (Reusing qfit-section/glass-card style) --%>
                    <div class="qfit-section qfit-exercise-list-section">
                        <h2>Plan Exercises (<c:out value="${fn:length(plan.exercises)}" default="0"/> Total)</h2>


                        <c:forEach var="exercise" items="${plan.exercises}" varStatus="loop">
                            <div class="qfit-exercise-card">
                                <h3><c:out value="${loop.index + 1}"/>. <c:out value="${exercise.name}"/></h3>
                                <div class="qfit-exercise-details-row">
                                    <div><strong>Sets</strong><p><c:out value="${exercise.sets}"/></p></div>
                                    <div><strong>Reps/Duration</strong><p><c:out value="${exercise.repsOrDuration}"/></p></div>
                                    <div><strong>Target Weight (Lbs)</strong><p><c:out value="${exercise.weightLbs}"/></p></div>
                                    <div><strong>Notes</strong><p><c:out value="${exercise.notes}" default="N/A"/></p></div>
                                </div>
                            </div>
                        </c:forEach>
                       
                        <c:if test="${empty plan.exercises}">
                            <p class="qfit-note">This plan has no exercises defined. Please edit the plan to add some!</p>
                        </c:if>
                    </div>


                </div>
            </c:when>
            <c:otherwise>
                <div class="qfit-status-card qfit-glass-card" style="margin-top: 50px;">
                    <h2 style="color: #ff6b81;">Plan Not Found</h2>
                    <p>The workout plan ID specified could not be loaded. It may not exist or may not belong to your account.</p>
                    <a href="DashboardServlet" class="qfit-btn qfit-btn-primary">Go to Dashboard</a>
                </div>
            </c:otherwise>
        </c:choose>


    </main>


    <footer class="qfit-footer">
        <p>© 2025 QFit Fitness Tracker · Queens College</p>
    </footer>
</div>


</body>
</html>

