# 📝 Professor Feedback & System Revisions
**QFit Workout Tracker — Final API-Integrated Version**  
This document summarizes **all professor feedback**, our **revisions**, and the **design decisions** for removing coach/payment features.

---

# 1. User Role

## 1.1 Feedback from Professor
- Users should log workouts, view history, track progress, and set goals.
- API integration should allow future mobile clients to access user data.
- Progress dashboards should reflect real-time performance metrics.
- Security: Users must only access their own data.
- Originally, coach feedback and coach-related features were suggested.

## 1.2 Our Revisions
- Added **POST API endpoints** for logging workouts.
- Added **GET API endpoints** for retrieving workout history and progress.
- Progress charts now powered by **API data**, supporting volume, PR trends, and consistency.
- Profile updates and password changes are accessible via **API + UI**.
- Security updated: only authenticated users can access their own data.
- **Coach role removed**: After discussion, we decided students can log and view their own progress without a coach. The API allows future expansion if needed.
- **Payment/subscription features removed**: QFit is fully free for students.

---

# 2. Coach Role

## 2.1 Feedback from Professor
- Coaches should view assigned users and their workout history.
- Coaches should submit feedback and see historical feedback.
- API endpoints should support these actions for dashboard/mobile integration.

## 2.2 Our Revisions / Decisions
- **Coach role removed** entirely to simplify the system scope for the semester.
- Student users now manage their own workouts and goals.
- All features previously suggested for coaches were either integrated into **User dashboards** or removed.
- API support remains for workouts, progress, and feedback (future-proofing).

### Why Removed
- Time and scope constraints for semester project.
- Focused on **student self-tracking**, making the system fully functional without dependency on coach inputs.
- Simplifies security and reduces complexity in backend and API design.

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
- Retrieve system-wide analytics through **Analytics API**.
- Access system logs via **secured API routes**.
- Support external integrations with **API keys/tokens**.
- Payment/subscription management removed — system is free, no billing functionality.

---

# 4. Functional Requirements (FR)

## 4.1 Feedback from Professor
- All user and admin functionality should support **UI + API**.
- Workouts, progress tracking, and feedback should be **API-powered**.
- Data access must be secure and role-based.
- Initially suggested coach features (feedback, assigned users) and monetization were optional.

## 4.2 Our Revisions

### User (FR-1)
- Log workouts via UI + `POST /api/workouts`.
- View workout history via UI + GET API.
- View progress charts via API.
- Manage profile via UI + API.
- Secure access: users can only see their own data.
- Coach features removed; students manage their own progress.
- System is fully free; no subscription/payment required.

### Admin (FR-2)
- Admin login with full privileges.
- View all users (UI + GET API).
- Activate/deactivate accounts (UI + PUT API).
- Reset passwords (UI + POST API).
- Manage user roles (UI + API).
- View analytics via API.
- Access system logs via API.
- Support external integrations with API keys/tokens.

---

# 5. Summary of Changes / Decisions
| Feature / Role | Feedback from Professor | Revision / Decision |
|----------------|------------------------|-------------------|
| User Workouts | Logging, progress, API integration | Added POST/GET API endpoints, API-powered dashboards |
| Coach Role | Suggested coach feedback, assigned users | **Removed** — students track their own workouts and progress |
| Payment / Subscription | Suggested optional monetization | **Removed** — system is fully free for students |
| Admin | Manage users, roles, analytics, API integration | Implemented all via UI + API endpoints |
| Security | Role-based access | All endpoints secured; users access only their data |
| API & JSON | Suggested API support | Fully implemented for user & admin; coach removed |

---

# 6. Notes
- The system now focuses on **student self-tracking** and **fully free access**.  
- **API and JSON endpoints** are implemented for future mobile/dashboard integration.  
- All professor feedback on data access, analytics, and progress visualization has been addressed.  
- Removal of coach/payment features was **intentional** to keep the project **feasible and functional** within the semester scope.
