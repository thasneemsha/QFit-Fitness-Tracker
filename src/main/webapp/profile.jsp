<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- Set the user object from the session for easy EL access --%>
<c:set var="user" value="${sessionScope.currentUser}" />


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Profile · QFit Fitness Tracker</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="static/css/styles.css">
    <link rel="stylesheet" href="static/css/dashboard.css">
   
    <style>
        /* CSS for the toggle functionality */
        .qfit-editable-field {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .qfit-editable-field p.read-only {
            display: block; /* Default: show read-only text */
            margin: 0;
            font-weight: 600;
        }
        .qfit-editable-field input, .qfit-editable-field select {
            display: none; /* Default: hide input fields */
            width: 70%; /* Adjust width for input fields */
            padding: 8px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }
        /* When 'editing' class is applied to the parent data-group */
        .qfit-data-group.editing .read-only,
        .qfit-data-split.editing .read-only {
            display: none;
        }
        .qfit-data-group.editing input,
        .qfit-data-group.editing select,
        .qfit-data-split.editing input,
        .qfit-data-split.editing select {
            display: block; /* Show input fields when editing */
        }
        /* Hide the submit button until editing is active */
        .qfit-submit-btn {
            display: none;
        }
        /* Show the submit button when the form is in editing mode */
        .qfit-profile-card.editing .qfit-submit-btn {
            display: inline-block;
        }
        /* Hide the edit button when editing */
        .qfit-profile-card.editing .qfit-edit-btn {
            display: none;
        }
    </style>
</head>
<body class="qfit-body qfit-dashboard-body">




<div class="qfit-page-wrapper">
    <div class="qfit-bg-gradient"></div>




    <header class="qfit-nav">
        <div class="qfit-logo-group">
            <h1 class="qfit-title">QFit Fitness Tracker</h1>
        </div>


        <nav class="qfit-dashboard-nav">
            <a href="dashboard.jsp" class="qfit-btn qfit-btn-ghost">Dashboard</a>
            <a href="profile.jsp" class="qfit-btn qfit-btn-secondary">Profile</a>
            <a href="LogoutServlet" class="qfit-btn qfit-btn-ghost">Log Out</a>
        </nav>
    </header>




    <main class="qfit-dashboard-main">
        <h1 class="qfit-dashboard-heading">My Profile</h1>
       
        <c:if test="${not empty requestScope.message}">
            <div class="qfit-success-message"><c:out value="${requestScope.message}"/></div>
        </c:if>
        <c:if test="${not empty requestScope.error}">
            <div class="qfit-error-message"><c:out value="${requestScope.error}"/></div>
        </c:if>


        <div class="qfit-profile-grid">
           
            <form id="personalInfoForm" method="post" action="ProfileUpdateServlet" class="qfit-glass-card qfit-profile-card qfit-personal-info">
                <input type="hidden" name="action" value="personal">
                <h3>Personal Information</h3>
               
                <div class="qfit-data-group qfit-editable-field" id="fullNameGroup">
                    <label for="fullName">Full Name:</label>
                    <p class="read-only"><c:out value="${user.fullName}"/></p>
                    <input type="text" id="fullName" name="fullName" value="<c:out value="${user.fullName}"/>" required>
                </div>
               
                <div class="qfit-data-group">
                    <label>Queens College Email:</label>
                    <p><c:out value="${user.email}"/></p>
                    <p class="qfit-note qfit-note-small">Email cannot be changed.</p>
                </div>
               
                <div class="qfit-data-group qfit-editable-field" id="phoneGroup">
                    <label for="phone">Phone Number:</label>
                    <p class="read-only"><c:out value="${user.phone}" default="N/A"/></p>
                    <input type="tel" id="phone" name="phone" value="<c:out value="${user.phone}"/>" placeholder="e.g., 555-123-4567">
                </div>
               
                <div class="qfit-data-group">
                    <label>Account Status:</label>
                    <p class="qfit-status-badge qfit-status-<c:out value="${user.status.toLowerCase()}"/>">
                        <c:out value="${user.status}"/>
                    </p>
                </div>
               
                <button type="button" class="qfit-btn qfit-btn-secondary qfit-edit-btn" onclick="toggleEdit('personalInfoForm')">Edit Details</button>
                <button type="submit" class="qfit-btn qfit-btn-primary qfit-submit-btn">Save Changes</button>
            </form>




            <form id="fitnessProfileForm" method="post" action="ProfileUpdateServlet" class="qfit-glass-card qfit-profile-card qfit-fitness-info">
                 <input type="hidden" name="action" value="fitness">
                <h3>Fitness Profile</h3>
               
                <div class="qfit-data-group qfit-data-split editing-fields">
                    <div class="qfit-editable-field" id="heightGroup">
                        <label for="height">Height:</label>
                        <p class="read-only"><c:out value="${user.height}"/> cm</p>
                        <input type="number" id="height" name="height" min="100" max="250" value="<c:out value="${user.height}"/>" required>
                    </div>
                    <div class="qfit-editable-field" id="weightGroup">
                        <label for="weight">Weight:</label>
                        <p class="read-only"><c:out value="${user.weight}"/> kg</p>
                        <input type="number" id="weight" name="weight" min="30" max="300" value="<c:out value="${user.weight}"/>" required>
                    </div>
                </div>
               
                <div class="qfit-data-group qfit-editable-field" id="goalGroup">
                    <label for="primaryGoal">Primary Goal:</label>
                    <p class="read-only qfit-tag qfit-tag-blue"><c:out value="${user.primaryGoal}"/></p>
                    <select id="primaryGoal" name="primaryGoal" required>
                        <option value="Strength" <c:if test="${user.primaryGoal eq 'Strength'}">selected</c:if>>Increased Strength</option>
                        <option value="Weight Loss" <c:if test="${user.primaryGoal eq 'Weight Loss'}">selected</c:if>>Weight Loss</option>
                        <option value="Muscle Gain" <c:if test="${user.primaryGoal eq 'Muscle Gain'}">selected</c:if>>Muscle Gain</option>
                        <option value="Endurance" <c:if test="${user.primaryGoal eq 'Endurance'}">selected</c:if>>Improve Consistency</option>
                    </select>
                </div>
               
                <div class="qfit-data-group qfit-editable-field" id="experienceGroup">
                    <label for="experienceLevel">Experience Level:</label>
                    <p class="read-only qfit-tag qfit-tag-green"><c:out value="${user.experienceLevel}"/></p>
                    <select id="experienceLevel" name="experienceLevel" required>
                        <option value="Beginner" <c:if test="${user.experienceLevel eq 'Beginner'}">selected</c:if>>Beginner</option>
                        <option value="Intermediate" <c:if test="${user.experienceLevel eq 'Intermediate'}">selected</c:if>>Intermediate</option>
                        <option value="Advanced" <c:if test="${user.experienceLevel eq 'Advanced'}">selected</c:if>>Advanced</option>
                    </select>
                </div>
               
                <button type="button" class="qfit-btn qfit-btn-secondary qfit-edit-btn" onclick="toggleEdit('fitnessProfileForm')">Update Profile</button>
                <button type="submit" class="qfit-btn qfit-btn-primary qfit-submit-btn">Save Changes</button>
            </form>




            <section class="qfit-glass-card qfit-profile-card qfit-verification-status">
                <h3>Verification Status</h3>
               
                <div class="qfit-data-group qfit-verification-summary">
                    <label>QC ID Verification:</label>
                    <c:choose>
                        <c:when test="${user.verificationStatus eq 'APPROVED'}">
                            <c:set var="statusClass" value="approved"/>
                            <c:set var="statusText" value="Approved"/>
                        </c:when>
                        <c:when test="${user.verificationStatus eq 'PENDING'}">
                            <c:set var="statusClass" value="pending"/>
                            <c:set var="statusText" value="Pending Review"/>
                        </c:when>
                        <c:otherwise>
                            <c:set var="statusClass" value="rejected"/>
                            <c:set var="statusText" value="Rejected / Re-upload Needed"/>
                        </c:otherwise>
                    </c:choose>
                    <p class="qfit-status-badge qfit-status-${statusClass}">
                        <c:out value="${statusText}"/>
                    </p>
                </div>
               
                <div class="qfit-note qfit-note-small">
                    Your ID was submitted on <c:out value="${user.submissionDate}" default="N/A"/>.
                </div>




                <c:if test="${user.verificationStatus eq 'REJECTED' or user.verificationStatus eq 'PENDING'}">
                     <button class="qfit-btn qfit-btn-ghost qfit-edit-btn">Re-upload ID</button>
                </c:if>


            </section>




        </div>
    </main>




    <footer class="qfit-footer">
        <p>© 2025 QFit Fitness Tracker · Queens College</p>
    </footer>
</div>


<script>
    // Toggles the display mode of a section between read-only and editable fields
    function toggleEdit(formId) {
        const formElement = document.getElementById(formId);
       
        // Toggle the 'editing' class on the form container
        formElement.classList.toggle('editing');


        // Find all data-groups within this form
        const dataGroups = formElement.querySelectorAll('.qfit-data-group.qfit-editable-field');
       
        dataGroups.forEach(group => {
            // Toggling the editing class on the group itself handles input/text display
            group.classList.toggle('editing');
        });


        // Ensure the Save Changes button gets focus when editing starts for accessibility
        if (formElement.classList.contains('editing')) {
            formElement.querySelector('.qfit-submit-btn').focus();
        }
    }
</script>


</body>
</html>

