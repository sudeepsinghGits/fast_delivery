<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="confirmation-card">
    <div class="success-icon">✔</div>
    
    <h2>Order Confirmed!</h2>
    <p class="message">Thank you for your order. We've received it and are preparing your food.</p>
    
    <div class="order-details">
        <span>Order ID:</span>
       <span class="order-id">${orderId}</span>
<span class="order-id">#${param.id}</span>
    </div>

    <button onclick="location.href='home'" class="home-btn">BACK TO HOME</button>
</div>

<style>
    .confirmation-card {
        text-align: center;
        padding: 50px;
        font-family: 'Poppins', sans-serif;
    }
    .success-icon {
        background: #60b246; /* Swiggy Green */
        color: white;
        width: 80px;
        height: 80px;
        line-height: 80px;
        border-radius: 50%;
        font-size: 40px;
        margin: 0 auto 20px;
    }
    .order-details {
        background: #f4f4f5;
        display: inline-block;
        padding: 10px 20px;
        border-radius: 8px;
        margin: 20px 0;
        font-weight: 600;
    }
    .order-id {
        color: #fc8019; /* Swiggy Orange */
        margin-left: 5px;
    }
    .home-btn {
        background: #fc8019;
        color: white;
        border: none;
        padding: 15px 30px;
        font-weight: bold;
        cursor: pointer;
        margin-top: 20px;
    }
</style>
</body>
</html>