<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>GMT - Login</title>
    <link rel="stylesheet" type="text/css" href="/css/login.css">
</head>
<body>
    <div class="containerdiv2">

        <h1>Login</h1>
        <form action="/login" method="post">
            <input type="email" placeholder="Username" class="input-field" name="uname" required="required">
            <input type="password" placeholder="Password" class="input-field" name="password" required="required">
            <button type="submit" class="btnl">Login</button>
        </form>
        <p>Don't have an account? <a href="/signup.jsp">Sign up</a></p>
    </div>
</body>
</html>
