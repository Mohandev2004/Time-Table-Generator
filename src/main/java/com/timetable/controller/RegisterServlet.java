package com.timetable.controller;

import com.timetable.dao.UserDAO;
import com.timetable.model.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = request.getParameter("username");
        String pass = request.getParameter("password");
        
        User newUser = new User(user, pass);
        UserDAO dao = new UserDAO();
        
        if (dao.registerUser(newUser)) {
            response.sendRedirect("login?msg=Registration successful");
        } else {
            request.setAttribute("error", "Registration failed. Username may already exist.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}
