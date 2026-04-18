package com.timetable.dao;

import com.timetable.model.Subject;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SubjectDAO {
    public boolean addSubject(Subject subject) {
        String query = "INSERT INTO subjects (subject_name, teacher_id) VALUES (?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, subject.getName());
            stmt.setInt(2, subject.getTeacherId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); }
        return false;
    }

    public List<Subject> getAllSubjects() {
        List<Subject> list = new ArrayList<>();
        String query = "SELECT s.*, t.teacher_name FROM subjects s LEFT JOIN teachers t ON s.teacher_id = t.id";
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                Subject s = new Subject();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("subject_name"));
                s.setTeacherId(rs.getInt("teacher_id"));
                s.setTeacherName(rs.getString("teacher_name"));
                list.add(s);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }

    public boolean deleteSubject(int id) {
        String query = "DELETE FROM subjects WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); }
        return false;
    }
}
