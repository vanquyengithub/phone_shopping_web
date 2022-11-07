<%-- 
    Document   : login
    Created on : Mar 3, 2021, 9:30:49 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <title>Trang đăng nhập</title>
    </head>
    <body>
        <form action="MainController" method="POST">
            Tên đăng nhập: <input type="text" name="userID"/><br>
            Password     : <input type="password" name="password"/><br>
            <input type="submit" name="action" value="Login">
            <input type="reset" value="Reset">
        </form>
        <a href="createUser.jsp">Tạo tài khoản mới</a>
    </body>
</html>
