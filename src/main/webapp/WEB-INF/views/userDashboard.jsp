<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%-- User stored in session by LoginServlet --%>
<c:set var="user" value="${sessionScope.currentUser}" />

<%-- ALWAYS build URLs with c:url so contextPath is correct (/qfit) --%>
<c:url var="cssUrl" value="/static/css/styles.css" />
<c:url var="profileUrl" value="/ProfileServlet" />
<c:url var="logoutUrl" value="/LogoutServlet" />
<c:url var="historyUrl" value="/WorkoutHistoryServlet" />
<c:url var="logWorkoutUrl" value="/LogWorkoutServlet" />
<c:url var="chartDataUrl" value="/ChartDataServlet" />
<c:url var="calendarDataUrl" value="/CalendarDataServlet" />
<c:url var="createWorkoutPlanUrl" value="/CreateWorkoutPlanServlet" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard · QFit Fitness Tracker</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <%-- ✅ FIX: use the SAME css file your login page uses --%>
    <link rel="stylesheet" href="${cssUrl}">

    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.1/dist/chart.umd.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.10/index.global.min.js"></script>

    <style>
        /* Temporarily hide the modal until the button is clicked */
        #createWorkoutModal { display: none; }

        /* Custom styles for nav buttons */
        .qfit-dashboard-nav a { text-decoration: none; }
        .qfit-dashboard-nav button, .qfit-dashboard-nav .qfit-btn {
            margin-left: 10px;
            height: 35px;
            padding: 0 15px;
            font-size: 14px;
            border-radius: 8px;
            cursor: pointer;
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
            <a href="${profileUrl}" class="qfit-btn qfit-btn-secondary">Profile</a>
            <a href="${logoutUrl}" class="qfit-btn qfit-btn-ghost">Log Out</a>
        </nav>
    </header>

    <main class="qfit-dashboard-main">

        <div class="qfit-dashboard-header">
            <h1>Welcome Back, <c:out value="${user.fullName}" default="Student"/>!</h1>
        </div>

        <div class="qfit-dashboard-grid">

            <section class="qfit-top-row-grid">

                <div class="qfit-nav-cards-wrapper">

                    <div class="qfit-nav-card" onclick="scrollToSection('calendar-section')">
                        <h3>🗓️ Workout Schedule</h3>
                        <p>View your planned workouts and log past sessions.</p>
                    </div>

                    <%-- ✅ NEW: Log New Session card (same style as others) --%>
                    <a href="${logWorkoutUrl}" style="text-decoration: none;">
                        <div class="qfit-nav-card">
                            <h3>➕ Log New Session</h3>
                            <p>Quickly log a completed workout session.</p>
                        </div>
                    </a>

                    <div class="qfit-nav-card" onclick="scrollToSection('charts-section')">
                        <h3>📈 Progress Tracker</h3>
                        <p>Visualize your progress for weight, steps, and activity over time.</p>
                    </div>

                    <%-- View History Nav Card --%>
                    <a href="${historyUrl}" style="text-decoration: none;">
                        <div class="qfit-nav-card">
                            <h3>📜 View History</h3>
                            <p>Review and analyze all past logged workout sessions.</p>
                        </div>
                    </a>

                    <div class="qfit-action-section">
                        <h4>Integrations</h4>
                        <div class="qfit-action-grid">
                            <div class="qfit-api-status qfit-connected">
                                <p><strong>Google Fit:</strong> Connected <span class="qfit-status-badge">✔</span></p>
                                <button class="qfit-btn qfit-btn-ghost qfit-btn-sm" type="button">Sync Now</button>
                            </div>

                            <div class="qfit-api-status qfit-disconnected">
                                <p><strong>Apple Health:</strong> Disconnected <span class="qfit-status-badge">✖</span></p>
                                <button class="qfit-btn qfit-btn-ghost qfit-btn-sm" type="button">Connect</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="qfit-status-action-wrapper">
                    <h3>Your Real-time Status</h3>

                    <div class="qfit-status-card-scroll">
                        <div class="qfit-status-box">
                            <h4>Heart Rate (Resting)</h4>
                            <div>
                                <span class="qfit-status-value"><c:out value="${requestScope.restingHR}" default="N/A"/></span>
                                <span class="qfit-status-unit">bpm</span>
                            </div>
                        </div>
                        <div class="qfit-status-box">
                            <h4>Steps Today</h4>
                            <div>
                                <span class="qfit-status-value"><c:out value="${requestScope.stepsToday}" default="0"/></span>
                                <span class="qfit-status-unit">steps</span>
                            </div>
                        </div>
                        <div class="qfit-status-box">
                            <h4>Calories Burned</h4>
                            <div>
                                <span class="qfit-status-value"><c:out value="${requestScope.caloriesBurned}" default="0"/></span>
                                <span class="qfit-status-unit">kcal</span>
                            </div>
                        </div>
                        <div class="qfit-status-box">
                            <h4>Last Workout</h4>
                            <div>
                                <span class="qfit-status-value"><c:out value="${requestScope.lastWorkoutName}" default="None"/></span>
                                <span class="qfit-status-unit"><c:out value="${requestScope.lastWorkoutDate}" default="--"/></span>
                            </div>
                        </div>
                    </div>

                    <div class="qfit-action-button-container">
                        <button class="qfit-btn qfit-btn-cute-action" type="button" onclick="openCreateWorkoutModal()">
                            ➕ Create New Workout Plan
                        </button>
                    </div>
                </div>

            </section>

            <section id="plans-section" class="qfit-section">
                <h2>Current & Upcoming Workout Plans</h2>
                <div id="workoutPlansContainer" class="qfit-workout-plans-grid">

                    <c:forEach var="plan" items="${requestScope.activePlans}">
    <div class="qfit-workout-plan-card" style="border-left: 5px solid <c:out value='${plan.color}'/>;">
        <h3><c:out value="${plan.name}"/></h3>
        <p>
            <strong>Days:</strong> <c:out value="${plan.daysOfWeek}"/>
            | <strong>Duration:</strong> ~<c:out value="${plan.durationMinutes}"/> mins
        </p>
        <p><c:out value="${plan.previewExercises}"/></p>

        <%-- ✅ Build safe URL for servlet (adds /qfit automatically) --%>
        <c:url var="planDetailsUrl" value="/PlanDetailsServlet">
            <c:param name="planId" value="${plan.id}" />
        </c:url>

        <div style="display: flex; gap: 10px; margin-top: 8px;">
            <a href="${logWorkoutUrl}?planId=${plan.id}"
               class="qfit-btn qfit-btn-sm qfit-btn-primary" style="flex: 1;">Log Today</a>

            <%-- ✅ Replace only this link --%>
            <a href="${planDetailsUrl}"
               class="qfit-btn qfit-btn-sm qfit-btn-secondary">View Details</a>
        </div>
    </div>
</c:forEach>


                    <c:if test="${empty requestScope.activePlans}">
                        <p class="qfit-note">You don't have any active workout plans yet. Click 'Create New Workout Plan' to start!</p>
                    </c:if>

                </div>
            </section>

            <section id="calendar-section" class="qfit-section">
                <h2>🗓️ Workout Schedule</h2>
                <div id="calendar" class="full-calendar-container"></div>
            </section>

            <section id="charts-section" class="qfit-section">
                <h2>📈 Progress Tracker</h2>
                <div class="qfit-chart-container">
                    <canvas id="progressChart"></canvas>
                </div>
            </section>

        </div>
    </main>

    <footer class="qfit-footer">
        <p>© 2025 QFit Fitness Tracker · Queens College</p>
    </footer>
</div>

<div id="createWorkoutModal" class="qfit-modal" tabindex="-1" role="dialog" aria-modal="true" aria-labelledby="modalTitle">
    <div class="qfit-modal-content qfit-glass-card">
        <span class="qfit-close-btn" onclick="closeCreateWorkoutModal()">&times;</span>
        <h2 id="modalTitle">➕ Create New Workout Plan</h2>

        <form method="post" action="${createWorkoutPlanUrl}" class="qfit-modal-form">

            <div class="qfit-form-group">
                <label for="planName">Plan Name</label>
                <input type="text" id="planName" name="planName" required placeholder="e.g., Strength Phase 1, Cardio Days">
            </div>

            <div class="qfit-form-group">
                <label for="planColor">Select Color</label>
                <input type="color" id="planColor" name="planColor" value="#5b78ff" required>
            </div>

            <div class="qfit-form-group">
                <label>Scheduled Days (Select all that apply)</label>
                <div class="qfit-day-checkbox-group">
                    <input type="checkbox" id="mon" name="days" value="MON"><label for="mon">M</label>
                    <input type="checkbox" id="tue" name="days" value="TUE"><label for="tue">T</label>
                    <input type="checkbox" id="wed" name="days" value="WED"><label for="wed">W</label>
                    <input type="checkbox" id="thu" name="days" value="THU"><label for="thu">T</label>
                    <input type="checkbox" id="fri" name="days" value="FRI"><label for="fri">F</label>
                    <input type="checkbox" id="sat" name="days" value="SAT"><label for="sat">S</label>
                    <input type="checkbox" id="sun" name="days" value="SUN"><label for="sun">S</label>
                </div>
            </div>

            <h3>Exercises in this Plan:</h3>
            <div id="exerciseList"></div>

            <button type="button" class="qfit-btn qfit-btn-secondary qfit-btn-sm" onclick="addExerciseField()">+ Add Exercise</button>
            <br><br>

            <button type="submit" class="qfit-btn qfit-btn-primary qfit-full-width">Done (Save Plan)</button>
        </form>

    </div>
</div>

<script>
    // -------------------------------
    // 1) CHART.JS
    // -------------------------------
    document.addEventListener('DOMContentLoaded', function() {
        const ctx = document.getElementById('progressChart');

        async function fetchChartData() {
            try {
                const response = await fetch('${chartDataUrl}');
                const data = await response.json();

                if (data.labels && data.datasets) {
                    new Chart(ctx, {
                        type: 'line',
                        data: {
                            labels: data.labels,
                            datasets: data.datasets
                        },
                        options: {
                            responsive: true,
                            maintainAspectRatio: false,
                            scales: {
                                y: { beginAtZero: true }
                            }
                        }
                    });
                } else {
                    ctx.parentNode.innerHTML =
                        '<p class="qfit-note" style="text-align:center; padding-top: 150px;">Connect Google Fit or log a workout to see your progress chart!</p>';
                }
            } catch (error) {
                console.error("Error fetching chart data:", error);
                ctx.parentNode.innerHTML =
                    '<p class="qfit-note" style="text-align:center; padding-top: 150px; color: #ff6b81;">Could not load chart data. Check server connection.</p>';
            }
        }

        fetchChartData();
    });

    // -------------------------------
    // 2) FULLCALENDAR
    // -------------------------------
    document.addEventListener('DOMContentLoaded', function() {
        const calendarEl = document.getElementById('calendar');
        const calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'dayGridMonth',
            headerToolbar: {
                left: 'prev,next today',
                center: 'title',
                right: 'dayGridMonth,timeGridWeek'
            },
            dayCellDidMount: function(info) {
                const dayNumberEl = info.el.querySelector('.fc-daygrid-day-number');
                if (dayNumberEl) {
                    const dateString = info.date.toISOString().split('T')[0];
                    const addButton = document.createElement('button');
                    addButton.innerHTML = '&#43;';
                    addButton.classList.add('qfit-add-workout-btn');
                    addButton.title = 'Create workout for ' + dateString;
                    addButton.onclick = function() {
                        openCreateWorkoutModal(dateString);
                    };
                    dayNumberEl.parentNode.appendChild(addButton);
                }
            },
            events: async function(fetchInfo, successCallback, failureCallback) {
                try {
                    const response = await fetch('${calendarDataUrl}');
                    const data = await response.json();
                    successCallback(data);
                } catch (error) {
                    console.error("Error fetching calendar events:", error);
                    failureCallback(error);
                }
            }
        });
        calendar.render();
    });

    // -------------------------------
    // 3) NAV + MODAL
    // -------------------------------
    function scrollToSection(id) {
        const element = document.getElementById(id);
        if (element) element.scrollIntoView({ behavior: 'smooth' });
    }

    function openCreateWorkoutModal(dateString = null) {
        const modal = document.getElementById('createWorkoutModal');
        const exerciseList = document.getElementById('exerciseList');
        const planNameInput = document.getElementById('planName');

        exerciseList.innerHTML = '';
        exerciseCount = 0;
        document.querySelector('.qfit-modal-form').reset();

        addExerciseField();

        if (dateString) {
            planNameInput.value = 'Workout on ' + dateString;
        }

        modal.style.display = 'flex';
        modal.focus();
    }

    function closeCreateWorkoutModal() {
        document.getElementById('createWorkoutModal').style.display = 'none';
    }

    document.getElementById('createWorkoutModal').addEventListener('click', function(e) {
        if (e.target === this) closeCreateWorkoutModal();
    });

    // -------------------------------
    // 4) DYNAMIC EXERCISES
    // -------------------------------
    let exerciseCount = 0;

    function addExerciseField() {
        exerciseCount++;
        const container = document.getElementById('exerciseList');

        const exerciseGroup = document.createElement('div');
        exerciseGroup.classList.add('qfit-exercise-group');

        exerciseGroup.innerHTML = `
            <h4>Exercise #${exerciseCount}</h4>
            <div class="qfit-exercise-row">
                <div class="qfit-form-group">
                    <label for="exName${exerciseCount}">Name</label>
                    <input type="text" id="exName${exerciseCount}" name="exName${exerciseCount}" required placeholder="e.g., Bench Press or Treadmill Run">
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
        `;
        container.appendChild(exerciseGroup);
    }
</script>

</body>
</html>
