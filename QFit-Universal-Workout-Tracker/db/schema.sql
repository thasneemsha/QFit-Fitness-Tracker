-- Create database (run this once in MySQL Workbench or CLI)
CREATE DATABASE IF NOT EXISTS qfit_db
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_unicode_ci;

USE qfit_db;

-- Drop old tables if they exist (for clean testing)
DROP TABLE IF EXISTS coach_student_assignments;
DROP TABLE IF EXISTS users;

-- Main users table (students, coaches, admins)
CREATE TABLE users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    full_name      VARCHAR(100) NOT NULL,
    email          VARCHAR(120) NOT NULL UNIQUE,
    phone          VARCHAR(30),
    password_hash  VARCHAR(255) NOT NULL,

    role   ENUM('STUDENT','COACH','ADMIN') NOT NULL DEFAULT 'STUDENT',
    status ENUM('PENDING','ACTIVE','REJECTED','DISABLED') NOT NULL DEFAULT 'PENDING',

    id_front_path  VARCHAR(255),
    id_back_path   VARCHAR(255),

    coaching_area  VARCHAR(120),  -- optional, mainly for coaches

    created_at     TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at     TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    last_login_at  TIMESTAMP NULL DEFAULT NULL
);

CREATE INDEX idx_users_role_status ON users(role, status);

-- Relationship table: which coach is assigned to which student
CREATE TABLE coach_student_assignments (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    student_id BIGINT NOT NULL,
    coach_id   BIGINT NOT NULL,
    status ENUM('ACTIVE','ON_HOLD') NOT NULL DEFAULT 'ACTIVE',
    notes VARCHAR(500),

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_csa_student
        FOREIGN KEY (student_id) REFERENCES users(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_csa_coach
        FOREIGN KEY (coach_id) REFERENCES users(id)
        ON DELETE CASCADE
);

CREATE INDEX idx_csa_coach ON coach_student_assignments(coach_id);
CREATE INDEX idx_csa_student ON coach_student_assignments(student_id);
