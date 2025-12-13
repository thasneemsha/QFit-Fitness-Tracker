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
    
    >**About This Manual** This document guides you through using the QFit Fitness Tracker web application. It simplifies technical processes into clear, step-by-step instructions.
   

   ***Welcome***<br>
   QFit is a **free, fitness tracking application** developed *by Queens College students, for Queens College students.* Our goal is to provide the QC community with a robust, ad-free platform to
   manage health and fitness. QFit allows you to **create fully customizable workout plans** ( your plan, your schedule!) and **visualize your performance gains over time** with clear, concise charts and
   Calender.
   > **📱 Cross-Platform Integration:** QFit is integrated with major health APIs to ensure seamless data flow across devices:
   > * **Android Users:** Integrate with the **Google Fit API**.
   > * **Apple Users:** Integrate with the **Apple Health API**.

   ***Target Audience***<br>
   This manual is specifically designed for the **Queens College user base** and caters to two key roles:
   * **Standard Users:**  Queens college Students using the application primarily for tracking workout routines, logging personal performance, and analyzing long-term fitness progress.
   * **Administrators:**  The QC Dev/Support Team(students who worked on this project), user verification, and ensuring the smooth operation of the application.
   
   ---
</details>


* <details> <summary> 4. Getting Started </summary>

  ***4.1 Account Creation & Login***

  | Step | Page/Path | Action | Expected Result |
  | :--- | :--- | :--- | :--- |
  | **1. Register** | Register Page | Enter username, email, secure password, and QC Id-card. | Account created with **Pending Status**. |
  | **2. Login** | Login Page | Use credentials to access. | Redirects to your Dashboard. |

  <br>
  
  ***4.2 ID Verification (Critical Step)***
  >Full access to Dashboard is **locked** until your identity is verified by an Administrator using the QC Id card you submit(Front&Back).
 
  | Step | Location | Purpose | Status Flow |
  | :--- | :--- | :--- | :--- |
  | **1. Access Profile** | Click **Profile** button. | Prepare ID image files. | N/A |
  | **2. Upload Files** | Profile Page | System accepts front and back images of your ID. | System holds images for Admin review. |
  | **3. Approval** | System Check | N/A | **Status changes to Approved**, granting full site access. |
  <br>
  
  ***4.3 The Dashboard Overview***
  >The Dashboard is your Command Center, featuring:

  * **Active Plan List:** Your current routines, ready to be viewed or logged.
  * **Progress Charts:** Visual data showing long-term strength and endurance gains.
  * **Workout Calendar:** Marks the days you completed a session. **You can also click the '+' sign on any date to quickly create a new workout plan.**

  ***4.4 API Integration (Google Fit & Apple Health)***

   >QFit supports synchronization with major health platforms, allowing you to incorporate external data (like steps or calories) into your tracking.

  | Platform | Integration Point | Functionality |
  | :--- | :--- | :--- |
  | **Android Users** | **Google Fit API** | Connects QFit to Google Fit data for seamless cross-platform tracking. |
  | **Apple Users** | **Apple Health API** | Connects QFit to Apple Health data to synchronize iOS tracking metrics. |
  <br>

  ---
 </details>


* <details> <summary> 5. Core Features (User) </summary>

  ***5.1 Feature A: Creating a Custom Plan***

  >You can define any exercise name you want (e.g., "Yoga Flow," "Bench Press," "My Special Cardio").

  ### **How-to: Creating a New Plan**
  1.  **Initiate:** On the Dashboard, click the "Create New Plan" button.
  2.  **Define Core:** Enter a unique **Plan Name**.
  3.  **Add Exercise:** Click the "Add Exercise" button.
      * **CRITICAL INPUT:** In the **Exercise Name** field, **type your custom name**.
      * Set **Target Sets**, **Reps**, and **Target Weight** (optional).
  4.  **Save:** Submit the form. The system saves the Plan and its custom components.



  ***5.2 Feature B: Logging a Workout Session***
  >This is where you record the actual weight and reps achieved.

  #### **How-to: Logging a Session**
  1.  **Start:** Navigate to the plan and click **"Log this Workout Today."**
  2.  **Session Record:** The system automatically creates a date/time record of your session.
  3.  **Data Entry:** For **EACH SET** of **EACH EXERCISE**, enter:
      * Actual Reps
      * Actual Weight (or Time)
      * RPE (Rate of Perceived Exertion, optional)
  4.  **Finalize:** Click "Submit Log." The detailed performance data is saved as a permanent record.



  ***5.3 Feature C: Progress Tracking***
  >Data is pulled dynamically for your Dashboard charts and history views.

  | Tracking View | Data Source | Data Aggregation Method |
  | :--- | :--- | :--- |
  | **Charts** | Progress Processor | The system groups all your logged performance records using your **custom Exercise Name** to display progress over time. |
  | **History** | History Page | Displays a chronological list of all your past workout sessions. |
  | **Session Details** | Session Detail Page | Displays the exact sets/reps/weight logged for a single session. |
  ---
  </details>
  
* <details> <summary>6. Core Features (Admin) </summary>

  ***6.1 Admin Duty: User Verification***
  >This is the Administrator's primary responsibility for site security.

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

  ***Contact Info***
  >If you require assistance with QFit, please contact the development team:

  * **Email:** 
    * n n
    * njn
    * ThasneemMohamed29@qc.cuny.edu
    * kjkj

   ***Glossary***
  | Term | Definition |
  | :--- | :--- |
  | **Session** | The record of a single workout instance (date, plan used, duration). |
  | **Performance Set** | The raw data recorded for one set of an exercise (actual reps, actual weight). |
  | **RPE** | Rate of Perceived Exertion (how hard the set felt, on a scale of 1-10). |
  | **Pending Status** | Your account has been registered but is awaiting Admin approval to unlock core logging features. |
  ---
  </details>




  
