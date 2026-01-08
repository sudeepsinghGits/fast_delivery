package com.food.controller;

import java.io.IOException;
import java.util.List;

import com.food.dao.RestaurantDAO;
import com.food.daoimpl.RestaurantDAOImpl;
import com.food.model.Restaurant;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/home") // This is the URL you will type in the browser
public class HomeServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 1. Create the DAO object
        RestaurantDAO restaurantDAO = new RestaurantDAOImpl();
        
        // 2. Fetch the list from the database
        List<Restaurant> restaurantList = restaurantDAO.getAllRestaurants();
        
        // 3. Store the list in the request object (the JSP will look for "restaurantList")
        request.setAttribute("restaurantList", restaurantList);
        
        // 4. Forward the request to home.jsp
        RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
        rd.forward(request, response);
    }
}