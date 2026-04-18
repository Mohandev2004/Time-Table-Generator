# Java Time Table Generator - Setup Guide

## Prerequisites
1.  **JDK 8 or higher**
2.  **Apache Tomcat 9 or 10**
3.  **MySQL Server**
4.  **Eclipse IDE for Enterprise Java Developers**
5.  **MySQL Connector/J JAR** (e.g., `mysql-connector-java-8.0.x.jar`)

## Step 1: Database Configuration
1.  Open MySQL Workbench or CMD.
2.  Run the script provided in `schema.sql`.
3.  Update the password in `src/main/java/com/timetable/dao/DBConnection.java` (line 12).

## Step 2: Import into Eclipse
1.  Open Eclipse.
2.  Go to `File -> Import -> Maven -> Existing Maven Projects`.
3.  Select the project directory and click `Finish`.
4.  Maven will automatically download all dependencies (MySQL connector, Servlet API, etc.).

## Step 3: Run the Project
1.  Right-click on the project -> `Run As -> Run on Server`.
2.  Select `Apache Tomcat`.
3.  Access the app at: `http://localhost:8080/TimeTableGenerator/login.jsp`

## Features Included:
- **Conflict-Free Generation**: Logic ensures no teacher or room is double-booked.
- **MVC Architecture**: Separated Models, Views (JSP), and Controllers (Servlets).
- **Modern UI**: Fully responsive Bootstrap 5 interface.
- **Export**: Built-in Print-to-PDF functionality.
- **Security**: Session-based authentication.

## Default Credentials
- **Username**: `admin`
- **Password**: `admin123`
