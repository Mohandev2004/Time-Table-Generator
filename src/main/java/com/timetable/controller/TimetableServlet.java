package com.timetable.controller;

import com.timetable.dao.ClassDAO;
import com.timetable.dao.TimetableDAO;
import com.timetable.model.ClassRoom;
import com.timetable.model.TimetableEntry;
import com.timetable.util.TimetableGenerator;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/timetable")
public class TimetableServlet extends HttpServlet {
    private TimetableDAO dao = new TimetableDAO();
    private ClassDAO cDao = new ClassDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String classIdParam = request.getParameter("classId");
        List<TimetableEntry> entries;
        if (classIdParam != null && !classIdParam.isEmpty()) {
            entries = dao.getTimetableByClass(Integer.parseInt(classIdParam));
        } else {
            entries = dao.getAllTimetableEntries();
        }
        
        List<ClassRoom> classes = cDao.getAllClasses();
        request.setAttribute("entries", entries);
        request.setAttribute("classes", classes);
        request.getRequestDispatcher("view_timetable.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("generate".equals(action)) {
            TimetableGenerator gen = new TimetableGenerator();
            boolean success = gen.generate();
            if (success) {
                response.sendRedirect("timetable?msg=Timetable generated successfully");
            } else {
                response.sendRedirect("timetable?error=Failed to generate. Ensure teachers and subjects are added.");
            }
        }
    }
}
