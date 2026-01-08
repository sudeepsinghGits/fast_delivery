package com.food.utility;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    // 1. Database details (Change 'root' to your actual MySQL password)
    private static final String URL = "jdbc:mysql://localhost:3306/fast_delivery_db";
    private static final String USER = "root";
    private static final String PASS = "root123"; 

    public static Connection getConnection() {
        Connection con = null;
        try {
            // 2. Load the MySQL Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            // 3. Establish connection
            con = DriverManager.getConnection(URL, USER, PASS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}