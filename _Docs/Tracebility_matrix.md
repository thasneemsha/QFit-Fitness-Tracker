# QFit – Validation Traceability Matrix

---

## 1. Environment / Installation

| # | Use Case ID | Test Case ID | Description | Expected Outcome | Related FR |
|---|------------|--------------|-------------|------------------|------------|
| 1 | UC-INST | TC-INST-01 | Verify Apache, Tomcat, and MySQL services are running | All services start successfully | ENV |
| 2 | UC-INST | TC-INST-02 | Verify HTTPS via Apache reverse proxy | Secure login page loads without certificate warning | ENV |

---

## 2. FR-1: Account Management

| # | Use Case ID | Test Case ID | Description | Expected Outcome | Related FR |
|---|------------|--------------|-------------|------------------|------------|
| 3 | UC-01A | TC-ACC-01 | Register with valid email and password | Account created and credentials stored securely | FR1.1–FR1.3 |
| 4 | UC-01A | TC-ACC-02 | Register with missing or invalid fields | Validation error displayed | FR1.2 |
| 5 | UC-01A | TC-ACC-03 | Login with valid credentials | User redirected to dashboard | FR1.4–FR1.5 |
| 6 | UC-01A | TC-ACC-04 | Login with invalid credentials | Login denied | FR1.5 |
| 7 | UC-01A | TC-ACC-05 | Reset password via email verification | Password successfully updated | FR1.7 |

---

## 3. FR-2: Workout Logging

| # | Use Case ID | Test Case ID | Description | Expected Outcome | Related FR |
|---|------------|--------------|-------------|------------------|------------|
| 8 | UC-01B | TC-WO-01 | Log complete workout entry | Workout saved with timestamp | FR2.1–FR2.9 |
| 9 | UC-01B | TC-WO-02 | Submit workout with missing exercise name | Save blocked with validation error | FR2.2 |
|10 | UC-01B | TC-WO-03 | Enter negative sets, reps, or weight | Invalid values rejected | FR2.3–FR2.5 |

---

## 4. FR-3: Progress Tracking

| # | Use Case ID | Test Case ID | Description | Expected Outcome | Related FR |
|---|------------|--------------|-------------|------------------|------------|
|11 | UC-01B | TC-PR-01 | View workout history | Workout history displayed | FR3.1 |
|12 | UC-01B | TC-PR-02 | Filter workouts by date or exercise | Filtered results shown | FR3.3–FR3.4 |
|13 | UC-01B | TC-PR-03 | View charts and performance trends | Charts rendered correctly | FR3.2–FR3.5 |

---

## 5. FR-4: Goal Setting

| # | Use Case ID | Test Case ID | Description | Expected Outcome | Related FR |
|---|------------|--------------|-------------|------------------|------------|
|14 | UC-02 | TC-GOAL-01 | Create a new fitness goal | Goal saved and visible | FR4.1 |
|15 | UC-02 | TC-GOAL-02 | Edit an existing goal | Goal updated successfully | FR4.2 |
|16 | UC-02 | TC-GOAL-03 | Mark goal as completed | Goal marked completed | FR4.3 |
|17 | UC-02 | TC-GOAL-04 | Receive goal deadline reminder (optional) | Reminder notification received | FR4.4 |

---

## 6. FR-5: Biometric Tracking & API Integration

| # | Use Case ID | Test Case ID | Description | Expected Outcome | Related FR |
|---|------------|--------------|-------------|------------------|------------|
|18 | UC-03 | TC-API-01 | Connect Google Fit / Apple Health | External provider authorized | FR5.1–FR5.2 |
|19 | UC-03 | TC-API-02 | Automatic daily biometric sync | Data synced and stored | FR5.3 |
|20 | UC-03 | TC-API-03 | Manual biometric data refresh | Dashboard updates immediately | FR5.4 |
|21 | UC-03 | TC-API-04 | Display biometric data on dashboard | Data visible to user | FR5.5 |
|22 | UC-03 | TC-API-05 | Prevent duplicate biometric entries | No double counting occurs | FR5.7 |
|23 | UC-03 | TC-API-06 | Disconnect external provider | Sync stopped successfully | FR5.8 |
|24 | UC-03 | TC-API-07 | Handle biometric sync error | Error notification displayed | FR5.9 |

---

## 7. FR-6: Admin Features

| # | Use Case ID | Test Case ID | Description | Expected Outcome | Related FR |
|---|------------|--------------|-------------|------------------|------------|
|25 | UC-04 | TC-ADM-01 | Admin views all user profiles | User list displayed | FR6.1 |
|26 | UC-04 | TC-ADM-02 | Admin activates/deactivates account | Account status updated | FR6.2 |
|27 | UC-04 | TC-ADM-03 | Deactivated user attempts login | Login blocked | FR6.2 |
|28 | UC-04 | TC-ADM-04 | Admin resets user password | Password reset completed | FR6.3 |
|29 | UC-04 | TC-ADM-05 | Admin manages system roles | Role updated successfully | FR6.4 |
