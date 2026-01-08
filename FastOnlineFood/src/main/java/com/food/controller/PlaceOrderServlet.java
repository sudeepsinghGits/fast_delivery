package com.food.controller;



import java.io.IOException;



import com.food.dao.OrderDAO;

import com.food.model.Cart;

import com.food.model.CartItem;

import com.food.model.Order;

import com.food.model.User;



import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;

import jakarta.servlet.http.HttpServlet;

import jakarta.servlet.http.HttpServletRequest;

import jakarta.servlet.http.HttpServletResponse;

import jakarta.servlet.http.HttpSession;



@WebServlet("/placeOrder")

public class PlaceOrderServlet extends HttpServlet {

protected void doPost(HttpServletRequest request, HttpServletResponse response)

throws ServletException, IOException {


HttpSession session = request.getSession();

Cart cart = (Cart) session.getAttribute("cart");

User user = (User) session.getAttribute("user");



if (cart != null && !cart.getItems().isEmpty()) {

// 1. Get Form Data

String address = request.getParameter("address");

String paymentMode = request.getParameter("paymentMode");


// 2. Determine User ID

int userId;

if (user != null) {

userId = user.getUserId();

} else {

// Check if userId was passed as a hidden parameter from the JSP

String idParam = request.getParameter("userId");

userId = (idParam != null) ? Integer.parseInt(idParam) : 1;

}


// Get restaurantId from the first item in the cart

int restaurantId = cart.getItems().values().iterator().next().getRestaurantId();


// Calculate Total Amount

double totalAmount = 0;

for (CartItem item : cart.getItems().values()) {

totalAmount += item.getPrice() * item.getQuantity();

}



// 3. Create and Save Main Order

Order order = new Order(userId, restaurantId, totalAmount, "Pending", paymentMode, address);

OrderDAO orderDAO = new OrderDAO();


// This saves to the 'orders' table and returns the generated Order ID

int orderId = orderDAO.saveOrder(order);



if (orderId > 0) {

// 4. IMPORTANT: Loop through cart and save individual items

// This prevents the "null" or missing item details issue

for (CartItem item : cart.getItems().values()) {

// You must have this method in your OrderDAO to save to 'order_items' table

orderDAO.saveOrderItem(orderId, item);

}



// 5. Success! Clear the session cart so they can't order twice

session.removeAttribute("cart");

response.sendRedirect("orderSuccess.jsp?id=" + orderId);

} else {

response.sendRedirect("checkout.jsp?error=database_fail");

}

} else {

response.sendRedirect("home.jsp");

}

}

}
