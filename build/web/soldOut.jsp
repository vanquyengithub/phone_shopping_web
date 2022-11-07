<%-- 
    Document   : soldOut
    Created on : Mar 4, 2021, 2:18:50 PM
    Author     : User
--%>

<%@page import="java.util.List"%>
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
        <title>Trang hết hàng</title>
    </head>
    <body>
        <div class="container-fluid">
        <%
            List<String> list = (List<String>) session.getAttribute("SOLD_OUT");
            if (list != null) {
                for (String message : list) {
        %>
        <h1><%= message.toString()%></h1>
        <%
                }
            }
        %>
        <a href="viewCart.jsp">Xem lại giỏ hàng</a>
        </div>
    </body>
</html>
