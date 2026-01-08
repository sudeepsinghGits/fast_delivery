package com.food.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.food.daoimpl.UserDAOImpl;
import com.food.model.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 1. Get data from the JSP form
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String role = "customer"; // Default role

        // 2. Create User object
        User user = new User(0, name, username, password, email, phone, address, role);
        
        // 3. Call DAO to save to Database
        UserDAOImpl dao = new UserDAOImpl();
        int result = dao.addUser(user);
        
        // 4. Redirect based on success or failure
        if(result > 0) {
            response.sendRedirect("login.jsp?msg=success");
        } else {
            response.sendRedirect("register.jsp?msg=failed");
        }
    }
}