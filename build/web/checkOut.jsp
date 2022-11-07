<%-- 
    Document   : checkOut
    Created on : Mar 4, 2021, 1:02:37 PM
    Author     : User
--%>

<%@page import="phone.dtos.OrderProductDTO"%>
<%@page import="phone.dtos.CartDTO"%>
<%@page import="phone.dtos.UserDTO"%>
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
        <title>Trang xác nhận đơn hàng</title>
    </head>
    <body>
        <div class="container-fluid">
        <%
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
            CartDTO cart = (CartDTO) session.getAttribute("CART");
            double total = 0;
            if (cart.getCart().size() == 0){
                response.sendRedirect("home.jsp");
                return;
            }
            if (cart.getCart().size() > 0 && user != null) {
        %>
        <h1>Thông tin cá nhân</h1>
        Họ tên: <%= user.getName()%></br>
        Địa chỉ: <%= user.getAddress()%></br>
        Số điện thoại: <%= user.getPhone()%></br>
        Email: <%= user.getEmail()%></br>
        <h1>Danh sách điện thoại bạn mua</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>Mã ID</th>
                    <th>Hình</th>
                    <th>Tên</th>
                    <th>Bộ nhớ</th>
                    <th>RAM</th>
                    <th>Màu sắc</th>
                    <th>Phân loại</th>
                    <th>Số lượng</th>
                    <th>Giá</th>
                    <td>Tổng cộng</td>
                </tr>
            </thead>
            <tbody>
                <%
                    for (OrderProductDTO dto: cart.getCart().values()){
                        total += dto.getPrice() * dto.getQuantity();
                %>
            <form action="MainController">
                <tr>
                    <td><%= dto.getProductID() %></td>
                    <td><img src="images/<%= dto.getImage()%>" width="60" height="80"></td>
                    <td><%= dto.getName()%></td>
                    <td><%= dto.getMemory()%></td>
                    <td><%= dto.getRam()%></td>
                    <td><%= dto.getColor()%></td>
                    <td><%= dto.getCategory()%></td>
                    <td><%= dto.getQuantity() %></td>
                    <td><%= String.format("%.1f",dto.getPrice()) %></td>
                    <td><%= String.format("%.1f",dto.getPrice() * dto.getQuantity()) %></td>
                </tr>
            </form>    
            </tbody>
            <%
                    }
                %>
        </table>

        <%
            }
        %>
        <h1>Tổng cộng đơn hàng: <%= String.format("%.1f",total) %></h1>
        <a href="home.jsp">Chọn thêm sản phẩm</a>
        <a href="viewCart.jsp">Xem lại giỏ hàng</a>
        <form action="MainController" method="POST">
            <input type="hidden" name="total" value="<%= total%>"/>
            <input type="submit" name="action" value="Buy"/>
        </form>
        </div>
    </body>
</html>
