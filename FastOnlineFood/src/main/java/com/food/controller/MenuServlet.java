package com.food.controller;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.food.daoimpl.MenuDAOImpl;
import com.food.model.Menu;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            // 1. Get the restaurantId from the link clicked in home.jsp
            int restaurantId = Integer.parseInt(request.getParameter("restaurantId"));
            
            // 2. Fetch the menu items using the DAO
            MenuDAOImpl menuDAO = new MenuDAOImpl();
            List<Menu> menuList = menuDAO.getMenuByRestaurant(restaurantId);
            
            // 3. Attach the list to the request so the JSP can see it
            request.setAttribute("menuList", menuList);
            
            // 4. Send the user to the menu.jsp page
            request.getRequestDispatcher("menu.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("home"); // Redirect to home if something goes wrong
        }
    }
}