package com.timetable.dao;

import com.timetable.model.ClassRoom;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ClassDAO {
    public boolean addClass(ClassRoom classRoom) {
        String query = "INSERT INTO classes (class_name, section, room_no) VALUES (?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, classRoom.getClassName());
            stmt.setString(2, classRoom.getSection());
            stmt.setString(3, classRoom.getRoomNo());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); }
        return false;
    }

    public List<ClassRoom> getAllClasses() {
        List<ClassRoom> list = new ArrayList<>();
        String query = "SELECT * FROM classes";
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                ClassRoom c = new ClassRoom();
                c.setId(rs.getInt("id"));
                c.setClassName(rs.getString("class_name"));
                c.setSection(rs.getString("section"));
                c.setRoomNo(rs.getString("room_no"));
                list.add(c);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }

    public boolean deleteClass(int id) {
        String query = "DELETE FROM classes WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); }
        return false;
    }
}
