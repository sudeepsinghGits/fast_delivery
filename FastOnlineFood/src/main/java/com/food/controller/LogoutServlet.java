package com.food.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 1. Get the current session without creating a new one
        HttpSession session = request.getSession(false);
        
        if (session != null) {
            // 2. Destroy the session (clears cart, user data, etc.)
            session.invalidate();
        }
        
        // 3. Redirect to login or home page with a logout message
        response.sendRedirect("login.jsp?message=Logged out successfully");
    }
}
