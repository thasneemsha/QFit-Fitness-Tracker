# 📚 QFit Fitness Tracker User Manual

## 1. Title Page

| Product Name | QFit Fitness Tracker |
| :--- | :--- |
| Version | v1.0 |
| Date | December 2025 |
| Company | Queens College (QC) |



---

## 2. Table of Contents (Navigation Map)
    
* <details> <summary> 3.Introduction </summary>
   
   ### About This Manual
   This document guides you through using the QFit Fitness Tracker web application. It simplifies technical processes into clear, step-by-step instructions.

   ### Welcome
   QFit provides tools to create fully customizable workout plans and visualize your performance gains over time.

   ### Target Audience
   This manual is for both **Standard Users** (tracking progress) and **Administrators** (securing system access).
   
   ---
</details>


* <details> <summary> 4. Getting Started </summary>

  ### 4.1 Account Creation & Login

  | Step | Page/Path | Action | Expected Result |
  | :--- | :--- | :--- | :--- |
  | **1. Register** | Register Page | Enter username, email, and secure password. | Account created with **Pending Status**. |
  | **2. Login** | Login Page | Use credentials to access. | Redirects to your Dashboard. |


  ### 4.2 The Dashboard Overview
  The Dashboard is your Command Center, featuring:
 
  * **Active Plan List:** Your current routines, ready to be viewed or logged.
  * **Progress Charts:** Visual data showing long-term strength and endurance gains.
  * **Workout Calendar:** Marks the days you completed a session.

  ### 4.3 ID Verification (Critical Step)
  Full access to logging is **locked** until your identity is verified by an Administrator.
 
  | Step | Location | Purpose | Status Flow |
  | :--- | :--- | :--- | :--- |
  | **1. Access Profile** | Click **Profile** button. | Prepare ID image files. | N/A |
  | **2. Upload Files** | Profile Page | System accepts front and back images of your ID. | System holds images for Admin review. |
  | **3. Approval** | System Check | N/A | **Status changes to Approved**, granting full site access. |
  ---
 </details>


* <details> <summary> 5. Core Features (User) </summary>

  ### 5.1 Feature A: Creating a Custom Plan

  **QFit's Key Feature:** You can define any exercise name you want (e.g., "Yoga Flow," "Bench Press," "My Special Cardio").

  #### **How-to: Creating a New Plan**
  1.  **Initiate:** On the Dashboard, click the "Create New Plan" button.
  2.  **Define Core:** Enter a unique **Plan Name**.
  3.  **Add Exercise:** Click the "Add Exercise" button.
      * **CRITICAL INPUT:** In the **Exercise Name** field, **type your custom name**.
      * Set **Target Sets**, **Reps**, and **Target Weight** (optional).
  4.  **Save:** Submit the form. The system saves the Plan and its custom components.



  ### 5.2 Feature B: Logging a Workout Session
  This is where you record the actual weight and reps achieved.

  #### **How-to: Logging a Session**
  1.  **Start:** Navigate to the plan and click **"Log this Workout Today."**
  2.  **Session Record:** The system automatically creates a date/time record of your session.
  3.  **Data Entry:** For **EACH SET** of **EACH EXERCISE**, enter:
      * Actual Reps
      * Actual Weight (or Time)
      * RPE (Rate of Perceived Exertion, optional)
  4.  **Finalize:** Click "Submit Log." The detailed performance data is saved as a permanent record.



  ### 5.3 Feature C: Progress Tracking
  Data is pulled dynamically for your Dashboard charts and history views.

  | Tracking View | Data Source | Data Aggregation Method |
  | :--- | :--- | :--- |
  | **Charts** | Progress Processor | The system groups all your logged performance records using your **custom Exercise Name** to display progress over time. |
  | **History** | History Page | Displays a chronological list of all your past workout sessions. |
  | **Session Details** | Session Detail Page | Displays the exact sets/reps/weight logged for a single session. |
  ---
  </details>
  
* <details> <summary>6. Core Features (Admin) </summary>

  ### 6.1 Admin Duty: User Verification
  This is the Administrator's primary responsibility for site security.

  #### **How-to: Verifying a User**
  1.  **Access Queue:** Log in and navigate to the **Pending Approval Queue**.
  2.  **Review User:** Select a user to view the **Verification Review Page**.
  3.  **Inspect Evidence:** The page displays the uploaded ID images.
  4.  **Execute Decision:** Use the controls to finalize the user's status:
      * **Approve:** Sets user status to **Approved**.
      * **Reject:** Sets user status to **Rejected**.

  > ⚠️ **PRIVACY NOTE:** The Administrator is responsible for ensuring the secure handling of ID images and must never store or share them outside the official verification module.

  ---
  </details>
* <details> <summary> Troubleshooting & FAQs </summary>

  | Common Issue | Solution |
  | :--- | :--- |
  | **"Login Failed"** | Check username/password. If necessary, use the password reset feature. |
  | **"Cannot Log Workout"** | Ensure your account status is **Approved** by an Admin. Pending users cannot log data. |
  | **"Chart Data is Empty"** | You must complete a session log first. Chart data is generated only from the **performance sets** you record. |
  ---
  </details
  
* <details> <summary>8. Support & Contact </summary>

  ### Contact Info
  If you require assistance with QFit, please contact the development team:

  * **Email:** qfit.support@qc.edu

  ### Glossary
  | Term | Definition |
  | :--- | :--- |
  | **Session** | The record of a single workout instance (date, plan used, duration). |
  | **Performance Set** | The raw data recorded for one set of an exercise (actual reps, actual weight). |
  | **RPE** | Rate of Perceived Exertion (how hard the set felt, on a scale of 1-10). |
  | **Pending Status** | Your account has been registered but is awaiting Admin approval to unlock core logging features. |
  ---
  </details>




  
