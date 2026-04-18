package com.timetable.controller;

import com.timetable.dao.SubjectDAO;
import com.timetable.dao.TeacherDAO;
import com.timetable.model.Subject;
import com.timetable.model.Teacher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/subjects")
public class SubjectServlet extends HttpServlet {
    private SubjectDAO dao = new SubjectDAO();
    private TeacherDAO tDao = new TeacherDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            dao.deleteSubject(id);
        }
        List<Subject> list = dao.getAllSubjects();
        List<Teacher> teachers = tDao.getAllTeachers();
        request.setAttribute("subjects", list);
        request.setAttribute("teachers", teachers);
        request.getRequestDispatcher("manage_subjects.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        int teacherId = Integer.parseInt(request.getParameter("teacher_id"));
        Subject s = new Subject();
        s.setName(name);
        s.setTeacherId(teacherId);
        dao.addSubject(s);
        response.sendRedirect("subjects");
    }
}
