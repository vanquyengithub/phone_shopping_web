<%-- 
    Document   : verify
    Created on : Mar 15, 2021, 10:36:48 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <title>Trang xác minh</title>
    </head>
    <body>
        <span>Chúng tôi đã gửi mã xác minh qua email đến cho bạn.</span>
        
        <form action="MainController" method="POST">
            <input type="text" name="authcode">
            <input type="submit" name="action" value="Verify">
        </form>
    </body>
</html>
