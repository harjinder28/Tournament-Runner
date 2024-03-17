<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sign Up - GMT</title>
    <link rel="stylesheet" type="text/css" href="/css/signup.css">
</head>
<body> 
    <div class="container">
        <h1>Sign Up</h1>
        <form action="/signup" method="post">
            <input type="text" placeholder="Username" name="uname" required>
            <input type="email" placeholder="Email" name="email" required>
            <input type="password" placeholder="Password" name="password" required>
            <input type="text" placeholder="Contact No." name="contact" required>
            
            <button type="submit" class="btn">Sign Up</button>
        </form>
        <p>Already have an account? <a href="/login">Login here</a></p>
    </div>
</body>
</html>
