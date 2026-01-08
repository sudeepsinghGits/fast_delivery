package com.food.controller;

import java.io.IOException;
import com.food.model.Cart;
import com.food.model.CartItem;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        String action = request.getParameter("action");

        try {
            if ("add".equals(action)) {
                String itemIdStr = request.getParameter("itemId");
                String restIdStr = request.getParameter("restaurantId");
                String name = request.getParameter("name");
                String priceStr = request.getParameter("price");

                if (itemIdStr != null && !itemIdStr.isEmpty() && priceStr != null && !priceStr.isEmpty()) {
                    int itemId = Integer.parseInt(itemIdStr);
                    int restaurantId = Integer.parseInt(restIdStr);
                    int price = (int) Double.parseDouble(priceStr); 
                    
                    CartItem item = new CartItem(itemId, restaurantId, name, 1, price);
                    cart.addItem(item);
                    
                    session.removeAttribute("couponDiscount");
                    session.removeAttribute("couponError");
                }
            } 
            else if ("update".equals(action)) {
                int itemId = Integer.parseInt(request.getParameter("itemId"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                cart.updateItem(itemId, quantity);
                
                session.removeAttribute("couponDiscount");
                session.removeAttribute("couponError");
            } 
            else if ("remove".equals(action)) {
                int itemId = Integer.parseInt(request.getParameter("itemId"));
                cart.removeItem(itemId);
                session.removeAttribute("couponDiscount");
                session.removeAttribute("couponError");
            } 
            // --- MOVED REMOVE COUPON TO ITS OWN SECTION ---
            else if ("removeCoupon".equals(action)) {
                session.removeAttribute("couponDiscount");
                session.removeAttribute("couponError");
            }
            else if ("applyCoupon".equals(action)) {
                String code = request.getParameter("couponCode");
                double itemTotal = cart.getTotalAmount(); 
                double discount = 0.0;
                
                session.removeAttribute("couponError");

                if ("SWIFT50".equals(code)) {
                    discount = Math.min(itemTotal * 0.5, 150.0);
                    session.setAttribute("couponDiscount", discount);
                } 
                else if ("FLAT100".equals(code)) {
                    if (itemTotal >= 400) {
                        discount = 100.0;
                        session.setAttribute("couponDiscount", discount);
                    } else {
                        session.setAttribute("couponError", "FLAT100 requires a minimum order of ₹400.");
                        session.setAttribute("couponDiscount", 0.0);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        response.sendRedirect("cart.jsp");
    }
}
