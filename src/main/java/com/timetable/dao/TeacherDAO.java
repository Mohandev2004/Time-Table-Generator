package com.timetable.dao;

import com.timetable.model.Teacher;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TeacherDAO {
    public boolean addTeacher(Teacher teacher) {
        String query = "INSERT INTO teachers (teacher_name, email) VALUES (?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, teacher.getName());
            stmt.setString(2, teacher.getEmail());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); }
        return false;
    }

    public List<Teacher> getAllTeachers() {
        List<Teacher> list = new ArrayList<>();
        String query = "SELECT * FROM teachers";
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                Teacher t = new Teacher();
                t.setId(rs.getInt("id"));
                t.setName(rs.getString("teacher_name"));
                t.setEmail(rs.getString("email"));
                list.add(t);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }

    public boolean deleteTeacher(int id) {
        String query = "DELETE FROM teachers WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); }
        return false;
    }
}
