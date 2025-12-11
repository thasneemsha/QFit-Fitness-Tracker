## QFit Backend Implementation Helper (Java Servlets)

This plan details the Java Servlets required to make the JSPs functional, focusing on database interaction and the use of JSON for dynamic components.

## I. Core Dashboard & Data Providers

### 1. `DashboardServlet`
* **URL:** `/DashboardServlet`
* **Method:** `doGet()`
* **Function:**
    * Authenticates the user session.
    * Retrieves the list of active `Plan` objects for the user.
    * Fetches key real-time metrics (HR, Steps, Calories) via **API Integration**.
    * Retrieves the summary of the user's last logged workout.
* **Output:** Forwards the request and the fetched data (as attributes) to `userDashboard.jsp`.

### 2. `CalendarDataServlet` (JSON API)
* **URL:** `/CalendarDataServlet`
* **Method:** `doGet()`
* **Function:**
    * Retrieves all scheduled `Plan` days and confirmed `LoggedSession` dates for the current user.
    * Formats this data into a JSON array structure compatible with FullCalendar (JavaScript).
* **Output:** Writes a **JSON response** directly to the client via `response.getWriter().write(jsonArray)`.

### 3. `ChartDataServlet` (JSON API)
* **URL:** `/ChartDataServlet`
* **Method:** `doGet()`
* **Function:**
    * Retrieves time-series data (e.g., body weight, average workout intensity, steps) from the database or **API History**.
    * Formats this data into a JSON object structure compatible with Chart.js.
* **Output:** Writes a **JSON response** directly to the client via `response.getWriter().write(jsonObject)`.

## II. Plan Management Servlets

### 4. `PlanDetailsServlet` (Read)
* **URL:** `/PlanDetailsServlet?planId=X`
* **Method:** `doGet()`
* **Function:**
    * Extracts the `planId` from the request parameters.
    * Retrieves the complete `Plan` object, including all associated `Exercise` objects.
* **Output:** Forwards the `Plan` object to `planDetails.jsp`.

### 5. `CreateWorkoutPlanServlet` (Create)
* **URL:** `/CreateWorkoutPlanServlet`
* **Method:** `doPost()`
* **Function:**
    * Processes form data for the new plan (name, color, days).
    * Iterates through all dynamically added exercise parameters (e.g., `exName1`, `exSets1`, `exName2`, etc.).
    * **Saves** the new `Plan` and all `Exercise` objects to the database.
* **Output:** Redirects to `/DashboardServlet` on success.

### 6. `EditPlanServlet` (Read for Update)
* **URL:** `/EditPlanServlet?planId=X`
* **Method:** `doGet()`
* **Function:**
    * Retrieves the complete existing `Plan` object based on `planId`.
* **Output:** Forwards the `Plan` object to `editPlan.jsp` to pre-fill the form.

### 7. `UpdatePlanServlet` (Update/Delete)
* **URL:** `/UpdatePlanServlet`
* **Method:** `doPost()`
* **Function:**
    * Handles both plan updates and the delete action.
    * **If Action=Update:** Processes changes to plan details, updates existing exercises, deletes exercises that were removed from the form, and inserts new exercises.
    * **If Action=Delete:** Deletes the `Plan` and all associated data.
* **Output:** Redirects to `/PlanDetailsServlet?planId=X` (for Update) or `/DashboardServlet` (for Delete).

## III. Workout Logging & History Servlets

### 8. `WorkoutHistoryServlet` (Read)
* **URL:** `/WorkoutHistoryServlet`
* **Method:** `doGet()`
* **Function:**
    * Retrieves a list of all historical `LoggedSession` summaries for the current user.
* **Output:** Forwards the list of sessions to `workoutHistory.jsp`.

### 9. `LogWorkoutServlet` (Pre-Log)
* **URL:** `/LogWorkoutServlet?planId=X`
* **Method:** `doGet()`
* **Function:**
    * Retrieves the target `Plan` object to provide the template for the logging form.
* **Output:** Forwards the `Plan` object to `logWorkout.jsp`.

### 10. `ProcessLogWorkoutServlet` (Create Log)
* **URL:** `/ProcessLogWorkoutServlet`
* **Method:** `doPost()`
* **Function:**
    * Processes the completed log form (date, plan ID, and achieved sets/reps/weight for each exercise).
    * **Saves** a new `LoggedSession` record and all associated `PerformanceDetail` records to the database.
* **Output:** Redirects to `/ViewSessionServlet?sessionId=X` on successful save.

### 11. `ViewSessionServlet` (Read Log)
* **URL:** `/ViewSessionServlet?sessionId=X`
* **Method:** `doGet()`
* **Function:**
    * Retrieves the complete `LoggedSession` and its list of `PerformanceDetail` records.
    * Retrieves session-specific API metrics (HR, calories) based on the session time window.
* **Output:** Forwards the `LoggedSession` object to `viewSession.jsp`.

## IV. Utility & Admin Servlets

### 12. `LoginServlet` (Utility)
* **URL:** `/LoginServlet`
* **Method:** `doPost()`
* **Function:**
    * Validates user/password.
    * Checks account type (Standard User or Admin).
    * Sets the appropriate session attribute (`session.setAttribute("currentUser", user)` or `"currentAdmin", admin)`).
* **Output:** Redirects to `/DashboardServlet` or `/AdminDashboardServlet` based on user type. **Must forward to `error.jsp` on failure.**

### 13. `AdminDashboardServlet` (Admin Read)
* **URL:** `/AdminDashboardServlet`
* **Method:** `doGet()`
* **Function:**
    * Retrieves all user counts (Total, Active, Pending).
    * Retrieves the list of all users, focusing on the subset with `VerificationStatus = 'PENDING'`.
* **Output:** Forwards all data to `adminDashboard.jsp`.

### 14. `AdminActionServlet` (Admin Update)
* **URL:** `/AdminActionServlet`
* **Method:** `doPost()`
* **Function:**
    * Handles actions from the admin dashboard (VERIFY, REJECT, DEACTIVATE).
    * Updates the `VerificationStatus` field of the specified user ID in the database.
* **Output:** Redirects back to `/AdminDashboardServlet`.
