<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student User Registration · QFit Fitness Tracker</title>
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
                <p class="qfit-subtitle">Student User Registration</p>
            </div>
        </div>
    </header>




    <main class="qfit-main">
        <section class="qfit-glass-card qfit-form-card qfit-centered-form-wrapper">




            <div class="qfit-register-header">
                <h2>Create Your Student Account</h2>
                <p>
                    Please use your **official @qmail.cuny.edu email** and upload your Queens College ID
                    (<strong>front &amp; back</strong>) for verification.
                </p>
            </div>




            <c:if test="${not empty requestScope.error}">
                <div class="qfit-error-message"><c:out value="${requestScope.error}"/></div>
            </c:if>
            <form class="qfit-registration-form-grid"
                  method="post"
                  action="RegistrationServlet"
                  enctype="multipart/form-data">
               
                <div class="qfit-column qfit-form-section">
                    <h3>Personal Information</h3>




                    <div class="qfit-form-group">
                        <label for="fullName">Full name</label>
                        <input type="text" id="fullName" name="fullName" required
                               value="<c:out value="${requestScope.fullName}"/>">
                    </div>




                    <div class="qfit-form-group">
                        <label for="email">Queens College email (@qmail.cuny.edu)</label>
                        <input type="email" id="email" name="email" required
                               placeholder="john.doe@qmail.cuny.edu"
                               pattern=".*@qmail\.cuny\.edu$"
                               title="Please use your official @qmail.cuny.edu email address."
                               value="<c:out value="${requestScope.email}"/>">
                        </div>




                    <div class="qfit-form-group">
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" required>
                    </div>




                    <div class="qfit-form-group">
                        <label for="confirmPassword">Confirm password</label>
                        <input type="password" id="confirmPassword" name="confirmPassword" required>
                    </div>
                </div>




                <div class="qfit-column qfit-form-section">
                    <h3>Fitness Profile</h3>




                    <div class="qfit-form-group qfit-two-input-row">
                        <div class="qfit-input-small">
                            <label for="height">Height (cm)</label>
                            <input type="number" id="height" name="height" min="100" max="250" required
                                   value="<c:out value="${requestScope.height}"/>">
                        </div>
                        <div class="qfit-input-small">
                            <label for="weight">Weight (kg)</label>
                            <input type="number" id="weight" name="weight" min="30" max="300" required
                                   value="<c:out value="${requestScope.weight}"/>">
                        </div>
                    </div>




                    <div class="qfit-form-group">
                        <label>Primary Fitness Goal</label>
                        <div class="qfit-button-group" id="goalGroup">
                            <button type="button" class="qfit-btn qfit-btn-goal" data-goal="strength">Increased Strength</button>
                            <button type="button" class="qfit-btn qfit-btn-goal" data-goal="weightloss">Weight Loss</button>
                            <button type="button" class="qfit-btn qfit-btn-goal" data-goal="muscle">Muscle Gain</button>
                            <button type="button" class="qfit-btn qfit-btn-goal" data-goal="endurance">Improve Consistency</button>
                        </div>
                        <input type="hidden" name="primaryGoal" id="primaryGoal" required>
                    </div>




                    <div class="qfit-form-group">
                        <label>Experience Level</label>
                        <div class="qfit-button-group" id="expGroup">
                            <button type="button" class="qfit-btn qfit-btn-experience" data-level="beginner">Beginner (less than 3months)</button>
                            <button type="button" class="qfit-btn qfit-btn-experience" data-level="intermediate">Intermediate (almost a year)</button>
                            <button type="button" class="qfit-btn qfit-btn-experience" data-level="advanced">Advanced (more than 2 years)</button>
                        </div>
                        <input type="hidden" name="experienceLevel" id="experienceLevel" required>
                    </div>
                </div>
               
                <div class="qfit-column qfit-upload-column">
                    <h3>Verification</h3>




                    <div class="qfit-form-group">
                        <label>Queens College ID (Front) <span class="qfit-required">*</span></label>
                        <div class="qfit-upload-box">
                            <input type="file"
                                   id="idFront"
                                   name="idFront"
                                   accept="image/*"
                                   required>
                        </div>
                    </div>




                    <div class="qfit-form-group">
                        <label>Queens College ID (Back) <span class="qfit-required">*</span></label>
                        <div class="qfit-upload-box">
                            <input type="file"
                                   id="idBack"
                                   name="idBack"
                                   accept="image/*"
                                   required>
                        </div>
                    </div>




                    <p class="qfit-note qfit-note-small">
                        Your ID images are used only for verification by QFit admins and stored securely.
                    </p>
                </div>




                <div class="qfit-form-actions">




                    <button type="submit" class="qfit-btn qfit-btn-primary">
                        Submit for Approval
                    </button>




                    <p class="qfit-note qfit-note-small">
                        You cannot log in until an admin approves your account.
                    </p>




                    <p class="qfit-register-footer-link">
                        Already registered?
                        <a href="index.jsp" class="qfit-link">Back to Log In</a>
                    </p>




                </div>




            </form>
        </section>
    </main>




    <footer class="qfit-footer">
        <p>© 2025 QFit Fitness Tracker · Queens College</p>
    </footer>




</div>




<script>
    // JavaScript to handle the goal and experience button selection
    function setupButtonGroup(groupSelector, inputId) {
        const group = document.getElementById(groupSelector);
        const hiddenInput = document.getElementById(inputId);




        // Check for existing value from the backend (if form failed) and activate the corresponding button
        const initialValue = hiddenInput.value;
        if (initialValue) {
             group.querySelector(`button[data-goal="${initialValue}"], button[data-level="${initialValue}"]`)?.classList.add('active');
        }




        group.addEventListener('click', (e) => {
            if (e.target.tagName === 'BUTTON') {
                // Remove 'active' class from all buttons in this group
                group.querySelectorAll('button').forEach(btn => {
                    btn.classList.remove('active');
                });




                // Add 'active' class to the clicked button
                e.target.classList.add('active');




                // Set the value of the hidden input
                const dataKey = inputId.replace('primary', '').toLowerCase();
                hiddenInput.value = e.target.dataset[dataKey] || e.target.dataset.level; // Use 'level' for experience
            }
        });
    }




    // The buttons must be initialized AFTER the page content loads and the hidden fields are potentially populated
    document.addEventListener('DOMContentLoaded', () => {
         setupButtonGroup('goalGroup', 'primaryGoal');
         setupButtonGroup('expGroup', 'experienceLevel');
    });
</script>




</body>
</html>

