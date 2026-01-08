package com.food.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.food.daoimpl.UserDAOImpl;
import com.food.model.User;

@WebServlet("/login") 
public class LoginServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 1. Get credentials from login.jsp
        // Ensure these "name" attributes match your <input name="..."> in JSP
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        
        // 2. Use your DAO to find the user by email
        UserDAOImpl dao = new UserDAOImpl();
        User user = dao.getUser(email,pass); // Fetch user record
        
        // 3. Validate user and check password
        if (user != null && user.getPassword().equals(pass)) {
            // SUCCESS: Create a session
            HttpSession session = request.getSession();
            session.setAttribute("loggedInUser", user);
            
            // Go to the HomeServlet (mapped to /home)
            response.sendRedirect("home");
        } else {
            // FAILURE: Return to login with error
            response.sendRedirect("login.jsp?error=invalid");
        }
    }
}