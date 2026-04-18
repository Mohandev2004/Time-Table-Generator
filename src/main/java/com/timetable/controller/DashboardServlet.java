package com.timetable.controller;

import com.timetable.dao.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login");
            return;
        }

        TeacherDAO tDao = new TeacherDAO();
        SubjectDAO sDao = new SubjectDAO();
        ClassDAO cDao = new ClassDAO();

        request.setAttribute("teacherCount", tDao.getAllTeachers().size());
        request.setAttribute("subjectCount", sDao.getAllSubjects().size());
        request.setAttribute("classCount", cDao.getAllClasses().size());

        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
    }
}
