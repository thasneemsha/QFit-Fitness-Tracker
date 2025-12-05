# Q-Fit: Gym Progress Tracking Web Application

## 1. Project Introduction
Q-Fit is a free, student-friendly gym progress tracker developed for CS 370 that focuses on simplicity, reliability, and academic usefulness. The system allows students and casual gym-goers to easily log workouts, record body weight and optional body-fat percentage, view clear progress dashboards with charts and streaks, and upload a profile picture — all at zero cost and with no unnecessary complexity.

Built using JSP for the presentation layer, Java servlets for processing, JSON-based API communication, MySQL for persistent storage, and deployed on an AWS EC2 instance running Apache Tomcat, Q-Fit is a classic three-tier web application that demonstrates textbook software engineering principles.

The project fully supports the three required actors as specified by Professor Bon Sy:

- **User (Student/Gym Member)** – the primary actor who tracks personal progress  
- **Admin** – the secondary actor responsible for system integrity and user oversight  
- **System** – the automated services that store data, generate charts, calculate streaks, and validate inputs  

This clean, minimal scope deliberately excludes any coach, payment, subscription, or social features so the team can deliver a polished, fully functional system within the semester timeline.

---

## 2. Problem Statement
Most students who start going to the gym abandon consistent tracking within weeks because:

- Existing free apps are overloaded with ads, paywalls, or social features they don’t need  
- Paid apps are too expensive for student budgets  
- Simple tools (Google Sheets, notebooks) lack automatic charts and streak motivation  
- There is no lightweight, trustworthy web app that just works without accounts costing money or requiring constant updates  

Q-Fit directly solves these student-specific pain points by providing a completely free, ad-free, login-protected web application that is simple enough for daily use yet powerful enough to show real progress through automatic charts and streaks.

---

## 3. Meet the Team

| Name      | Role                                   | Key Responsibilities |
|-----------|----------------------------------------|-----------------------|
| **Sonu**      | Scrum Master & Backend Developer       | Java Servlets, authentication, workout logic, sprint planning, scrum reports, GitHub monitoring & structuring |
| **Bryan**     | DevOps Engineer & AWS/Tomcat Manager   | AWS EC2 setup, Apache/Tomcat configuration, production deployment & monitoring |
| **Thasneem**  | Frontend Developer & UI/UX Lead        | JSP/HTML/CSS pages, creating wireframes, responsive UI forms, GitHub repo |
| **Ali**       | QA Tester & Documentation Lead         | Testing (dev & prod), bug tracking, diagrams, collaboration with Thasneem for UI/UX designs |

---

## 4. Strengths and Weaknesses of Q-Fit

### Strengths
- Clean, minimal scope – exactly matches final approved SRS, no feature creep  
- Full three-actor implementation (User, Admin, System) with clear separation  
- Production-grade deployment on AWS EC2 + Apache + Tomcat with real uptime  
- Proper SCRUM discipline: sprints, WAR builds, dev/prod environments  
- Secure practices: password hashing, prepared statements, file-type validation  
- Clear traceability from requirements → design → implementation → testing  
- Excellent documentation and acceptance criteria met 100%

### Weaknesses
- No mobile app (web-only); students must open browser on phone  
- Limited chart types (basic line/bar only, no advanced analytics)  
- No password recovery flow (intentionally scoped out)  
- No automated unit/integration tests (only manual QA by Ali)  
- Dashboard load time can reach ~2.8 s on first visit (caching not implemented)  
- No dark mode or advanced responsive tweaks for very small screens  
