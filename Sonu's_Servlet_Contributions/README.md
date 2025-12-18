# Sonu Khadgi – Backend Servlet Contributions (QFIT)

This folder contains the backend servlets I worked on for the **QFIT (Fitness Tracking Web Application)** project.

My focus areas include:
- User profiles  
- Workout plan management  
- Admin review and approval workflows  
- Workout history handling  

Due to project scope and time constraints, several features are **simulated**.  
However, all servlets are structured to support **future database and API integration**.

---

## Servlets Overview

### AdminDashboardServlet.java
Controls access to the admin dashboard and prepares data needed for administrative views.

- Supports admin-only functionality
- Enables review of user accounts and workout plans
- Currently uses simulated data
- Designed for future database integration

---

### CreateWorkoutPlanServlet.java
Handles the creation of workout plans submitted by users.

- Processes workout routine form input
- Prepares workout plans for review or approval

---

### EditPlanServlet.java
Allows existing workout plans to be modified.

- Supports updating workout plan details
- Maintains consistency between user submissions and admin review

---

### PendingApprovalServlet.java
Supports the student account approval workflow for QFIT.

Workflow intent:
- Students register and upload an image of their **CUNY ID** for verification
- Admin views a list of pending student accounts
- Admin can:
  - Review submitted CUNY ID images
  - Approve or reject student accounts
  - Control access so only approved students can fully use the platform

> ⚠️ This functionality is **partially simulated** due to project scope.  
> A future version would store approval status and uploaded images in the database.

---

### ProfileServlet.java
Loads and displays the user profile page.

- Retrieves user information stored in the session
- Prepares data for display on the profile interface

---

### ProfileUpdateServlet.java
Processes updates to a user’s profile.

- Handles profile update form submissions
- Updates session-based user data after changes are made

---

### WorkoutHistoryServlet.java
Displays a user’s workout history.

- Simulates retrieving previously logged workout sessions
- Formats workout history for clear presentation

---

## Notes

- Database operations are currently **simulated**
- Servlets are structured for **MySQL integration** in future project phases
- These components demonstrate:
  - Backend request handling
  - Session management
  - MVC separation using **Servlets and JSPs**
