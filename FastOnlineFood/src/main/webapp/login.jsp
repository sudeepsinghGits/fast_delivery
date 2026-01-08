<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login - Swift Bites</title>
<style>
    :root {
        --swiggy-orange: #fc8019;
        --text-dark: #282c3f;
        --text-gray: #7e808c;
        --border-gray: #d4d5d9;
    }

    body {
        font-family: 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
        background-color: #f0f0f0; /* Light background to make card pop */
        margin: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .login-container {
        background-color: white;
        width: 100%;
        max-width: 450px;
        padding: 40px;
        box-shadow: 0 4px 20px rgba(0,0,0,0.1);
        position: relative;
    }

    .close-btn {
        position: absolute;
        top: 20px;
        left: 20px;
        font-size: 24px;
        color: var(--text-dark);
        text-decoration: none;
        cursor: pointer;
    }

    .header-section {
        display: flex;
        justify-content: space-between;
        align-items: flex-start;
        margin-top: 20px;
        margin-bottom: 40px;
    }

    .header-text h2 {
        margin: 0;
        font-size: 30px;
        font-weight: 600;
        color: var(--text-dark);
    }

    .header-text p {
        margin: 10px 0 0 0;
        font-size: 14px;
        color: var(--text-dark);
    }

    .header-text a {
        color: var(--swiggy-orange);
        text-decoration: none;
        font-weight: 500;
    }

    .header-image img {
        width: 100px; /* Matching the wrap/food icon in your image */
        height: auto;
    }

    /* Input Field Styling */
    .input-group {
        position: relative;
        margin-bottom: 0; /* Removing gaps to stack fields like the image */
    }

    .input-group input {
        width: 100%;
        padding: 25px 0 10px 15px;
        font-size: 16px;
        border: 1px solid var(--border-color, var(--border-gray));
        border-bottom: none; /* Stacking effect */
        box-sizing: border-box;
        outline: none;
        color: var(--text-dark);
    }

    /* Top-round for first input, bottom-round for last */
    .input-group:first-of-type input {
        border-radius: 4px 4px 0 0;
    }

    .input-group:last-of-type input {
        border-bottom: 1px solid var(--border-gray);
        border-radius: 0 0 0 0; 
        margin-bottom: 20px;
    }

    /* Floating Labels */
    .input-group label {
        position: absolute;
        top: 20px;
        left: 15px;
        color: var(--text-gray);
        font-size: 16px;
        transition: 0.2s ease all;
        pointer-events: none;
    }

    /* Label animation on focus or if input is not empty */
    .input-group input:focus ~ label,
    .input-group input:not(:placeholder-shown) ~ label {
        top: 8px;
        font-size: 12px;
        color: var(--text-gray);
    }

    .login-btn {
        width: 100%;
        background-color: var(--swiggy-orange);
        color: white;
        border: none;
        padding: 15px;
        font-size: 14px;
        font-weight: 700;
        text-transform: uppercase;
        cursor: pointer;
        margin-top: 10px;
        box-shadow: 0 1px 3px rgba(0,0,0,0.2);
    }

    .terms {
        font-size: 12px;
        color: var(--text-gray);
        margin-top: 15px;
        line-height: 1.4;
    }

    .success-msg {
        color: #2e7d32;
        background: #e8f5e9;
        padding: 10px;
        font-size: 13px;
        margin-bottom: 20px;
        border-radius: 4px;
    }
</style>
</head>
<body>

<div class="login-container">
    <a href="home" class="close-btn">✕</a>

    <div class="header-section">
        <div class="header-text">
            <h2>Login</h2>
            <p>or <a href="register.jsp">create an account</a></p>
        </div>
        <div class="header-image">
            <img src="https://overweight-mules.000webhostapp.com/food-icon.png" alt="Food Icon" 
                 onerror="this.src='https://cdn-icons-png.flaticon.com/512/3075/3075977.png'">
        </div>
    </div>

    <% if(request.getAttribute("success") != null) { %>
        <div class="success-msg">Registration successful! Please login below.</div>
    <% } %>

    <form action="login" method="post">
        <div class="input-group">
            <input type="email" name="email" id="email" placeholder=" " required>
            <label for="email">Email</label>
        </div>
        
        <div class="input-group">
            <input type="password" name="password" id="password" placeholder=" " required>
            <label for="password">Password</label>
        </div>

        <button type="submit" class="login-btn">Login</button>
    </form>

    <div class="terms">
        By clicking on Login, I accept the <span style="font-weight:600; color:#282c3f;">Terms & Conditions & Privacy Policy</span>
    </div>
</div>

</body>
</html>