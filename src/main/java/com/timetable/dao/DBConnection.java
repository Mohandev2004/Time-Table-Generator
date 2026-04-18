package com.timetable.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Singleton class to handle Database Connections
 */
public class DBConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/timetable_db?useSSL=false&allowPublicKeyRetrieval=true";
    private static final String USER = "root";
    private static final String PASSWORD = "root"; // Update with your MySQL password

    private static Connection connection = null;

    public static Connection getConnection() {
        try {
            if (connection == null || connection.isClosed()) {
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection(URL, USER, PASSWORD);
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("DB Connection Error: " + e.getMessage());
            e.printStackTrace();
        }
        return connection;
    }
}
