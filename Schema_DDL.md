# 💾 QFit Tracker: Final Database Schema (DDL)

## 📌 Status & Requirements

* **Status:** FINAL (6 Tables)
* **Target Database:** `qfit_tracker`
* **Purpose:** This schema supports all core features: User Authentication, Admin Approval (`is_verified`), Workout Planning, Detailed Logging, and **standardized data for Chart.js progress tracking**.

---

## 🛠️ Phase 1: Deployment Instructions

Follow these steps in the MySQL command line interface (`mysql>`) to deploy the schema.

### Step 1: Verification and Database Selection

These commands confirm your connection and create the database container.

```sql
-- Check your current user and connection details
SELECT USER();
```
```sql
-- If you want to Delete the old database and to craete new one
DROP DATABASE qfit_tracker;
```
```sql
-- Create the main database container if it doesn't already exist
CREATE DATABASE IF NOT EXISTS qfit_tracker;
```
```sql
-- CRUCIAL: Select the database to begin working inside it (either the new one you created or the old one)
USE qfit_tracker;
```
```sql
-- Optional: Show existing tables (should be empty if dropped previously)
SHOW TABLES;
```
<br>
### Step 1: Create Tables
-- if NULL create these tables for the Fitness Tracker
<br>

```sql
-- *** 1. USER Table (Auth & Profile - NOW includes Front/Back ID Paths) ***
CREATE TABLE User (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    is_admin BOOLEAN DEFAULT 0,
    is_verified BOOLEAN DEFAULT 0, -- Supports pendingAproval.jsp logic (0=Pending, 1=Verified)
    id_front_path VARCHAR(255) NULL, -- Path to the front of the ID image file
    id_back_path VARCHAR(255) NULL,  -- Path to the back of the ID image file
    registration_date DATETIME NOT NULL,
    last_login DATETIME NULL
);

-- *** 2. WORKOUT_PLAN Table (Plan Definition) ***
CREATE TABLE WorkoutPlan (
    plan_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    plan_name VARCHAR(100) NOT NULL,
    description TEXT NULL,
    created_date DATE NOT NULL,
    is_active BOOLEAN DEFAULT 1,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- *** 3. STATIC_EXERCISES Table ((OPTIONAL Suggestions/Lookups ONLY)) ***
CREATE TABLE StaticExercises (
    static_exercise_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) UNIQUE NOT NULL,
    category VARCHAR(50) NULL,
    default_reps VARCHAR(50) NULL
);

-- *** 4. EXERCISE Table (CRITICAL: Stores User's Custom Exercise Name) ***
CREATE TABLE Exercise (
    exercise_id INT PRIMARY KEY AUTO_INCREMENT,
    plan_id INT NOT NULL,
    exercise_name VARCHAR(100) NOT NULL, -- STORES THE CUSTOM NAME (e.g., 'Yoga Flow', 'Thasneem's Deadlift')
    target_sets INT NOT NULL,
    target_reps VARCHAR(50) NULL,
    target_weight FLOAT NULL,
    notes VARCHAR(255) NULL,
    FOREIGN KEY (plan_id) REFERENCES WorkoutPlan(plan_id)
);

-- *** 5. LOGGED_SESSION Table (Workout History & Calendar Data Source) ***
CREATE TABLE LoggedSession (
    session_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    plan_id INT NOT NULL,
    session_date DATETIME NOT NULL,
    duration_minutes INT NULL,
    status ENUM('Completed', 'Incomplete') DEFAULT 'Completed',
    notes TEXT NULL,
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (plan_id) REFERENCES WorkoutPlan(plan_id)
);

-- *** 6. PERFORMANCE_SET Table (Detailed Logging & Chart Data Source) ***
CREATE TABLE PerformanceSet (
    set_id INT PRIMARY KEY AUTO_INCREMENT,
    session_id INT NOT NULL,
    exercise_id INT NOT NULL,
    set_number INT NOT NULL,
    actual_reps INT NOT NULL,
    actual_weight FLOAT NOT NULL,
    rpe INT NULL,
    FOREIGN KEY (session_id) REFERENCES LoggedSession(session_id),
    FOREIGN KEY (exercise_id) REFERENCES Exercise(exercise_id)
);
```

```sql
-- if you wanna see the list of tables we have
SHOW TABLES;
```
```sql
-- to see what's inside the table use (User here is the table name)
DESCRIBE User;
```

```sql
-- *** DATA INSERTION FOR STATICEXERCISES TABLE (we might not need this as we are allowing full customization) ***

INSERT INTO StaticExercises (name, category, default_reps) VALUES
('Barbell Bench Press', 'Chest', '8-12'),
('Incline Dumbbell Press', 'Chest', '10-15'),
('Barbell Squat', 'Legs', '5x5'),
('Leg Press', 'Legs', '10-15'),
('Deadlift', 'Back/Legs', '3-5'),
('Barbell Row', 'Back', '8-12'),
('Pull Up', 'Back', 'Failure'),
('Overhead Press (Barbell)', 'Shoulders', '8-10'),
('Lateral Raise (Dumbbell)', 'Shoulders', '12-15'),
('Bicep Curl (Dumbbell)', 'Arms', '10-12'),
('Triceps Pushdown', 'Arms', '10-15'),
('Plank', 'Core', 'Time-Based'),
('Treadmill Run', 'Cardio', 'Time-Based');
```
