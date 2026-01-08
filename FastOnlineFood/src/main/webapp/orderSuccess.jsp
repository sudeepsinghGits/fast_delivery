<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="text-align:center; padding:50px;">
    <h1>🎉 Order Confirmed!</h1>
    <p>Thank you for your order. Your Order ID is: <strong>#<%= request.getParameter("id") %></strong></p>
   <a href="home">Back to Home</a>
</div>
</body>
</html>