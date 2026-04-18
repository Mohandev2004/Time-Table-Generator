package com.timetable.util;

import com.timetable.dao.*;
import com.timetable.model.*;
import java.util.*;

public class TimetableGenerator {
    private static final String[] DAYS = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
    private static final String[] TIME_SLOTS = {
        "09:00:00", "10:00:00", "11:00:00", "12:00:00", "14:00:00", "15:00:00"
    };

    public boolean generate() {
        TimetableDAO timetableDAO = new TimetableDAO();
        ClassDAO classDAO = new ClassDAO();
        SubjectDAO subjectDAO = new SubjectDAO();
        
        // Clear existing
        timetableDAO.clearTimetable();

        List<ClassRoom> classes = classDAO.getAllClasses();
        List<Subject> subjects = subjectDAO.getAllSubjects();

        if (classes.isEmpty() || subjects.isEmpty()) return false;

        // Conflict tracking: Day + Time + TeacherID -> Boolean
        Map<String, Boolean> teacherConflictMap = new HashMap<>();
        // Conflict tracking: Day + Time + RoomNo -> Boolean
        Map<String, Boolean> roomConflictMap = new HashMap<>();

        for (ClassRoom classroom : classes) {
            for (String day : DAYS) {
                int subjectIndex = 0;
                for (String startTime : TIME_SLOTS) {
                    // Try to find a subject that doesn't conflict
                    boolean assigned = false;
                    int attempts = 0;
                    
                    while (!assigned && attempts < subjects.size()) {
                        Subject sub = subjects.get((subjectIndex + attempts) % subjects.size());
                        String teacherKey = day + startTime + sub.getTeacherId();
                        String roomKey = day + startTime + classroom.getRoomNo();

                        if (!teacherConflictMap.containsKey(teacherKey) && !roomConflictMap.containsKey(roomKey)) {
                            // No conflict!
                            TimetableEntry entry = new TimetableEntry();
                            entry.setClassId(classroom.getId());
                            entry.setSubjectId(sub.getId());
                            entry.setTeacherId(sub.getTeacherId());
                            entry.setRoomNo(classroom.getRoomNo());
                            entry.setDayName(day);
                            entry.setStartTime(startTime);
                            
                            // Simple end time: 1 hour later
                            int hour = Integer.parseInt(startTime.substring(0, 2)) + 1;
                            entry.setEndTime(String.format("%02d:00:00", hour));

                            timetableDAO.addTimetableEntry(entry);
                            
                            teacherConflictMap.put(teacherKey, true);
                            roomConflictMap.put(roomKey, true);
                            assigned = true;
                        }
                        attempts++;
                    }
                    subjectIndex = (subjectIndex + 1) % subjects.size();
                }
            }
        }
        return true;
    }
}
