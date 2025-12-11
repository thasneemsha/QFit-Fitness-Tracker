<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Pending Approval · QFit Fitness Tracker</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="static/css/styles.css">
</head>
<body class="qfit-body">


<div class="qfit-page-wrapper">
    <div class="qfit-bg-gradient"></div>


    <header class="qfit-header">
        <div class="qfit-logo-group">
            <div class="qfit-title-block">
                <h1 class="qfit-title">QFit Fitness Tracker</h1>
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
                    Thank you for registering with QFit Fitness Tracker.<br>
                    Your account is currently
                    <strong>pending review by an administrator.</strong>
                    <br>
                    ....
                </p>
                <ul>
                    <li>Admins will verify Your Queens College ID front &amp; back <br> to ensure you are an eligible student.</li>
                    <li>Approval time may take up to 24 hours.</li>
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
                    If you believe there is an issue with your application, please contact us via email.
                </p>
            </div>
        </section>
    </main>


    <footer class="qfit-footer">
        <p>© 2025 QFit Fitness Tracker · Queens College</p>
    </footer>
</div>


</body>
</html>

