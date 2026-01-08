<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Fast Online Food - Register</title>
</head>
<body>
    <h2>Create an Account</h2>
    <form action="register" method="post">
        Name: <input type="text" name="name" required><br><br>
        Username: <input type="text" name="username" required><br><br>
        Password: <input type="password" name="password" required><br><br>
        Email: <input type="email" name="email" required><br><br>
        Phone: <input type="text" name="phone"><br><br>
        Address: <textarea name="address"></textarea><br><br>
        <button type="submit">Register</button>
    </form>
</body>
</html>