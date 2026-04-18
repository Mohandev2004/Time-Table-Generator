package com.timetable.model;

public class TimetableEntry {
    private int id;
    private int classId;
    private int subjectId;
    private int teacherId;
    private String roomNo;
    private String dayName;
    private String startTime;
    private String endTime;
    
    private String className;
    private String subjectName;
    private String teacherName;

    public TimetableEntry() {}
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public int getClassId() { return classId; }
    public void setClassId(int classId) { this.classId = classId; }
    public int getSubjectId() { return subjectId; }
    public void setSubjectId(int subjectId) { this.subjectId = subjectId; }
    public int getTeacherId() { return teacherId; }
    public void setTeacherId(int teacherId) { this.teacherId = teacherId; }
    public String getRoomNo() { return roomNo; }
    public void setRoomNo(String roomNo) { this.roomNo = roomNo; }
    public String getDayName() { return dayName; }
    public void setDayName(String dayName) { this.dayName = dayName; }
    public String getStartTime() { return startTime; }
    public void setStartTime(String startTime) { this.startTime = startTime; }
    public String getEndTime() { return endTime; }
    public void setEndTime(String endTime) { this.endTime = endTime; }
    public String getClassName() { return className; }
    public void setClassName(String className) { this.className = className; }
    public String getSubjectName() { return subjectName; }
    public void setSubjectName(String subjectName) { this.subjectName = subjectName; }
    public String getTeacherName() { return teacherName; }
    public void setTeacherName(String teacherName) { this.teacherName = teacherName; }
}
