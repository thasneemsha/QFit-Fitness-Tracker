# QFit – Validation Traceability Matrix

## 1. Environment / Installation

| Serial | Use Case ID | Test Case ID | Description                                                  | Expected Outcome                                              | Related FR |
|--------|-------------|--------------|--------------------------------------------------------------|----------------------------------------------------------------|------------|
| 1      | UC-INST     | TC_INST_01   | Verify Apache, Tomcat, and MySQL services are running        | All services start successfully                               | ENV        |
| 2      | UC-INST     | TC_INST_02   | Verify HTTPS via Apache reverse proxy                        | Secure login page loads without certificate warning           | ENV        |

---

## 2. FR-1: Account Management

| Serial | Use Case ID    | Test Case ID | Description                                      | Expected Outcome                                      | Related FR |
|--------|----------------|--------------|--------------------------------------------------|-------------------------------------------------------|------------|
| 3      | UC-FR1-Account | TC_ACC_01    | Register with valid email and password           | Account created, password stored securely            | FR1.1–1.3  |
| 4      | UC-FR1-Account | TC_ACC_02    | Register with missing email                      | Validation error shown                               | FR1.2      |
| 5      | UC-FR1-Account | TC_ACC_03    | Login with valid credentials                     | User redirected to dashboard                        | FR1.4–1.5  |
| 6      | UC-FR1-Account | TC_ACC_04    | Login with incorrect password                   | Login denied                                         | FR1.5      |
| 7      | UC-FR1-Account | TC_ACC_05    | Reset password through email verification        | Password successfully updated                       | FR1.7      |

---

## 3. FR-2: Workout Logging

| Serial | Use Case ID     | Test Case ID | Description                                      | Expected Outcome                                      | Related FR |
|--------|------------------|--------------|--------------------------------------------------|-------------------------------------------------------|------------|
| 8      | UC-FR2-Workout  | TC_WO_01     | Log full workout entry                           | Workout saved with timestamp                         | FR2.1–2.9  |
| 9      | UC-FR2-Workout  | TC_WO_02     | Log workout with missing exercise name           | Save blocked with validation error                   | FR2.2,2.8  |
| 10     | UC-FR2-Workout  | TC_WO_03     | Enter negative sets or weight                    | Invalid values rejected                              | FR2.3,2.5  |

---

## 4. FR-3: Progress Tracking

| Serial | Use Case ID      | Test Case ID | Description                                      | Expected Outcome                                      | Related FR |
|--------|-------------------|--------------|--------------------------------------------------|-------------------------------------------------------|------------|
| 11     | UC-FR3-Progress  | TC_PR_01     | View workout history                             | Past workouts displayed                              | FR3.1      |
| 12     | UC-FR3-Progress  | TC_PR_02     | Filter workout history by date                   | Only selected date range displayed                  | FR3.3      |
| 13     | UC-FR3-Progress  | TC_PR_03     | View progress chart for exercise                 | Chart renders performance trend                     | FR3.2–3.5  |

---

## 5. FR-4: Goal Setting

| Serial | Use Case ID   | Test Case ID | Description                                      | Expected Outcome                                      | Related FR |
|--------|---------------|--------------|--------------------------------------------------|-------------------------------------------------------|------------|
| 14     | UC-FR4-Goals  | TC_GOAL_01   | Create new fitness goal                          | Goal saved and visible                               | FR4.1      |
| 15     | UC-FR4-Goals  | TC_GOAL_02   | Edit an existing goal                            | Goal updated                                         | FR4.2      |
| 16     | UC-FR4-Goals  | TC_GOAL_03   | Mark goal as completed                           | Goal marked completed                               | FR4.3      |

---

## 6. FR-5: Biometric API Integration (Google Fit / Apple Health)

| Serial | Use Case ID   | Test Case ID | Description                                      | Expected Outcome                                      | Related FR |
|--------|---------------|--------------|--------------------------------------------------|-------------------------------------------------------|------------|
| 17     | UC-FR5-API    | TC_API_01    | Connect account to Google Fit / Apple Health     | External account linked                              | FR5.1–5.2  |
| 18     | UC-FR5-API    | TC_API_02    | Automatic daily sync                             | Biometric data stored daily                          | FR5.3,5.6  |
| 19     | UC-FR5-API    | TC_API_03    | Manual refresh of biometric data                | Dashboard updates immediately                       | FR5.4      |
| 20     | UC-FR5-API    | TC_API_04    | Prevent double counting                          | No duplicate data shown                              | FR5.7      |
| 21     | UC-FR5-API    | TC_API_05    | Disconnect health account                        | API sync stopped                                     | FR5.8      |
| 22     | UC-FR5-API    | TC_API_06    | Handle API sync error                            | Error shown, system remains stable                  | FR5.9      |

---

## 7. FR-6: Admin Features

| Serial | Use Case ID   | Test Case ID | Description                                      | Expected Outcome                                      | Related FR |
|--------|---------------|--------------|--------------------------------------------------|-------------------------------------------------------|------------|
| 23     | UC-FR6-Admin  | TC_ADM_01    | Admin views all users                            | User list visible                                    | FR6.1      |
| 24     | UC-FR6-Admin  | TC_ADM_02    | Admin deactivates a user                        | User cannot log in                                   | FR6.2      |
| 25     | UC-FR6-Admin  | TC_ADM_03    | Deactivated user attempts login                 | Login blocked                                        | FR6.2      |
| 26     | UC-FR6-Admin  | TC_ADM_04    | Admin resets password                           | Password reset successful                           | FR6.3      |
| 27     | UC-FR6-Admin  | TC_ADM_05    | Admin changes user role                         | New role applied                                    | FR6.4      |
