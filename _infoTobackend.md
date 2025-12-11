## 📝 Total Servlet and JSON Requirements Summary

Based on the complete application structure (User, Admin, and dynamic components), here is the required count and a list of all 14 Servlets, clearly indicating their output type (JSP or JSON).

| Category | Total Count |
| :--- | :--- |
| **Total Servlets Required** | **14** |
| **Servlets Outputting JSON** | **2** |
| **Servlets Forwarding to JSP** | **12** |

---

## 💻 List of All 14 Servlets

### A. JSPs-Based Servlets (12 Servlets - Forward to View)

These Servlets handle business logic and navigation, ultimately directing the user to a Java Server Page (`.jsp`) view.

| Servlet Name | Function |
| :--- | :--- |
| `DashboardServlet` | Loads core data for `userDashboard.jsp`. |
| `LoginServlet` | Handles user authentication and session creation. |
| `PlanDetailsServlet` | Loads data for a single plan detail view. |
| `CreateWorkoutPlanServlet` | Processes form submission for creating a new plan. |
| `EditPlanServlet` | Loads data to pre-fill the plan editing form. |
| `UpdatePlanServlet` | Processes form submission for updating or deleting a plan. |
| `WorkoutHistoryServlet` | Loads the list of all past sessions. |
| `LogWorkoutServlet` | Loads a plan structure to prepare the logging form. |
| `ProcessLogWorkoutServlet` | Processes form submission for logging completed workout performance. |
| `ViewSessionServlet` | Loads data for a single completed session view. |
| `AdminDashboardServlet` | Loads all summary and user list data for the Admin view. |
| `AdminActionServlet` | Processes actions like VERIFY, REJECT, and DEACTIVATE. |

### B. JSON-Based Servlets (2 Servlets - Respond with Data)

These Servlets are designed to respond directly with a **JSON payload** to be consumed by client-side JavaScript components (AJAX) for dynamic updates.

| Servlet Name | Purpose (Output: JSON) |
| :--- | :--- |
| `CalendarDataServlet` | Feeds structured event data to the FullCalendar JS component. |
| `ChartDataServlet` | Feeds time-series dataset information to the Chart.js component. |

---



I recommend we start defining the Java class structure for the `DashboardServlet` now, as it is the primary entry point for the user. Would you like to proceed with the Java implementation of the **`DashboardServlet`**?
