<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>QFit Universal Workout Tracker</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Main stylesheet -->
    <link rel="stylesheet" href="static/css/styles.css">
</head>

<body class="qfit-body">

<div class="qfit-page-wrapper">
    <!-- Background overlay (optional extra effect) -->
    <div class="qfit-bg-gradient"></div>

    <!-- Main content container -->
    <header class="qfit-header">
        <div class="qfit-logo-group">
            <!-- Replace src with your actual logo path -->
            <img src="static/images/logo.png" alt="QFit Logo" class="qfit-logo">
            <div class="qfit-title-block">
                <h1 class="qfit-title">QFit Universal Workout Tracker</h1>
                <p class="qfit-subtitle">Queens College student fitness tracking system</p>
            </div>
        </div>
    </header>

    <main class="qfit-main">
        <section class="qfit-glass-card">
            <!-- Left side: image + description -->
            <div class="qfit-left-panel">
                <!-- Replace with your image -->
                <div class="qfit-hero-image-wrapper">
                    <img src="static/images/hero-image.png" alt="Workout Illustration" class="qfit-hero-image">
                </div>

                <div class="qfit-description">
                    <h2>Track. Improve. Achieve.</h2>
                    <p>
                        QFit helps Queens College students log workouts, set goals,
                        and monitor progress — all in one secure platform.
                    </p>
                    <ul>
                        <li>✔ Log detailed workouts with sets, reps, and weights</li>
                        <li>✔ Set and track fitness goals over time</li>
                    </ul>
                </div>
            </div>

            <!-- Right side: login form -->
            <div class="qfit-right-panel">
                <div class="qfit-form-header">
                    <h2>Log Into QFit</h2>
                    <p>Use your registered email or phone number.</p>
                </div>

                <!-- Adjust action to match your AuthController mapping -->
                <form class="qfit-login-form" method="post" action="login">
                    <div class="qfit-form-group">
                        <label for="emailOrPhone">Email or phone number</label>
                        <input type="text" id="emailOrPhone" name="emailOrPhone" required>
                    </div>

                    <div class="qfit-form-group">
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" required>
                    </div>

                    <!-- Placeholder for error message (optional) -->
                    <%
                        String error = (String) request.getAttribute("loginError");
                        if (error != null) {
                    %>
                    <div class="qfit-error-message">
                        <%= error %>
                    </div>
                    <% } %>

                    <button type="submit" class="qfit-btn qfit-btn-primary">Log In</button>

                    <div class="qfit-links">
                        <a href="forgotPassword.jsp" class="qfit-link">Forgot account?</a>
                    </div>

                    <div class="qfit-divider">
                        <span>or</span>
                    </div>

                    <!-- CHANGED: go directly to student registration -->
                    <button type="button" class="qfit-btn qfit-btn-secondary"
                            onclick="window.location.href='registerUser.jsp'">
                        Create New Account
                    </button>

                    <p class="qfit-note">
                        New student accounts require Queens College ID (front &amp; back)
                        and admin approval.
                    </p>
                </form>
            </div>
        </section>
    </main>

    <footer class="qfit-footer">
        <p>© 2025 QFit Universal Workout Tracker · Queens College</p>
    </footer>
</div>

</body>

</html>
