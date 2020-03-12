<%--
  Created by IntelliJ IDEA.
  User: baloy
  Date: 22-Feb-20
  Time: 14:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="../css/login.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <link rel="icon" href="../images/main/logo.png">
</head>
<body>
<div class="login">
    <h1>Login</h1>
    <form action="check.jsp" method="post">
        <input type="text" name="log" placeholder="Login">
        <br>
        <input type="password" name="pass" placeholder="Password">
        <br>
        <%
            if (session.getAttribute("Error")!=null) {
                out.print("<p class=red>Invalid login or password</p>");
            }
        %>
        <input type="submit" name="sub" value="Enter" id="but">

    </form>
</div>
</body>
</html>
