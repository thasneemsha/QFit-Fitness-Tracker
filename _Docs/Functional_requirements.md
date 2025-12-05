# Functional Requirements (FR)

The following functional requirements define the expected behaviors and capabilities of the **QFit Universal Workout Tracker** system.

---

## **FR-1: Account Management**

- **FR1.1** System shall allow users to register with email and password.  
- **FR1.2** System shall validate registration inputs.  
- **FR1.3** System shall store credentials securely.  
- **FR1.4** System shall allow users to log in.  
- **FR1.5** System shall validate login credentials.  
- **FR1.6** System shall allow users to update their profile.  
- **FR1.7** System shall allow users to reset their password via email verification.  

---

## **FR-2: Workout Logging**

- **FR2.1** System shall allow users to create a new workout entry.  
- **FR2.2** System shall allow users to enter exercise name.  
- **FR2.3** System shall allow users to enter number of sets.  
- **FR2.4** System shall allow users to enter number of reps.  
- **FR2.5** System shall allow users to enter weight used.  
- **FR2.6** System shall allow users to enter duration.  
- **FR2.7** System shall allow users to enter optional notes.  
- **FR2.8** System shall save each workout entry in the database.  
- **FR2.9** System shall timestamp each workout entry.  

---

## **FR-3: Progress Tracking**

- **FR3.1** System shall retrieve workout history for a user.  
- **FR3.2** System shall generate progress charts.  
- **FR3.3** System shall allow filtering workouts by date.  
- **FR3.4** System shall allow filtering workouts by exercise type.  
- **FR3.5** System shall calculate performance trends.  

---

## **FR-4: Goal Setting**

- **FR4.1** System shall allow users to create fitness goals.  
- **FR4.2** System shall allow users to edit fitness goals.  
- **FR4.3** System shall allow users to mark goals as completed.  
- **FR4.4** System shall optionally remind users of goal deadlines.  

---

## **FR-5: Biometric Tracking & API Integration (Google Fit / Apple Health)**

- **FR5.1** System shall allow users to connect their account to Google Fit or Apple Health.  
- **FR5.2** System shall request permission for specific biometric data (e.g., steps, distance, calories, heart rate).  
- **FR5.3** System shall sync biometric data from Google Fit or Apple Health automatically at least once per day.  
- **FR5.4** System shall allow users to manually refresh their biometric data.  
- **FR5.5** System shall display synced biometric data in the user’s dashboard.  
- **FR5.6** System shall incorporate biometric data into user fitness goals (e.g., step goals, activity minutes).  
- **FR5.7** System shall prevent double-counting when both manual workout logs and API data exist for the same date.  
- **FR5.8** System shall allow users to disconnect Google Fit or Apple Health at any time.  
- **FR5.9** System shall notify users of errors during syncing (e.g., revoked permissions, expired token).  

---

## **FR-6: Admin Features**

- **FR6.1** System shall allow admins to view all user profiles.  
- **FR6.2** System shall allow admins to activate or deactivate user accounts.  
- **FR6.3** System shall allow admins to reset user passwords.  
- **FR6.4** System shall allow admins to manage system roles.  

---

