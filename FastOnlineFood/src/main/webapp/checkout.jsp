<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.food.model.Cart, com.food.model.CartItem, java.util.Map" %>
<!DOCTYPE html>
<html>
<head>
    <title>Checkout - Sudeep's Swift Bites</title>
    <style>
        /* Matching your cart's theme */
        body { background-color: #f2f3f7; font-family: 'Segoe UI', sans-serif; margin: 0; }
        .header { background: white; padding: 15px; text-align: center; font-weight: bold; box-shadow: 0 2px 5px rgba(0,0,0,0.05); }
        .checkout-box { width: 90%; max-width: 450px; margin: 30px auto; background: white; padding: 25px; border-radius: 12px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); }
        
        .summary-row { display: flex; justify-content: space-between; margin-bottom: 20px; padding-bottom: 10px; border-bottom: 1px solid #eee; }
        label { font-size: 11px; font-weight: 800; color: #888; text-transform: uppercase; }
        
        textarea, select { width: 100%; margin: 10px 0 20px 0; padding: 12px; border: 1px solid #ccc; border-radius: 8px; box-sizing: border-box; font-family: inherit; }
        .confirm-btn { background: #00b060; color: white; border: none; width: 100%; padding: 15px; border-radius: 8px; font-size: 16px; font-weight: bold; cursor: pointer; transition: 0.3s; }
        .confirm-btn:hover { background: #008f4f; }
        .back-link { display: block; text-align: center; margin-top: 15px; color: #fc8019; text-decoration: none; font-size: 14px; font-weight: bold; }
    </style>
</head>
<body>
    <div class="header">Sudeep's Swift Bites - Checkout</div>

    <div class="checkout-box">
        <% 
            Cart cart = (Cart) session.getAttribute("cart");
            double totalToPay = 0.0;
            
            if(cart != null && !cart.getItems().isEmpty()) { 
                // Manual calculation to replace the missing getTotalAmount() method
                for (CartItem item : cart.getItems().values()) {
                    totalToPay += (item.getPrice() * item.getQuantity());
                }
        %>
            <div class="summary-row">
                <span>Total Amount to Pay:</span>
                <strong style="font-size: 18px; color: #333;">₹<%= String.format("%.2f", totalToPay) %></strong>
            </div>

            <form action="placeOrder" method="post">
                <input type="hidden" name="userId" value="<%= (session.getAttribute("user") != null) ? ((com.food.model.User)session.getAttribute("user")).getUserId() : "1" %>">
                
                <input type="hidden" name="totalAmount" value="<%= totalToPay %>">

                <label>Delivery Address</label>
                <textarea name="address" required rows="3" placeholder="Flat No, Building Name, Street, Landmark..."></textarea>
                
                <label>Payment Method</label>
                <select name="paymentMode">
                    <option value="COD">Cash on Delivery</option>
                    <option value="UPI">UPI / Online</option>
                    <option value="CARD">Credit/Debit Card</option>
                </select>
                
                <button type="submit" class="confirm-btn">Place Order</button>
            </form>
        <% } else { %>
            <div style="text-align: center;">
                <p>Your cart is empty!</p>
                <a href="home" style="color: #fc8019; font-weight: bold; text-decoration: none;">Go back to Menu</a>
            </div>
        <% } %>
        
        <a href="cart.jsp" class="back-link">← Edit Cart / Change Coupon</a>
    </div>
</body>
</html>