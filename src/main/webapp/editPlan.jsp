<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="plan" value="${requestScope.plan}" />
<c:set var="user" value="${sessionScope.currentUser}" />


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Plan: <c:out value="${plan.name}" default="New Plan"/> · QFit</title>
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
            <a href="PlanDetailsServlet?planId=<c:out value="${plan.id}"/>" class="qfit-btn qfit-btn-secondary">Cancel</a>
            <a href="DashboardServlet" class="qfit-btn qfit-btn-secondary">Dashboard</a>
            <a href="LogoutServlet" class="qfit-btn qfit-btn-ghost">Log Out</a>
        </nav>
    </header>


    <main class="qfit-detail-main">
        <c:choose>
            <c:when test="${not empty plan}">
                <div class="qfit-log-header">
                    <h1>Edit Workout Plan: <c:out value="${plan.name}"/></h1>
                    <p class="qfit-note">Modify the plan details and update or remove exercises below.</p>
                </div>
               
                <form method="post" action="UpdatePlanServlet" id="editPlanForm" class="qfit-modal-form qfit-glass-card">
                   
                    <input type="hidden" name="planId" value="<c:out value="${plan.id}"/>">
                    <input type="hidden" name="action" value="update">


                    <div class="qfit-form-group">
                        <label for="planName">Plan Name</label>
                        <input type="text" id="planName" name="planName" value="<c:out value="${plan.name}"/>" required placeholder="e.g., Strength Phase 1">
                    </div>


                    <div class="qfit-form-group">
                        <label for="planColor">Select Color</label>
                        <input type="color" id="planColor" name="planColor" value="<c:out value="${plan.color}" default="#5b78ff"/>" required>
                    </div>
                   
                    <div class="qfit-form-group">
                        <label>Scheduled Days (Select all that apply)</label>
                        <c:set var="days" value="${plan.daysOfWeek}" />
                        <div class="qfit-day-checkbox-group">
                            <input type="checkbox" id="mon" name="days" value="MON" <c:if test="${days.contains('MON')}">checked</c:if>><label for="mon">M</label>
                            <input type="checkbox" id="tue" name="days" value="TUE" <c:if test="${days.contains('TUE')}">checked</c:if>><label for="tue">T</label>
                            <input type="checkbox" id="wed" name="days" value="WED" <c:if test="${days.contains('WED')}">checked</c:if>><label for="wed">W</label>
                            <input type="checkbox" id="thu" name="days" value="THU" <c:if test="${days.contains('THU')}">checked</c:if>><label for="thu">T</label>
                            <input type="checkbox" id="fri" name="days" value="FRI" <c:if test="${days.contains('FRI')}">checked</c:if>><label for="fri">F</label>
                            <input type="checkbox" id="sat" name="days" value="SAT" <c:if test="${days.contains('SAT')}">checked</c:if>><label for="sat">S</label>
                            <input type="checkbox" id="sun" name="days" value="SUN" <c:if test="${days.contains('SUN')}">checked</c:if>><label for="sun">S</label>
                        </div>
                    </div>


                    <h3>Exercises in this Plan:</h3>
                    <div id="exerciseList">
                        <%-- Pre-populate existing exercises --%>
                        <c:forEach var="exercise" items="${plan.exercises}" varStatus="loop">
                            <div class="qfit-exercise-group">
                                <h4>Exercise #<c:out value="${loop.index + 1}"/></h4>
                                <div class="qfit-exercise-row">
                                    <div class="qfit-form-group">
                                        <label for="exName${loop.index + 1}">Name</label>
                                        <input type="text" id="exName${loop.index + 1}" name="exName<c:out value="${loop.index + 1}"/>" value="<c:out value="${exercise.name}"/>" required placeholder="e.g., Bench Press">
                                    </div>
                                    <div class="qfit-form-group qfit-small-input">
                                        <label for="exSets${loop.index + 1}">Sets</label>
                                        <input type="number" id="exSets${loop.index + 1}" name="exSets<c:out value="${loop.index + 1}"/>" min="1" value="<c:out value="${exercise.sets}"/>" required>
                                    </div>
                                    <div class="qfit-form-group qfit-small-input">
                                        <label for="exWeight${loop.index + 1}">Weight (lbs)</label>
                                        <input type="number" id="exWeight${loop.index + 1}" name="exWeight<c:out value="${loop.index + 1}"/>" min="0" value="<c:out value="${exercise.weightLbs}"/>" required>
                                    </div>
                                    <div class="qfit-form-group qfit-small-input">
                                        <label for="exTime${loop.index + 1}">Time (min)</label>
                                        <input type="number" id="exTime${loop.index + 1}" name="exTime<c:out value="${loop.index + 1}"/>" min="0" value="<c:out value="${exercise.timeMinutes}" default="0"/>" required>
                                    </div>
                                    <button type="button" class="qfit-btn qfit-btn-small qfit-remove-btn" onclick="this.parentNode.parentNode.remove()">X</button>
                                </div>
                                <input type="hidden" name="exerciseId<c:out value="${loop.index + 1}"/>" value="<c:out value="${exercise.id}"/>">
                            </div>
                        </c:forEach>
                    </div>




                    <button type="button" class="qfit-btn qfit-btn-secondary qfit-btn-sm" onclick="addExerciseField()">+ Add New Exercise</button>
                    <br><br>


                    <button type="submit" class="qfit-btn qfit-btn-primary qfit-full-width">Save Changes</button>
                </form>


                <button class="qfit-btn qfit-btn-ghost qfit-full-width" style="margin-top: 15px; color: #ff6b81;" onclick="confirmDelete()">
                    Delete Plan
                </button>




            </c:when>
            <c:otherwise>
                <div class="qfit-status-card qfit-glass-card">
                    <h2 style="color: #ff6b81;">Plan Not Found</h2>
                    <p>The workout plan ID specified could not be loaded for editing.</p>
                    <a href="DashboardServlet" class="qfit-btn qfit-btn-primary">Go to Dashboard</a>
                </div>
            </c:otherwise>
        </c:choose>
    </main>


    <footer class="qfit-footer">
        <p>© 2025 QFit Fitness Tracker · Queens College | Support: qfit.support@qc.edu</p>
    </footer>
