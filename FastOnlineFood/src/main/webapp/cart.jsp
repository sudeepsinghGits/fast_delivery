<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.food.model.Cart, com.food.model.CartItem, java.util.Map" %>

<% 
    Cart cart = (Cart) session.getAttribute("cart");
    
    // 1. Get restaurantId from the first item in the cart to fix the "Add more" link
    Integer currentRestId = null;
    if (cart != null && !cart.getItems().isEmpty()) {
        currentRestId = cart.getItems().values().iterator().next().getRestaurantId();
    }

    Object discountAttr = session.getAttribute("couponDiscount");
    double discount = (discountAttr != null) ? (Double) discountAttr : 0.0;
    
    double subtotal = (cart != null) ? cart.getTotalAmount() : 0.0;
    double delivery = 25.0;
    double totalToPay = (subtotal > 0) ? (subtotal - discount + delivery) : 0.0;
%>

<!DOCTYPE html>
<html>
<head>
    <title>Sudeep's Swift Bites - Cart</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        :root { --swiggy-orange: #fc8019; --swiggy-green: #60b246; --text-dark: #282c3f; --bg-light: #f1f3f6; }
        body { background-color: var(--bg-light); font-family: 'Poppins', sans-serif; padding: 20px; color: var(--text-dark); }
        .app-container { max-width: 450px; margin: 0 auto; background: #fff; border-radius: 24px; padding: 20px; box-shadow: 0 10px 40px rgba(0,0,0,0.08); }
        
        .savings-header { 
            background: #e7f6e7; 
            color: var(--swiggy-green); 
            padding: 10px; 
            border-radius: 12px; 
            font-size: 13px; 
            font-weight: 700; 
            text-align: center; 
            margin-bottom: 15px; 
            display: <%= (discount > 0) ? "block" : "none" %>; 
        }
        
        .card { background: #fff; border: 1px solid #f2f2f2; border-radius: 16px; padding: 15px; margin-bottom: 15px; }
        .qty-box { display: flex; align-items: center; border: 1px solid #d4d5d9; border-radius: 8px; width: fit-content; margin-top: 8px; }
        .qty-btn { background: none; border: none; color: var(--swiggy-green); font-weight: bold; cursor: pointer; padding: 2px 10px; font-size: 18px; }
        .pay-btn { background: var(--swiggy-green); color: #fff; width: 100%; border: none; padding: 16px; border-radius: 12px; font-weight: 700; font-size: 16px; margin-top: 20px; cursor: pointer; text-decoration: none; display: block; text-align: center; }
        
        #couponModal { display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.5); z-index: 1000; align-items: center; justify-content: center; }
        .modal-box { background: #fff; width: 90%; max-width: 380px; border-radius: 20px; padding: 20px; }
    </style>
</head>
<body>

<div class="app-container">
    <div style="text-align: center; font-weight: 700; font-size: 18px; margin-bottom: 20px;">Sudeep's Swift Bites</div>

    <div class="savings-header">
        🎉 ₹<%= String.format("%.0f", discount) %> saved! On this order
    </div>

    <div style="font-size: 11px; font-weight: 800; color: #7e808c; text-transform: uppercase; margin-bottom: 10px;">YOUR ITEMS</div>
    <div class="card">
        <% if(cart != null && !cart.getItems().isEmpty()) { 
            for (CartItem item : cart.getItems().values()) { %>
            <div style="display: flex; justify-content: space-between; margin-bottom: 15px; border-bottom: 1px solid #f9f9f9; padding-bottom: 10px;">
                <div>
                    <div style="font-weight: 600; font-size: 15px;"><%= item.getName() %></div>
                    
                    <div class="qty-box">
                        <form action="cart" method="post" style="margin:0;">
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
                            <input type="hidden" name="quantity" value="<%= item.getQuantity() - 1 %>">
                            <button type="submit" class="qty-btn">-</button>
                        </form>
                        <span style="font-size: 14px;"><%= item.getQuantity() %></span>
                        <form action="cart" method="post" style="margin:0;">
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
                            <input type="hidden" name="quantity" value="<%= item.getQuantity() + 1 %>">
                            <button type="submit" class="qty-btn">+</button>
                        </form>
                    </div>
                </div>
                <div style="text-align: right;">
                    <form action="cart" method="post">
                        <input type="hidden" name="action" value="remove">
                        <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
                        <button type="submit" style="color:#ff4d4d; border:none; background:none; font-size:11px; cursor:pointer; font-weight:600;">Remove</button>
                    </form>
                    <div style="font-weight: 700; margin-top: 12px; font-size: 15px;">₹<%= item.getPrice() * item.getQuantity() %></div>
                </div>
            </div>
        <% } } else { %>
            <div style="text-align: center; padding: 20px; color: #7e808c;">Cart is empty</div>
        <% } %>
        
        <% if (currentRestId != null) { %>
            <a href="menu?restaurantId=<%= currentRestId %>" style="color: var(--swiggy-orange); font-size: 12px; font-weight: 700; text-decoration: none;">+ Add more items</a>
        <% } else { %>
            <a href="home" style="color: var(--swiggy-orange); font-size: 12px; font-weight: 700; text-decoration: none;">+ Browse Restaurants</a>
        <% } %>
    </div>

    <div style="font-size: 11px; font-weight: 800; color: #7e808c; margin-bottom: 10px;">SAVINGS CORNER</div>
    <div class="card" style="display: flex; justify-content: space-between; align-items: center;">
        <div style="display: flex; align-items: center;">
            <img src="https://cdn-icons-png.flaticon.com/512/879/879859.png" width="18" style="margin-right: 10px;">
            <span style="font-size: 13px; font-weight: 700; color: <%= (discount > 0) ? "var(--swiggy-green)" : "#282c3f" %>;">
                <%= (discount > 0) ? "₹" + String.format("%.0f", discount) + " saved!" : "Apply Coupon" %>
            </span>
        </div>
        
        <div style="display: flex; gap: 12px; align-items: center;">
            <% if (discount > 0) { %>
                <form action="cart" method="post" style="margin:0;">
                    <input type="hidden" name="action" value="removeCoupon">
                    <button type="submit" style="color: #ff4d4d; font-weight: 700; font-size: 12px; cursor: pointer; text-transform: uppercase; background: none; border: none; padding: 0;">Remove</button>
                </form>
            <% } %>
            <span style="color: var(--swiggy-orange); font-weight: 700; font-size: 12px; cursor: pointer; text-transform: uppercase;" onclick="document.getElementById('couponModal').style.display='flex'">
                <%= (discount > 0) ? "Change" : "View Offers" %>
            </span>
        </div>
    </div>

    <div style="font-size: 11px; font-weight: 800; color: #7e808c; margin-bottom: 10px;">BILL DETAILS</div>
    <div class="card">
        <div style="display: flex; justify-content: space-between; margin-bottom: 8px; font-size: 14px;"><span>Item Total</span><span>₹<%= subtotal %></span></div>
        <% if(discount > 0) { %>
            <div style="display: flex; justify-content: space-between; margin-bottom: 8px; font-size: 14px; color: var(--swiggy-green);">
                <span>Coupon Discount</span><span>-₹<%= discount %></span>
            </div>
        <% } %>
        <div style="display: flex; justify-content: space-between; margin-bottom: 8px; font-size: 14px;"><span>Delivery Fee</span><span>₹25.0</span></div>
        <div style="display: flex; justify-content: space-between; font-weight: 800; border-top: 1px solid #f2f2f2; padding-top: 10px; font-size: 16px; margin-top: 5px;">
            <span>To Pay</span><span>₹<%= totalToPay %></span>
        </div>
    </div>

    <button class="pay-btn" onclick="location.href='checkout.jsp'">Proceed to Pay</button>
</div>

<div id="couponModal">
    <div class="modal-box">
        <div style="display: flex; justify-content: space-between; margin-bottom: 20px;">
            <span style="font-weight:700; font-size: 16px;">Available Offers</span>
            <span onclick="document.getElementById('couponModal').style.display='none'" style="cursor:pointer; font-size: 20px;">&times;</span>
        </div>

        <form action="cart" method="post" style="border: 1px dashed var(--swiggy-orange); padding: 15px; border-radius: 12px; cursor: pointer; margin-bottom: 15px;" onclick="this.submit()">
            <input type="hidden" name="action" value="applyCoupon">
            <input type="hidden" name="couponCode" value="SWIFT50">
            <div style="font-weight:700; color:var(--swiggy-orange); font-size: 15px;">SWIFT50</div>
            <div style="font-size:12px; color: #7e808c;">50% OFF up to ₹150</div>
            <div style="color: var(--swiggy-green); font-weight: 700; font-size: 11px; margin-top: 8px;">TAP TO APPLY</div>
        </form>

        <form action="cart" method="post" style="border: 1px dashed #60b246; padding: 15px; border-radius: 12px; cursor: pointer;" onclick="this.submit()">
            <input type="hidden" name="action" value="applyCoupon">
            <input type="hidden" name="couponCode" value="FLAT100">
            <div style="font-weight:700; color:#60b246; font-size: 15px;">FLAT100</div>
            <div style="font-size:12px; color: #7e808c;">Flat ₹100 OFF on orders above ₹400</div>
            <% if (subtotal < 400) { %>
                <div style="color: #ff4d4d; font-weight: 700; font-size: 11px; margin-top: 8px;">NOT ELIGIBLE (Add ₹<%= 400 - subtotal %> more)</div>
            <% } else { %>
                <div style="color: var(--swiggy-green); font-weight: 700; font-size: 11px; margin-top: 8px;">TAP TO APPLY</div>
            <% } %>
        </form>
    </div>
</div>

</body>
</html>