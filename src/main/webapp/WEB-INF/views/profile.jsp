<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="user" value="${sessionScope.currentUser}" />

<c:url var="cssUrl" value="/static/css/styles.css" />
<c:url var="dashboardUrl" value="/DashboardServlet" />
<c:url var="profileUrl" value="/ProfileServlet" />
<c:url var="logoutUrl" value="/LogoutServlet" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Profile · QFit Fitness Tracker</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="${cssUrl}">
</head>

<body class="qfit-body qfit-dashboard-body">

<div class="qfit-page-wrapper">
    <div class="qfit-bg-gradient"></div>

    <!-- HEADER -->
    <header class="qfit-nav">
        <div class="qfit-logo-group">
            <h1 class="qfit-title">QFit Fitness Tracker</h1>
        </div>

        <nav class="qfit-dashboard-nav">
            <a href="${dashboardUrl}" class="qfit-btn qfit-btn-ghost">Dashboard</a>
            <a href="${profileUrl}" class="qfit-btn qfit-btn-secondary">Profile</a>
            <a href="${logoutUrl}" class="qfit-btn qfit-btn-ghost">Log Out</a>
        </nav>
    </header>

    <!-- MAIN -->
    <main class="qfit-dashboard-main">
        <h1 class="qfit-dashboard-heading">My Profile</h1>

        <!-- Messages -->
        <c:if test="${not empty requestScope.message}">
            <div class="qfit-success-message">
                <c:out value="${requestScope.message}" />
            </div>
        </c:if>

        <c:if test="${not empty requestScope.error}">
            <div class="qfit-error-message">
                <c:out value="${requestScope.error}" />
            </div>
        </c:if>

        <div class="qfit-profile-grid">

            <!-- PERSONAL INFO -->
            <form method="post" action="${pageContext.request.contextPath}/ProfileUpdateServlet"
                  class="qfit-glass-card qfit-profile-card">

                <input type="hidden" name="action" value="personal">

                <h3>Personal Information</h3>

                <div class="qfit-data-group">
                    <label>Full Name</label>
                    <input type="text" name="fullName"
                           value="<c:out value='${user.fullName}'/>" required>
                </div>

                <div class="qfit-data-group">
                    <label>Email</label>
                    <p><c:out value="${user.email}" /></p>
                </div>

                <div class="qfit-data-group">
                    <label>Phone</label>
                    <input type="text" name="phone"
                           value="<c:out value='${user.phone}'/>">
                </div>

                <button type="submit" class="qfit-btn qfit-btn-primary">
                    Save Personal Info
                </button>
            </form>

            <!-- FITNESS INFO -->
            <form method="post" action="${pageContext.request.contextPath}/ProfileUpdateServlet"
                  class="qfit-glass-card qfit-profile-card">

                <input type="hidden" name="action" value="fitness">

                <h3>Fitness Profile</h3>

                <div class="qfit-data-group">
                    <label>Height (cm)</label>
                    <input type="number" name="height"
                           value="<c:out value='${user.height}'/>" required>
                </div>

                <div class="qfit-data-group">
                    <label>Weight (kg)</label>
                    <input type="number" name="weight"
                           value="<c:out value='${user.weight}'/>" required>
                </div>

                <div class="qfit-data-group">
                    <label>Primary Goal</label>
                    <select name="primaryGoal" required>
                        <option value="Strength" ${user.primaryGoal == 'Strength' ? 'selected' : ''}>Strength</option>
                        <option value="Weight Loss" ${user.primaryGoal == 'Weight Loss' ? 'selected' : ''}>Weight Loss</option>
                        <option value="Muscle Gain" ${user.primaryGoal == 'Muscle Gain' ? 'selected' : ''}>Muscle Gain</option>
                        <option value="Endurance" ${user.primaryGoal == 'Endurance' ? 'selected' : ''}>Endurance</option>
                    </select>
                </div>

                <div class="qfit-data-group">
                    <label>Experience Level</label>
                    <select name="experienceLevel" required>
                        <option value="Beginner" ${user.experienceLevel == 'Beginner' ? 'selected' : ''}>Beginner</option>
                        <option value="Intermediate" ${user.experienceLevel == 'Intermediate' ? 'selected' : ''}>Intermediate</option>
                        <option value="Advanced" ${user.experienceLevel == 'Advanced' ? 'selected' : ''}>Advanced</option>
                    </select>
                </div>

                <button type="submit" class="qfit-btn qfit-btn-primary">
                    Save Fitness Info
                </button>
            </form>

        </div>
    </main>

    <!-- FOOTER -->
    <footer class="qfit-footer">
        <p>© 2025 QFit Fitness Tracker · Queens College</p>
    </footer>
</div>

</body>
</html>
