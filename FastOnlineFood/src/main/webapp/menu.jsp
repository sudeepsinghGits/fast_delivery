<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.food.model.Menu" %>
<!DOCTYPE html>
<html>
<head>
    <title>Menu - Swift Bites</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
    :root {
        --swiggy-orange: #fc8019;
        --swiggy-green: #60b246;
        --text-main: #282c3f; /* Swiggy dark text */
        --text-light: #686b78;
        --bg-color: #ffffff;
        --border-color: #e9e9eb;
    }

    body { 
        font-family: 'Poppins', sans-serif; 
        background-color: var(--bg-color);
        margin: 0; 
        color: var(--text-main);
        -webkit-font-smoothing: antialiased;
    }

    .header-nav {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 0 10%;
        height: 80px;
        box-shadow: 0 15px 40px -20px rgba(40,44,63,.15);
        position: sticky;
        top: 0;
        background: #fff;
        z-index: 1000;
    }

    .logo-img { height: 45px; cursor: pointer; }

    .menu-container {
        max-width: 800px; /* Menus are usually narrower/centered in food apps */
        margin: 0 auto;
        padding: 40px 20px;
    }

    .dish-card { 
        display: flex;
        justify-content: space-between;
        padding: 30px 0;
        border-bottom: 0.5px solid #d3d3d3;
        background: #fff;
        align-items: flex-start;
    }

    .dish-info { flex: 1; padding-right: 20px; }

    /* The Dot icon for Veg */
    .veg-icon {
        width: 14px;
        height: 14px;
        border: 1px solid #0f8a65;
        display: flex;
        align-items: center;
        justify-content: center;
        margin-bottom: 8px;
        border-radius: 2px;
    }
    .veg-icon:after {
        content: '';
        width: 7px;
        height: 7px;
        background: #0f8a65;
        border-radius: 50%;
    }

    .item-name { font-size: 1.15rem; font-weight: 600; margin: 0 0 4px 0; color: #3e4152; }
    .item-price { font-size: 1rem; font-weight: 500; margin-bottom: 12px; color: #3e4152;}
    .item-desc { font-size: 0.9rem; color: rgba(40, 44, 63, 0.45); line-height: 1.3; font-weight: 300; }

    .dish-image-wrapper {
        position: relative;
        width: 156px;
        height: 144px;
    }

    .dish-img { 
        width: 118px; 
        height: 96px; 
        object-fit: cover; 
        border-radius: 12px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        margin-left: 19px;
    }

    /* Modern Swiggy ADD Button centered over image bottom */
    .swiggy-add-btn { 
        position: absolute;
        bottom: 25px; 
        left: 50%;
        transform: translateX(-50%);
        background-color: white; 
        color: var(--swiggy-green);
        border: 1px solid #d4d5d9;
        width: 96px;
        height: 36px;
        font-weight: 700;
        cursor: pointer; 
        border-radius: 8px; 
        box-shadow: 0 3px 8px rgba(0,0,0,0.15);
        font-size: 0.85rem;
        z-index: 10;
        text-transform: uppercase;
        transition: 0.2s;
    }

    .swiggy-add-btn:hover {
        background-color: #f2f2f2;
    }

    .qty-controls {
        position: absolute;
        bottom: 0px;
        left: 50%;
        transform: translateX(-50%);
        display: flex;
        align-items: center;
        background: #f9f9f9;
        border-radius: 4px;
        border: 1px solid #ccc;
    }

    .qty-input {
        width: 35px;
        text-align: center;
        border: none;
        background: transparent;
        font-weight: 600;
        font-family: 'Poppins', sans-serif;
    }

    .qty-label {
        font-size: 10px;
        color: var(--text-light);
        display: block;
        text-align: center;
        margin-top: 5px;
    }

    @media (max-width: 600px) {
        .menu-container { padding: 20px; }
        .dish-card { flex-direction: row; }
    }
</style>
</head>
<body>

    <header class="header-nav">
        <div class="logo-section">
            <a href="home">
                <img src="${pageContext.request.contextPath}/images/logo2.png" class="logo-img" alt="Swift Bites Logo">
            </a>
        </div>
        <div class="nav-links">
            <a href="home" style="text-decoration: none; color: var(--text-main); font-weight: 600; font-size: 14px; letter-spacing: -0.3px;">RESTAURANTS</a>
        </div>
    </header>

    <div class="menu-container">
    <%
        List<Menu> menuList = (List<Menu>) request.getAttribute("menuList");
        if (menuList != null && !menuList.isEmpty()) {
            for (Menu item : menuList) {
    %>
        <div class="dish-card">
            <div class="dish-info">
                <div class="veg-icon"></div>
                <h3 class="item-name"><%= item.getItemName() %></h3>
                <div class="item-price">₹<%= item.getPrice() %></div>
                <p class="item-desc"><%= item.getDescription() != null ? item.getDescription() : "Freshly prepared delicious " + item.getItemName() %></p>
            </div>

            <div class="dish-image-wrapper">
                <img src="${pageContext.request.contextPath}/<%= item.getImagePath() %>" 
                     alt="<%= item.getItemName() %>" 
                     class="dish-img">
                
               <form action="cart" method="post">
    <input type="hidden" name="action" value="add">
    
    <input type="hidden" name="itemId" value="<%= item.getMenuId() %>">                   
    
    <input type="hidden" name="name" value="<%= item.getItemName() %>">
    
    <input type="hidden" name="price" value="<%= item.getPrice() %>">  
    
    <input type="hidden" name="restaurantId" value="<%= item.getRestaurantId() %>">                  
    
    <button type="submit" class="swiggy-add-btn">ADD</button>
    
    <div class="qty-controls">
        <span style="padding: 0 5px; font-size: 10px; color: #686b78;">QTY</span>
        <input type="number" name="quantity" value="1" min="1" class="qty-input">
    </div>
</form>
            </div>
        </div>
    <% 
            }
        } else {
    %>
        <div style="text-align: center; padding: 50px;">
            <h2>No menu items found for this restaurant.</h2>
            <a href="home" style="color: var(--swiggy-orange);">Go back to restaurants</a>
        </div>
    <% } %>
    </div>

</body>
</html>