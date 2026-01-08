<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.food.model.User" %>
<%@ page import="com.food.model.Restaurant" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Swift Bites - Order Food Online</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    
    <style>
        :root {
            --swiggy-orange: #fc8019;
            --text-dark: #282c3f;
            --text-gray: #686b78;
            --nav-shadow: 0 15px 40px -20px rgba(40,44,63,.15);
        }

        body { 
            font-family: 'Poppins', sans-serif; 
            margin: 0; 
            background-color: #fff; 
            color: var(--text-dark);
            overflow-x: hidden;
        }

        /* --- 1. Splash Screen Styling --- */
        #loading-overlay {
            position: fixed;
            top: 0; left: 0;
            width: 100%; height: 100vh;
            background-color: var(--swiggy-orange);
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            z-index: 9999;
            transition: opacity 0.6s ease, visibility 0.6s;
        }
        
        .swiggy-logo-splash { 
            width: 200px; 
            animation: popAndPulse 1.5s infinite ease-in-out; 
        }

        @keyframes popAndPulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.1); }
        }

        /* --- 2. Content Visibility --- */
        #home-page-content {
            display: block; /* Content is ready in background */
            opacity: 0;    /* But invisible until splash fades */
            transition: opacity 0.5s ease;
        }

        /* --- Navigation & Grid Styling --- */
        .navbar { 
            background: #fff; padding: 0 10%; height: 80px;
            display: flex; justify-content: space-between; align-items: center; 
            box-shadow: var(--nav-shadow); position: sticky; top: 0; z-index: 100;
        }
        .logo-brand { height: 45px; cursor: pointer; }
        .nav-right { display: flex; gap: 35px; }
        .nav-right a { color: var(--text-dark); text-decoration: none; font-weight: 500; cursor: pointer; }

        .restaurant-container { 
            display: grid; grid-template-columns: repeat(auto-fill, minmax(280px, 1fr)); 
            gap: 32px; padding: 30px 10%; margin: 0 auto; 
        }
        .restaurant-card { background: white; border-radius: 16px; overflow: hidden; transition: 0.2s; text-decoration: none; color: inherit; border: 1px solid #f2f2f2; }
        .restaurant-card:hover { transform: scale(0.98); box-shadow: 0 4px 15px rgba(0,0,0,0.1); }
        .image-container { position: relative; width: 100%; height: 180px; overflow: hidden; }
        .restaurant-card img { width: 100%; height: 100%; object-fit: cover; }
        .card-body { padding: 15px; }
        .res-name { margin: 0; font-size: 18px; font-weight: 600; }

        /* Search Overlay */
        .search-page-overlay {
            position: fixed; top: 0; left: 0; width: 100%; height: 100%;
            background: white; z-index: 2000; display: none; overflow-y: auto;
        }
        .search-container-full { width: 50%; margin: 40px auto; max-width: 800px; }
        .search-header-row { border: 1px solid #bebfc5; padding: 12px 20px; display: flex; align-items: center; gap: 15px; }
        .search-back-btn { cursor: pointer; font-size: 22px; border:none; background:none; }
        #main-search-input { flex: 1; border: none; outline: none; font-size: 16px; }
    </style>
</head>
<body>

    <div id="loading-overlay">
        <img src="${pageContext.request.contextPath}/images/logo2.png" class="swiggy-logo-splash" alt="Logo">
        <h2 style="color: white; margin-top: 20px; font-weight: 600;">Sudeep's Swift Bites</h2>
    </div>

    <div id="search-overlay" class="search-page-overlay">
        <div class="search-container-full">
            <div class="search-header-row">
                <button class="search-back-btn" onclick="document.getElementById('search-overlay').style.display='none'">←</button>
                <input type="text" id="main-search-input" placeholder="Search for restaurants..">
            </div>
            <div style="margin-top: 30px;">
                <p style="color: var(--text-gray); font-size: 13px; font-weight: 700;">POPULAR RESTAURANTS</p>
                <div id="suggestion-list">
    <%
        List<Restaurant> list = (List<Restaurant>) request.getAttribute("restaurantList");
        if (list != null) {
            for (Restaurant r : list) {
    %>
        <a href="menu?restaurantId=<%= r.getRestaurantId() %>" 
           style="text-decoration: none; color: inherit; display: block;">
            <div class="suggestion-item" style="display:flex; align-items:center; padding:10px; gap:10px; border-bottom:1px solid #eee;">
                <img src="${pageContext.request.contextPath}/<%= r.getImagePath() %>" 
                     style="width:40px; height:40px; object-fit:cover; border-radius:4px;">
                <span style="font-weight:600;"><%= r.getName() %></span>
            </div>
        </a>
    <%
            }
        }
    %>
</div>
            </div>
        </div>
    </div>

    <div id="home-page-content">
        <nav class="navbar">
            <div class="nav-left">
                <img src="${pageContext.request.contextPath}/images/logo2.png" class="logo-brand" alt="Swift Bites">
                <span onclick="document.getElementById('search-overlay').style.display='block'" style="font-size: 13px; font-weight: 600; cursor: pointer;">
                    Location <span style="color:var(--swiggy-orange)">▼</span>
                </span>
            </div>
            <div class="nav-right">
                <a onclick="document.getElementById('search-overlay').style.display='block'">Search</a>
                <a href="cart.jsp">Cart</a>
                <% if(session.getAttribute("loggedInUser") == null) { %>
                    <a href="login.jsp">Sign In</a>
                <% } else { %>
<a href="logout" ; font-weight: bold;">Logout</a>                <% } %>
            </div>
        </nav>

        <div style="padding: 40px 10% 20px 10%;">
            <h2 style="font-size: 24px; font-weight: 600;">Restaurants for you</h2>
        </div>

        <div class="restaurant-container">
            <%
                if (list != null && !list.isEmpty()) {
                    for (Restaurant r : list) {
            %>
                <a href="menu?restaurantId=<%= r.getRestaurantId() %>" class="restaurant-card">
                    <div class="image-container">
                        <img src="${pageContext.request.contextPath}/<%= r.getImagePath() %>" alt="<%= r.getName() %>">
                    </div>
                    <div class="card-body">
                        <h3 class="res-name"><%= r.getName() %></h3>
                        <p style="color: var(--text-gray); font-size: 14px;"><%= r.getCuisineType() %></p>
                        <div style="font-size: 14px; font-weight: 600;">
                            <span style="color: #28a745;">⭐ <%= r.getRating() %></span> • <%= r.getDeliveryTime() %> mins
                        </div>
                    </div>
                </a>
            <%
                    }
                } else {
            %>
                <p style="padding: 20px 10%;">No restaurants found in database.</p>
            <% } %>
        </div>
    </div>

    <script>
        window.addEventListener('load', function() {
            const splash = document.getElementById('loading-overlay');
            const content = document.getElementById('home-page-content');
            
            // Give it a small delay so the user sees the animation (1 second)
            setTimeout(() => {
                splash.style.opacity = '0';
                splash.style.visibility = 'hidden';
                content.style.opacity = '1';
            }, 1000);
        });
    </script>

</body>
</html>
