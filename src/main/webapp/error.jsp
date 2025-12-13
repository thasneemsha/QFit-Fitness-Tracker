<%@ page contentType="text/html; charset=UTF-8" language="java" isErrorPage="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--
    Note: isErrorPage="true" allows this JSP to automatically access exception details
    via the implicit 'exception' object, although we prioritize the custom
    'errorMessage' set by the Servlet for clearer messaging.
--%>
<c:set var="user" value="${sessionScope.currentUser}" />


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Error · QFit Fitness Tracker</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <link rel="stylesheet" href="static/css/styles.css">
</head>
<body class="qfit-body qfit-error-body">


<div class="qfit-page-wrapper">
    <div class="qfit-bg-gradient"></div>


    <header class="qfit-nav">
        <div class="qfit-logo-group">
            <h1 class="qfit-title">QFit Fitness Tracker</h1>
        </div>
       
        <nav class="qfit-dashboard-nav">
             <%-- Provide a link back to Dashboard if the user is logged in --%>
            <c:if test="${not empty user}">
                <a href="DashboardServlet" class="qfit-btn qfit-btn-secondary">Go to Dashboard</a>
            </c:if>
             <a href="index.jsp" class="qfit-btn qfit-btn-ghost">Go to Login Page</a>
        </nav>
    </header>


    <main class="qfit-detail-main" style="text-align: center; max-width: 700px; margin: 80px auto;">


        <div class="qfit-status-card qfit-glass-card">
           
            <h1 style="color: #ff6b81; font-size: 3em; margin-bottom: 5px;"> System Error Occurred</h1>
            <h2>We ran into a problem.</h2>
           
            <p style="font-size: 1.1em; margin-top: 20px;">
                The application encountered an unexpected issue while processing your request. This is usually a problem on our end (like a database connection failure)
            </p>
           
            <hr style="margin: 30px 0;">
           
            <h3>Details:</h3>
            <div style="background: #2a2a47; padding: 15px; border-radius: 8px; text-align: left; overflow-x: auto;">
                <%-- Display the custom error message set by the Servlet --%>
                <c:choose>
                    <c:when test="${not empty requestScope.errorMessage}">
                        <code style="color: #f7f7f7;">
                            <c:out value="${requestScope.errorMessage}"/>
                        </code>
                    </c:when>
                    <%-- Fallback to the generic exception message if the Servlet didn't set one --%>
                    <c:when test="${not empty exception}">
                        <code style="color: #f7f7f7;">
                            **Uncaught Exception:** <c:out value="${exception.message}"/>
                        </code>
                    </c:when>
                    <c:otherwise>
                         <code style="color: #f7f7f7;">
                            The nature of the error could not be determined. Please try navigating back or logging in again.
                        </code>
                    </c:otherwise>
                </c:choose>
            </div>
           
            <p style="margin-top: 30px;">
                If the problem persists, please reach out to our support team.
            </p>


            <a href="DashboardServlet" class="qfit-btn qfit-btn-primary" style="margin-top: 20px;">Try Dashboard Again</a>
        </div>


    </main>


    <footer class="qfit-footer">
        <p>© 2025 QFit Fitness Tracker · Queens College | Support: **qfit.support@qc.edu**</p>
    </footer>
</div>


</body>
</html>

