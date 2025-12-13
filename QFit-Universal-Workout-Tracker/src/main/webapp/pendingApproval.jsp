<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Pending Approval · QFit</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="static/css/styles.css">
</head>
<body class="qfit-body">

<div class="qfit-page-wrapper">
    <div class="qfit-bg-gradient"></div>

    <!-- Header -->
    <header class="qfit-header">
        <div class="qfit-logo-group">
            <img src="static/images/logo.png" alt="QFit Logo" class="qfit-logo">
            <div class="qfit-title-block">
                <h1 class="qfit-title">QFit Universal Workout Tracker</h1>
                <p class="qfit-subtitle">Account Pending Approval</p>
            </div>
        </div>
    </header>

    <main class="qfit-main">
        <section class="qfit-glass-card qfit-status-card">
            <div class="qfit-status-icon">
                <div class="qfit-status-circle">
                    <div class="qfit-status-check">✓</div>
                </div>
            </div>

            <div class="qfit-status-text">
                <h2>Your application has been submitted</h2>
                <p>
                    Thank you for registering with QFit. Your account is currently
                    <strong>pending review by an administrator.</strong>
                </p>
                <p>
                    Once your Queens College ID has been verified, you will receive access
                    to log in as a student or coach, based on the account type you selected.
                </p>
                <ul>
                    <li>Admins verify ID front &amp; back for all new users.</li>
                    <li>Approval time may take up to 24–48 hours.</li>
                    <li>You will not be able to log in until your account is approved.</li>
                </ul>
            </div>

            <div class="qfit-status-actions">
                <button type="button"
                        class="qfit-btn qfit-btn-primary"
                        onclick="window.location.href='index.jsp'">
                    Back to Log In
                </button>

                <p class="qfit-note qfit-note-small">
                    If you believe there is an issue with your application, please contact
                    your QFit administrator or program coordinator.
                </p>
            </div>
        </section>
    </main>

    <footer class="qfit-footer">
        <p>© 2025 QFit Universal Workout Tracker · Queens College</p>
    </footer>
</div>

</body>
</html>
