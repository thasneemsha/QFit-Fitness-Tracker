# System Architecture Diagrams

This folder contains the system-level architecture diagrams for the **QFit Universal Workout Tracker**.

## ARCH-01-System-Architecture

This diagram illustrates the overall client-server architecture of the QFit system, including:

- Web browser client used by both **User** and **Admin** roles
- **Apache HTTP Server** acting as an **HTTP reverse proxy**
- **Tomcat application server** hosting the Java web application (Servlets/JSP)
- **MySQL database** for persistent storage of users, workouts, goals, biometric data, and roles
- Integration with **Google Fit** and **Apple Health** using OAuth-based authorization and REST APIs

**Deployment Note:**  
The current deployment uses **HTTP only** via Apache reverse proxy.  
Support for **HTTPS/TLS** can be enabled by configuring Apache with a valid certificate on port 443.
