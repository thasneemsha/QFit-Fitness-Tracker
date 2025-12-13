# Sequence Diagrams – QFit Universal Workout Tracker

This directory contains UML sequence diagrams that describe the runtime behavior
of key system workflows in the QFit Universal Workout Tracker application.

Each sequence diagram corresponds to a specific use case and functional requirement
and illustrates the interaction between the user interface, application logic,
data access layer, and external services.

---

## SEQ-01 – Log Workout
**Related Use Case:** UC-01B – Workout Logging  
**Related Functional Requirements:** FR-2

**Description:**  
Illustrates the process of a user logging a workout, including form submission,
input validation, timestamp assignment, database persistence, and confirmation
handling. The diagram also captures error handling for invalid inputs.

**Files:**
- `SEQ-01-Log-Workout.puml`
- `SEQ-01-Log-Workout.png`

---

## SEQ-02 – View Workout History
**Related Use Case:** UC-01B – Workout Logging & Viewing  
**Related Functional Requirements:** FR-3

**Description:**  
Shows how a user retrieves workout history and optional progress charts. The
diagram includes optional filtering by date range or exercise type and
demonstrates how aggregated data is retrieved for progress visualization.

**Files:**
- `SEQ-02-View-Workout-History.puml`
- `SEQ-02-View-Workout-History.png`

---

## SEQ-03 – Biometric Sync (OAuth + API Integration)
**Related Use Case:** UC-03 – Biometric Tracking & API Integration  
**Related Functional Requirements:** FR-5

**Description:**  
Depicts the OAuth 2.0 authorization flow and biometric data synchronization
process for Google Fit and Apple Health. The diagram covers provider connection,
authorization code exchange, access and refresh token storage, biometric data
retrieval, persistence, and error handling scenarios.

**Files:**
- `SEQ-03-Biometric-Sync.puml`
- `SEQ-03-Biometric-Sync.png`
