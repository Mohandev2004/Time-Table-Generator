package com.timetable.controller;

import com.timetable.dao.ClassDAO;
import com.timetable.model.ClassRoom;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/classes")
public class ClassServlet extends HttpServlet {
    private ClassDAO dao = new ClassDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            dao.deleteClass(id);
        }
        List<ClassRoom> list = dao.getAllClasses();
        request.setAttribute("classes", list);
        request.getRequestDispatcher("manage_classes.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String section = request.getParameter("section");
        String room = request.getParameter("room");
        ClassRoom c = new ClassRoom();
        c.setClassName(name);
        c.setSection(section);
        c.setRoomNo(room);
        dao.addClass(c);
        response.sendRedirect("classes");
    }
}
