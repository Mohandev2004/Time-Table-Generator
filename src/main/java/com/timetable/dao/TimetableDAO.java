package com.timetable.dao;

import com.timetable.model.TimetableEntry;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TimetableDAO {
    public boolean addTimetableEntry(TimetableEntry entry) {
        String query = "INSERT INTO timetable (class_id, subject_id, teacher_id, room_no, day_name, start_time, end_time) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, entry.getClassId());
            stmt.setInt(2, entry.getSubjectId());
            stmt.setInt(3, entry.getTeacherId());
            stmt.setString(4, entry.getRoomNo());
            stmt.setString(5, entry.getDayName());
            stmt.setString(6, entry.getStartTime());
            stmt.setString(7, entry.getEndTime());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); }
        return false;
    }

    public List<TimetableEntry> getTimetableByClass(int classId) {
        List<TimetableEntry> list = new ArrayList<>();
        String query = "SELECT t.*, c.class_name, c.section, s.subject_name, tc.teacher_name " +
                       "FROM timetable t " +
                       "JOIN classes c ON t.class_id = c.id " +
                       "JOIN subjects s ON t.subject_id = s.id " +
                       "JOIN teachers tc ON t.teacher_id = tc.id " +
                       "WHERE t.class_id = ? ORDER BY FIELD(day_name, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'), start_time";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, classId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(mapResultSetToEntry(rs));
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }

    public List<TimetableEntry> getAllTimetableEntries() {
        List<TimetableEntry> list = new ArrayList<>();
        String query = "SELECT t.*, c.class_name, c.section, s.subject_name, tc.teacher_name " +
                       "FROM timetable t " +
                       "JOIN classes c ON t.class_id = c.id " +
                       "JOIN subjects s ON t.subject_id = s.id " +
                       "JOIN teachers tc ON t.teacher_id = tc.id";
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                list.add(mapResultSetToEntry(rs));
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }

    public void clearTimetable() {
        String query = "TRUNCATE TABLE timetable";
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement()) {
            stmt.executeUpdate(query);
        } catch (SQLException e) { e.printStackTrace(); }
    }

    private TimetableEntry mapResultSetToEntry(ResultSet rs) throws SQLException {
        TimetableEntry e = new TimetableEntry();
        e.setId(rs.getInt("id"));
        e.setClassId(rs.getInt("class_id"));
        e.setSubjectId(rs.getInt("subject_id"));
        e.setTeacherId(rs.getInt("teacher_id"));
        e.setRoomNo(rs.getString("room_no"));
        e.setDayName(rs.getString("day_name"));
        e.setStartTime(rs.getString("start_time"));
        e.setEndTime(rs.getString("end_time"));
        e.setClassName(rs.getString("class_name") + " (" + rs.getString("section") + ")");
        e.setSubjectName(rs.getString("subject_name"));
        e.setTeacherName(rs.getString("teacher_name"));
        return e;
    }
}
