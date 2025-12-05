# ✅ Professor Feedback — Updated Requirements & System Revisions
**QFit Workout Tracker — API-Integrated Version**  
This document consolidates all instructor feedback and provides a fully revised set of **Stakeholder Requirements**, **Functional Requirements**, **role updates**, and **interview insights**, rewritten for API-based system architecture.

---

# 1. User Interview Summary (Revised for API Integration)

The primary end user is a **Queens College student** seeking a simple, efficient way to track workouts, measure progress, and stay consistent.

### Interview Insights
- Works out **3–4 times/week**.
- Needs an easy way to track:  
  - exercise name  
  - sets  
  - reps  
  - weight  
  - notes  
- Wants progress dashboards showing:  
  - weekly volume  
  - personal record (PR) progression  
  - weight trends  
- Wants helpful reminders when inactive for several days.
- Prefers a clean, simple UI with optional deeper stats.
- Will use the system daily if:  
  - logging is fast  
  - charts update instantly  
- Wants the platform to work in the future with **mobile apps** or external tools → *requires API support*.

### Identified User Needs
- Quick workout logging.
- Immediate progress visualization.
- Goal-setting tools.
- Reminders to stay consistent.
- Ability to view coach feedback.
- Access to progress data through **API endpoints** for future mobile or web apps.

---

# 2. Stakeholder Requirements (Updated With API Integration)

## SR-1: User Stakeholder Requirements

### Updated User Requirements — SR1.x
1. **SR1.1 – Log Workouts (UI + API)**  
   Users shall log workouts via UI forms and through a `POST` API endpoint.

2. **SR1.2 – View Workout History (UI + API)**  
   Users shall view their workout history on the dashboard or retrieve it using a secure JSON API.

3. **SR1.3 – View Progress & Trends (API-Powered)**  
   Progress charts (volume, PR trends, consistency) shall be generated from API-driven data.

4. **SR1.4 – Manage Account (UI + API)**  
   Users shall update their profile/password via web UI or authenticated API endpoints.

5. **SR1.5 – Receive Coach Feedback (UI + API)**  
   Users shall view coach feedback on the dashboard or retrieve it via a JSON API endpoint.

6. **SR1.6 – Secure Access to Personal Data (API Security)**  
   Users shall only access their own data using authenticated API calls.

### Changes from Previous Version
- Full **API support** added to all user actions.  
- Workout logging now includes a **POST API endpoint**.  
- Workout history and feedback retrieval is **JSON-based**, not JSP-only.  
- Progress dashboards updated to be **API-powered**, not static pages.  
- Account management now supports API-based updates.  
- Security updated for authenticated user-level access.

---

## SR-2: Coach Stakeholder Requirements (Updated)

### Updated Coach Requirements — SR2.x
1. **SR2.1 – View User Workout History (API + UI)**  
   Coaches shall view user workouts including sets, reps, weight, notes.

2. **SR2.2 – Access Workout Data via API**  
   Coaches shall retrieve user workout data through REST API endpoints.

3. **SR2.3 – Analyze Progress via API**  
   Coaches shall view progress trends using API-provided data structures.

4. **SR2.4 – Submit Written Feedback (UI + API)**  
   Feedback shall be submit-able via UI or API POST commands.

5. **SR2.5 – View Feedback History (API + UI)**  
   Feedback history shall be retrievable through GET API endpoints.

6. **SR2.6 – Access Standardized Performance Metrics (API)**  
   Coaches shall view consistency, volume progress, and PR estimates through API-formatted JSON.

### What Changed?
- Old version assumed everything was done on JSP pages.  
- New version supports coach workflows **via API** (dashboard, mobile, integrations).  
- All coach data (workouts, trends, feedback) now uses **standardized JSON responses**.

---

## SR-3: Admin Stakeholder Requirements (Updated)

### Updated Admin Requirements — SR3.x
1. **SR3.1 – View All Users (UI + API)**  
   Admins shall see all users and their statuses through UI + API.

2. **SR3.2 – Activate/Deactivate Users (UI + API)**  
   Uses secure PUT/POST API endpoints for status updates.

3. **SR3.3 – Reset User Passwords (UI + API)**  
   Password reset supported through UI and API commands.

4. **SR3.4 – Manage System Roles (UI + API)**  
   Admins shall set user roles (User/Coach/Admin) via role management API endpoints.

5. **SR3.5 – View System Metrics (Analytics API)**  
   Admins shall retrieve usage analytics through JSON APIs:
   - active users  
   - workouts logged  
   - weekly activity  
   - coach feedback counts  

6. **SR3.6 – Access System Logs (API-based)**  
   Admins shall retrieve error/event logs through secure API routes.

7. **SR3.7 – Manage External Integrations**  
   Admins shall generate API keys/tokens for future integrations or mobile apps.

### What Changed?
- All admin capabilities now support **REST API endpoints**, not just UI screens.  
- Logging, analytics, role management, and account control are now fully API-enabled.  
- Admin functionality now aligns with real-world software engineering workflows.

---

# 3. Functional Requirements (Updated for API Architecture)

## FR-1: User Functional Requirements

### Authentication & Account
- **FR1.1** User registration  
- **FR1.2** Validate inputs  
- **FR1.3** Store credentials securely  
- **FR1.4** Login  
- **FR1.5** Validate credentials  
- **FR1.6** Profile update via UI + API  

### Workouts & Dashboard
- **FR1.7** Log workouts via UI + `POST /api/workouts`  
- **FR1.8** View workout history via UI + GET API  
- **FR1.9** View API-powered analytics charts  
- **FR1.10** View coach feedback via UI + API  
- **FR1.11** Secure access to only their own data  

---

## FR-2: Coach Functional Requirements

### Authentication & User Access
- **FR2.1** Coach login  
- **FR2.2** View assigned users via UI + API  

### Workout / Progress Access (API)
- **FR2.3** Retrieve workouts via JSON API  
- **FR2.4** View API-powered progress trends  

### Feedback Management
- **FR2.5** Submit feedback via UI + POST API  
- **FR2.6** Update feedback  
- **FR2.7** Delete feedback  
- **FR2.8** Retrieve feedback history via UI + API  

### API Structure
- **FR2.9** All coach data shall follow standardized JSON formats  

---

## FR-3: Admin Functional Requirements

### Core Admin
- **FR3.1** Admin login  

### User Management
- **FR3.2** View all users (UI + GET API)  
- **FR3.3** Activate/deactivate accounts (UI + PUT API)  
- **FR3.4** Reset password (UI + POST API)  
- **FR3.5** Manage user roles (UI + API)  

### System Management
- **FR3.6** View analytics via API  
- **FR3.7** Retrieve system logs through API  
- **FR3.8** Manage API keys for integrations  

---
