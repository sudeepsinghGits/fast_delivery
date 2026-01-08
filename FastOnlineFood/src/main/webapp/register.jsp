<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register | Sudeep's Swift Bites</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --swiggy-orange: #fc8019;
            --text-gray: #7e808c;
            --text-dark: #282c3f;
            --border-color: #d4d5d9;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .register-container {
            background: #fff;
            width: 100%;
            max-width: 450px;
            padding: 40px;
            box-shadow: 0 15px 40px rgba(0,0,0,0.12);
            border-radius: 12px;
        }

        .header-box {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .header-box h2 {
            font-size: 32px;
            font-weight: 700;
            color: var(--text-dark);
            margin: 0;
        }

        .header-box p {
            color: var(--swiggy-orange);
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
        }

        .input-group {
            position: relative;
            margin-bottom: 20px;
        }

        .input-group input, .input-group textarea {
            width: 100%;
            padding: 15px 0;
            border: none;
            border-bottom: 1px solid var(--border-color);
            font-size: 16px;
            font-family: inherit;
            outline: none;
            transition: all 0.3s;
        }

        .input-group input:focus, .input-group textarea:focus {
            border-bottom: 1px solid var(--text-dark);
        }

        .input-group label {
            position: absolute;
            top: 15px;
            left: 0;
            color: var(--text-gray);
            pointer-events: none;
            transition: 0.3s all;
        }

        /* Float label logic */
        .input-group input:focus ~ label,
        .input-group input:valid ~ label,
        .input-group textarea:focus ~ label,
        .input-group textarea:valid ~ label {
            top: -10px;
            font-size: 12px;
            color: var(--swiggy-orange);
            font-weight: 600;
        }

        textarea {
            resize: none;
            height: 60px;
        }

        .register-btn {
            background-color: var(--swiggy-orange);
            color: white;
            width: 100%;
            border: none;
            padding: 18px;
            font-size: 16px;
            font-weight: 700;
            margin-top: 20px;
            cursor: pointer;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .terms {
            font-size: 12px;
            color: var(--text-gray);
            margin-top: 20px;
            line-height: 1.5;
        }

        .terms b { color: #5d5e67; }
    </style>
</head>
<body>

<div class="register-container">
    <div class="header-box">
        <div>
            <h2>Sign up</h2>
            <p onclick="location.href='login.jsp'">or login to your account</p>
       

    <form action="register" method="post">
        <div class="input-group">
            <input type="text" name="name" required autocomplete="off">
            <label>Full Name</label>
        </div>

        <div class="input-group">
            <input type="text" name="username" required autocomplete="off">
            <label>Username</label>
        </div>

        <div class="input-group">
            <input type="email" name="email" required autocomplete="off">
            <label>Email Address</label>
        </div>

        <div class="input-group">
            <input type="text" name="phone" required autocomplete="off">
            <label>Phone Number</label>
        </div>

        <div class="input-group">
            <input type="password" name="password" required autocomplete="off">
            <label>Password</label>
        </div>

        <div class="input-group">
            <textarea name="address" required></textarea>
            <label>Delivery Address</label>
        </div>

        <button type="submit" class="register-btn">CONTINUE</button>
        
        <p class="terms">
            By creating an account, I accept the <b>Terms & Conditions</b> & <b>Privacy Policy</b>
        </p>
    </form>
</div>

</body>
</html>