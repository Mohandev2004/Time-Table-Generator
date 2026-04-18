package com.timetable.model;

public class ClassRoom {
    private int id;
    private String className;
    private String section;
    private String roomNo;

    public ClassRoom() {}
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getClassName() { return className; }
    public void setClassName(String className) { this.className = className; }
    public String getSection() { return section; }
    public void setSection(String section) { this.section = section; }
    public String getRoomNo() { return roomNo; }
    public void setRoomNo(String roomNo) { this.roomNo = roomNo; }
}
