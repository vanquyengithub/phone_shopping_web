<%-- 
    Document   : viewCart
    Created on : Feb 26, 2021, 8:13:24 PM
    Author     : User
--%>

<%@page import="phone.dtos.UserDTO"%>
<%@page import="phone.dtos.OrderProductDTO"%>
<%@page import="phone.dtos.CartDTO"%>
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
        <title>Trang xem giỏ hàng</title>
    </head>
    <body>
        <div class="container-fluid">
            <%
                UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
                if (user != null && "US".equals(user.getRoleID())) {
            %>
            <h1>Chào mừng:<%= user.getName()%></h1>
            <%
                }
            %>
            <h1>Điện thoại bạn chọn</h1>            
            <%
                double total = 0;
                CartDTO cart = (CartDTO) session.getAttribute("CART");
                if (cart != null) {
            %>
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
                        <th>Xóa</th>
                        <th>Cập nhật</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (OrderProductDTO dto: cart.getCart().values()){
                            total += dto.getPrice() * dto.getQuantity();
                    %>
                <form action="MainController">
                    <tr>
                        <td>                        
                            <input type="text" name="id" value="<%= dto.getProductID() %>" readonly="true">
                        </td>
                        <td><img src="images/<%= dto.getImage()%>" width="60" height="80"></td>
                        <td><%= dto.getName()%></td>
                        <td><%= dto.getMemory()%></td>
                        <td><%= dto.getRam()%></td>
                        <td><%= dto.getColor()%></td>
                        <td><%= dto.getCategory()%></td>
                        <td>                        
                            <input type="number" name="quantity" value="<%= dto.getQuantity() %>" required="true"/>
                        </td>
                        <td><%= String.format("%.1f",dto.getPrice()) %></td>
                        <td><%= String.format("%.1f",dto.getPrice() * dto.getQuantity()) %></td>
                        <td>
                            <input type="submit" name="action" value="Delete"/>
                        </td>
                        <td>
                            <input type="submit" name="action" value="Update"/>
                        </td>
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
            <a href="home.jsp">Chọn thêm</a>
            <form action="MainController">
                <input type="submit" name="action" value="Check"/>
            </form>
        </div>
    </body>
</html>
