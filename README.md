# 📅 Automatic Time Table Generator (Java MVC)

A professional final-year project built using **Java (Servlets & JSP)**, **MySQL**, and **Maven**. This system automatically generates conflict-free academic timetables for colleges and schools.

---

## 🚀 Features
- **Automatic Generation**: Intelligent algorithm to prevent teacher and room conflicts.
- **Admin Dashboard**: Manage Teachers, Subjects, and Classes.
- **Modern UI**: Built with Bootstrap 5, featuring a sleek landing page.
- **Session Security**: Protected admin routes and logout functionality.
- **Print & PDF**: Export timetables directly from the browser.
- **AJAX Filtering**: View schedules by specific class or teacher.

---

## 🛠️ Technology Stack
- **Backend**: Java Servlets, JDBC
- **Frontend**: JSP, Bootstrap 5, FontAwesome
- **Database**: MySQL 8.0
- **Build Tool**: Maven
- **Server**: Apache Tomcat 9.0+

---

## 📂 Step 1: Database Setup
Run the following queries in **MySQL Workbench** to initialize the database and load sample data.

### 1.1 Create Schema
```sql
CREATE DATABASE IF NOT EXISTS timetable_db;
USE timetable_db;

CREATE TABLE users (id INT AUTO_INCREMENT PRIMARY KEY, username VARCHAR(50) UNIQUE, password VARCHAR(255), role VARCHAR(20) DEFAULT 'ADMIN');

CREATE TABLE teachers (id INT AUTO_INCREMENT PRIMARY KEY, teacher_name VARCHAR(100), email VARCHAR(100) UNIQUE);

CREATE TABLE classes (id INT AUTO_INCREMENT PRIMARY KEY, class_name VARCHAR(50), section VARCHAR(10), room_no VARCHAR(20));

CREATE TABLE subjects (id INT AUTO_INCREMENT PRIMARY KEY, subject_name VARCHAR(100), teacher_id INT, FOREIGN KEY (teacher_id) REFERENCES teachers(id) ON DELETE SET NULL);

CREATE TABLE timetable (id INT AUTO_INCREMENT PRIMARY KEY, class_id INT, subject_id INT, teacher_id INT, room_no VARCHAR(20), day_name ENUM('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'), start_time TIME, end_time TIME, FOREIGN KEY (class_id) REFERENCES classes(id) ON DELETE CASCADE, FOREIGN KEY (subject_id) REFERENCES subjects(id) ON DELETE CASCADE, FOREIGN KEY (teacher_id) REFERENCES teachers(id) ON DELETE CASCADE);

-- Initial Admin Login
INSERT INTO users (username, password) VALUES ('admin', 'admin123');
```

### 1.2 Insert Sample Data (Optional but Recommended)
```sql
INSERT INTO classes (class_name, section, room_no) VALUES ('6CSE1', 'A', 'LH-101'), ('6CSE1', 'B', 'LH-102'), ('4CSE2', 'A', 'LH-201');
INSERT INTO teachers (teacher_name, email) VALUES ('Dr. Amit Sharma', 'amit@example.com'), ('Prof. Priya Verma', 'priya@example.com');
INSERT INTO subjects (subject_name, teacher_id) VALUES ('Data Structures', 1), ('Operating Systems', 2), ('Java Programming', 1);
```

---

## 💻 Step 2: Running in Eclipse
1. **Import Project**: 
   - `File` -> `Import` -> `Maven` -> `Existing Maven Projects`.
   - Select the project folder and click `Finish`.
2. **Update Database Password**:
   - Open `src/main/java/com/timetable/dao/DBConnection.java`.
   - Update the `PASSWORD` variable to match your MySQL password.
3. **Maven Update**:
   - Right-click project -> `Maven` -> `Update Project` -> Check `Force Update` -> `OK`.
4. **Run on Server**:
   - Right-click project -> `Run As` -> `Run on Server`.
   - Select **Apache Tomcat v9.0+**.
5. **Access the App**:
   - Home Page: `http://localhost:8080/TimeTableGenerator/`
   - Login: `admin` / `admin123`

---

## 🎯 Conflict-Free Logic
The system uses a **Greedy Search Algorithm** to iterate through each class and time slot. It cross-references the `teacher_id` and `room_no` against the existing `timetable` entries for that specific `day` and `time_slot` to ensure zero overlaps.
