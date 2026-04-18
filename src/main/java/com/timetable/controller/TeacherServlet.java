package com.timetable.controller;

import com.timetable.dao.TeacherDAO;
import com.timetable.model.Teacher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/teachers")
public class TeacherServlet extends HttpServlet {
    private TeacherDAO dao = new TeacherDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            dao.deleteTeacher(id);
        }
        List<Teacher> list = dao.getAllTeachers();
        request.setAttribute("teachers", list);
        request.getRequestDispatcher("manage_teachers.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        Teacher t = new Teacher(0, name, email);
        dao.addTeacher(t);
        response.sendRedirect("teachers");
    }
}
