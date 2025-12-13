 <%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="en">


<head>
    <meta charset="UTF-8">
    <title>QFit Universal Workout Tracker - Queens College</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="static/css/styles.css">
</head>


<body class="qfit-body">


<div class="qfit-page-wrapper">
    <div class="qfit-bg-gradient"></div>


    <nav class="qfit-nav">
        <div class="qfit-logo-group">
            <h1 class="qfit-title">QFit Fitness Tracker</h1>
        </div>
        <div class="qfit-nav-actions">
            <a href="register.jsp" class="qfit-btn qfit-btn-secondary qfit-btn-sm">
                Register
            </a>
            <button type="button" class="qfit-btn qfit-btn-primary qfit-btn-sm qfit-mobile-login-btn">
                Log In
            </button>
        </div>
    </nav>


    <main class="qfit-landing-main">


        <section class="qfit-intro-section">
            <div class="qfit-intro-text">
                <p class="qfit-tagline">Built for Queens College Students</p>
                <h2 class="qfit-main-heading">
                    Transform your body
                    on your schedule.
                </h2>
                <p class="qfit-intro-subtext">
                    QFit is the free, ad-free fitness tracker designed exclusively for the Queens College community.
                    Seamlessly sync your workouts on both Android and iPhone.
                </p>
                <section class="qfit-features-section">
                    <h3 class="qfit-section-heading">Key Features That Set QFit Apart</h3>
                    <div class="qfit-feature-card-wrapper">
                        <div class="qfit-feature-card">
                            <span class="qfit-feature-icon">⚙️</span>
                            <h4>Custom Workout Builder</h4>
                            <p>Create personalized fitness plans with your own exercises, sets, reps, and target weights that fit your busy student schedule.</p>
                        </div>
                        <div class="qfit-feature-card">
                            <span class="qfit-feature-icon">📈</span>
                            <h4>Integrated Progress Tracking</h4>
                            <p>Visualize your progress with dynamic charts, track personal bests, and see your fitness journey evolve over time.</p>
                        </div>
                        <div class="qfit-feature-card">
                            <span class="qfit-feature-icon">📱</span>
                            <h4>Seamless Mobile Sync (API)</h4>
                            <p>Connect instantly with Google Fit (Android) and Apple Health (iPhone) APIs to log workouts automatically—no manual entry needed.</p>
                        </div>
                        <div class="qfit-feature-card">
                            <span class="qfit-feature-icon">🛡️</span>
                            <h4>Secure & Ad-Free</h4>
                            <p>A safe platform exclusively for Queens College students. No distracting ads, no hidden fees, just pure fitness tracking.</p>
                        </div>
                        <div class="qfit-feature-card">
                            <span class="qfit-feature-icon">📅</span>
                            <h4>Scheduling & Logging</h4>
                            <p>Plan your week using the built-in calendar and easily log completed sessions with the quick-log feature.</p>
                        </div>
                    </div>
                </section>


            </div>
            <div class="qfit-landing-login-box qfit-glass-card">
                <div class="qfit-form-header">
                    <h2>Log Into QFit</h2>
                    <p>Use your registered email or phone number.</p>
                </div>


                <form class="qfit-login-form" method="post" action="login">
                    <div class="qfit-form-group">
                        <label for="emailOrPhone">Email or phone number</label>
                        <input type="text" id="emailOrPhone" name="emailOrPhone" required>
                    </div>


                    <div class="qfit-form-group">
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" required>
                    </div>


                    <c:if test="${not empty requestScope.loginError}">
                        <div class="qfit-error-message">
                            <c:out value="${requestScope.loginError}"/>
                        </div>
                    </c:if>
                    <button type="submit" class="qfit-btn qfit-btn-primary">Log In</button>


                    <div class="qfit-links">
                        <a href="forgotPassword.jsp" class="qfit-link">Forgot account?</a>
                    </div>


                    <div class="qfit-divider">
                        <span>or</span>
                    </div>


                    <button type="button" class="qfit-btn qfit-btn-secondary"
                                onclick="window.location.href='register.jsp'">
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


<script>
    document.querySelector('.qfit-mobile-login-btn').addEventListener('click', function() {
        const loginBox = document.querySelector('.qfit-landing-login-box');
        // Simple toggle/scroll for mobile view: if hidden, show/scroll; otherwise, scroll to it.
        if (loginBox.style.display === 'none') {
             loginBox.style.display = 'flex';
        }
        loginBox.scrollIntoView({ behavior: 'smooth' });
    });
</script>


</body>
</html>

