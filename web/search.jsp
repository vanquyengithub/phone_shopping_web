<%-- 
    Document   : search
    Created on : Jan 21, 2021, 4:31:31 PM
    Author     : User
--%>

<%@page import="phone.dtos.ProductDTO"%>
<%@page import="java.util.List"%>
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
        <title>Trang tìm</title>
    </head>
    <body>
        <div class="container-fluid">
            <%
                UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
                if (user != null && "US".equals(user.getRoleID())) {
            %>
            <h1>Xin chào: <%= user.getName()%></h1>
            <form action="MainController">
                <input type="submit" name="action" value="Logout"/>
                <input type="submit" name="action" value="View">
            </form>
            <%
            } else {
            %>
            <form action="MainController">
                <a href="login.jsp">Login</a>
                <a href="createUser.jsp">Register</a>
                <input type="submit" name="action" value="View">
            </form>
            <%
                }
                String searchValue = request.getParameter("search");
                if (searchValue == null) {
                    searchValue = "";
                }
            %>

            <form action="MainController">
                Tìm<input type="text" name="search" value="<%= searchValue%>"/>
                <input type="submit" name="action" value="Search"/>
            </form>
            <h1>Kết quả tìm kiếm về <%= searchValue%></h1>
            <%
                List<ProductDTO> list = (List<ProductDTO>) session.getAttribute("LIST_SEARCH_PRODUCT");
                if (list != null) {
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
                        <th>Tình trạng</th>
                        <th>Giá</th>
                        <th>Phân loại</th>
                        <th>Thêm</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (ProductDTO dto : list) {
                    %>
                <form action="MainController">
                    <tr>
                        <td><%= dto.getProductID()%></td>
                        <td><img src="images/<%= dto.getImage()%>" width="60" height="80"></td>
                        <td><%= dto.getName()%></td>
                        <td><%= dto.getMemory()%></td>
                        <td><%= dto.getRam()%></td>
                        <td><%= dto.getColor()%></td>
                        <td><%= dto.getQuantity() > 0 ? "Available" : "Sold out"%></td>
                        <td><%= String.format("%.1f", dto.getPrice())%></td>
                        <td><%= dto.getCategory()%></td>
                        <td>
                            <input type="hidden" name="productID" value="<%= dto.getProductID()%>"/>
                            <input type="hidden" name="name" value="<%= dto.getName()%>"/>
                            <input type="hidden" name="image" value="<%= dto.getImage()%>"/>
                            <input type="hidden" name="memory" value="<%= dto.getMemory()%>"/>
                            <input type="hidden" name="ram" value="<%= dto.getRam()%>"/>
                            <input type="hidden" name="color" value="<%= dto.getColor()%>"/>
                            <input type="hidden" name="quantity" value="<%= dto.getQuantity()%>"/>
                            <input type="hidden" name="price" value="<%= dto.getPrice()%>"/>
                            <input type="hidden" name="categoryID" value="<%= dto.getCategory()%>"/>
                            <input type="hidden" name="search" value="<%= request.getParameter("search")%>"/>
                            <input type="submit" name="action" value="Add"/>
                        </td>
                    </tr>                
                </form>
                <% }%>    
                </tbody>
            </table>
            <% }%>
            <%
                String message = (String) request.getAttribute("MESSAGE");
                if (message != null) {
            %>
            <h1>
                <%= message%>
            </h1>
            <%
                }
            %>
            <a href="home.jsp">Return home</a>
        </div>
    </body>
</html>
