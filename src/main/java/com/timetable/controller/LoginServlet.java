package com.timetable.controller;

import com.timetable.dao.UserDAO;
import com.timetable.model.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = request.getParameter("username");
        String pass = request.getParameter("password");
        
        UserDAO dao = new UserDAO();
        User loggedInUser = dao.validateUser(user, pass);
        
        if (loggedInUser != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", loggedInUser);
            response.sendRedirect("dashboard");
        } else {
            request.setAttribute("error", "Invalid username or password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
