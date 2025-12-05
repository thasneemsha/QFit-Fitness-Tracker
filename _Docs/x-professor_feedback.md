# 📝 Professor Feedback & System Revisions
**QFit Workout Tracker — API-Integrated Version**  
This document summarizes all feedback from the professor and how our team revised the system accordingly.

---

# 1. User Role

## 1.1 Feedback from Professor
- Users should be able to log workouts, view history, track progress, and set goals.
- API integration should allow future mobile clients to access user data.
- Progress dashboards should reflect real-time performance metrics.
- Security: Users must only access their own data.

## 1.2 Our Revisions
- Added **POST API endpoints** for logging workouts.
- Added **GET API endpoints** for retrieving workout history and progress.
- Progress charts now powered by **API data**, supporting volume, PR trends, and consistency.
- Profile updates and password changes are accessible via **API + UI**.
- Security updated: only authenticated users can access their own data.

---

# 2. Coach Role

## 2.1 Feedback from Professor
- Coaches should view assigned users and their workout history.
- Coaches should submit feedback and see historical feedback.
- API endpoints should support these actions for dashboard/mobile integration.
- Use standardized JSON response format for consistency.

## 2.2 Our Revisions
- Coach login supports elevated privileges.
- View assigned users via **UI + API**.
- Retrieve workout history and progress trends via **API**.
- Submit, update, and delete feedback through **UI + POST/PUT/DELETE API endpoints**.
- All coach API responses use **standardized JSON format**.

---

# 3. Admin Role

## 3.1 Feedback from Professor
- Admins should view all users, manage accounts (activate/deactivate), reset passwords, and manage roles.
- Admin actions must support **API endpoints** for external apps or dashboards.
- Admins should access system logs, metrics, and external integrations.

## 3.2 Our Revisions
- Admin login implemented with full privileges.
- View all users and roles via **UI + GET API**.
- Activate/deactivate accounts via **PUT/POST API**.
- Password reset via **UI + API**.
- Manage system roles via **API endpoint**.
- Retrieve system-wide analytics through **Analytics API** (active users, workouts, coach feedback, etc.).
- Access system logs via **secured API routes**.
- Support external integrations with **API keys/tokens**.

---

# 4. Functional Requirements (FR)

## 4.1 Feedback from Professor
- All user, coach, and admin functionality must support **UI + API**.
- Workouts, progress tracking, and feedback should be **API-powered**.
- Data access must be secure and role-based.

## 4.2 Our Revisions

### User (FR-1)
- Log workouts via UI + `POST /api/workouts`.
- View workout history via UI + GET API.
- View progress charts via API.
- View coach feedback via UI + API.
- Profile management via UI + API.
- Secure access: users can only see their own data.

### Coach (FR-2)
- Coach login with elevated privileges.
- View assigned users (UI + API).
- Retrieve workout history via JSON API.
- Analyze progress trends via API.
- Submit/update/delete feedback via UI + API.
- Standardized JSON response for all coach endpoints.

### Admin (FR-3)
- Admin login with full privileges.
- View all users (UI + GET API).
- Activate/deactivate accounts (UI + PUT API).
- Reset passwords (UI + POST API).
- Manage system roles (UI + API).
- View system analytics via API.
- Access system logs via API.
- Support external integrations with API keys/tokens.

---

# 5. Summary of Changes
| Role | Feedback | Revision |
|------|---------|----------|
| User | Needs API integration for logging, history, progress | Added POST/GET API endpoints, progress dashboards powered by API |
| Coach | Feedback, history, progress via API | Added standardized JSON API endpoints for workouts and feedback |
| Admin | All management tasks should support API | Admin endpoints for users, roles, passwords, logs, metrics, integrations |
| Security | Only authorized users access data | All endpoints secured; role-based access control implemented |

---

# 6. Notes
- The system is now fully **API-enabled**, supporting both UI and future mobile/dashboard clients.
- Coach and admin roles have standardized **JSON API responses**.
- User, coach, and admin data is protected with **role-based authentication**.
- All revisions are in line with **Professor Bon Sy’s recommendations**.
