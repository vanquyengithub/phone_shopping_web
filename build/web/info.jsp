<%-- 
    Document   : info
    Created on : Mar 16, 2021, 8:45:26 AM
    Author     : User
--%>

<%@page import="phone.dtos.ErrorUserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <title>info Page</title>
    </head>
    <body>

        <%
            ErrorUserDTO error = (ErrorUserDTO) request.getAttribute("ERROR");
            if (error == null) {
                error = new ErrorUserDTO("", "", "", "", "", "", "", "");
            }
        %>

        <div class="container-fluid">
            <h1>Hãy điền thông tin trước khi xác nhận đơn hàng</h1>
            <form action="MainController" method="POST" class="signin-form">                                    
                Họ tên <input type="text" name="name" required="true"></br>
                <%= error.getNameError()%></br>
                Địa chỉ <input type="text" name="address" required="true"></br>
                <%= error.getAddressError()%></br>
                Số điện thoại <input type="text" name="phone" required="true"></br>
                <%= error.getPhoneError()%></br>
                Email <input type="text" name="email" required="true"></br>
                <%= error.getEmailError()%></br>
                <input type="submit" name="action" value="Next">
                <input type="reset" value="Reset">

            </form>
            <p class="text-center"> <a href="viewCart.jsp">Xem lại giỏ hàng</a></p>
        </div>
    </body>
</html>