</div>


<script>
    // Initialize counter based on existing exercises
    let exerciseCount = <c:out value="${fn:length(plan.exercises)}" default="0"/>;


    function addExerciseField() {
        exerciseCount++;
        const container = document.getElementById('exerciseList');
       
        const exerciseGroup = document.createElement('div');
        exerciseGroup.classList.add('qfit-exercise-group');




        // Note: New exercises get a placeholder ID of 'new' to distinguish from existing IDs in the Servlet
        exerciseGroup.innerHTML = `
            <h4>Exercise #${exerciseCount}</h4>
            <div class="qfit-exercise-row">
                <div class="qfit-form-group">
                    <label for="exName${exerciseCount}">Name</label>
                    <input type="text" id="exName${exerciseCount}" name="exName${exerciseCount}" required placeholder="e.g., Squat">
                </div>
                <div class="qfit-form-group qfit-small-input">
                    <label for="exSets${exerciseCount}">Sets</label>
                    <input type="number" id="exSets${exerciseCount}" name="exSets${exerciseCount}" min="1" value="3" required>
                </div>
                <div class="qfit-form-group qfit-small-input">
                    <label for="exWeight${exerciseCount}">Weight (lbs)</label>
                    <input type="number" id="exWeight${exerciseCount}" name="exWeight${exerciseCount}" min="0" value="0" required>
                </div>
                <div class="qfit-form-group qfit-small-input">
                    <label for="exTime${exerciseCount}">Time (min)</label>
                    <input type="number" id="exTime${exerciseCount}" name="exTime${exerciseCount}" min="0" value="0" required>
                </div>
                <button type="button" class="qfit-btn qfit-btn-small qfit-remove-btn" onclick="this.parentNode.parentNode.remove()">X</button>
            </div>
            <input type="hidden" name="exerciseId${exerciseCount}" value="new">
        `;
        container.appendChild(exerciseGroup);
    }
   
    function confirmDelete() {
        if (confirm("Are you sure you want to delete this workout plan? This action cannot be undone.")) {
            // If confirmed, change the form action and submit
            const form = document.getElementById('editPlanForm');
            form.action = "UpdatePlanServlet"; // Re-use the update servlet
            document.querySelector('input[name="action"]').value = "delete";
            form.submit();
        }
    }
</script>
</body>
</html>

