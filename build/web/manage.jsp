<%-- 
    Document   : manage
    Created on : Mar 8, 2021, 10:27:06 AM
    Author     : User
--%>

<%@page import="phone.dtos.RoleDTO"%>
<%@page import="phone.daos.UserDAO"%>
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
        <title>Trang quản lí</title>
    </head>
    <body>
        <div class="container-fluid">
            <%
                UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
                if (user == null || !"AD".equals(user.getRoleID())) {
                    response.sendRedirect("login.html");
                    return;
                }
                String searchValue = request.getParameter("search");
                if (searchValue == null) {
                    searchValue = "";
                }
                UserDAO dao = new UserDAO();
                List<RoleDTO> roleList = dao.getRoleList();
            %>
            <h1>Xin chào: <%= user.getName()%></h1>
            <form action="MainController">
                <input type="submit" name="action" value="Logout"/>
            </form>
            <form action="MainController">
                Tìm<input type="text" name="search" value="<%= searchValue%>"/>
                <input type="submit" name="action" value="SearchUser"/>
            </form>
            <%
                List<UserDTO> list = (List<UserDTO>) session.getAttribute("LIST_USER");
                if (list != null) {
            %>
            <table border="1">
                <thead>
                    <tr>
                        <th>Thứ tự</th>
                        <th>Tên đăng nhập</th>
                        <th>Tên người dùng</th>
                        <th>Mật khẩu</th>
                        <th>Địa chỉ</th>
                        <th>Điện thoại</th>
                        <th>Email</th>
                        <th>RoleID</th>                    
                        <th>Xóa</th>
                        <th>Cập nhật</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        int count = 1;
                        for (UserDTO dto : list) {
                    %>
                <form action="MainController">
                    <tr>
                        <td><%= count++%></td>
                        <td><%= dto.getUserID()%></td>
                        <td>
                            <input type="text" name="name" value="<%= dto.getName()%>"/>
                        </td>
                        <td><%= dto.getPassword()%></td>
                        <td>
                            <input type="text" name="address" value="<%= dto.getAddress()%>"/>
                        </td>
                        <td>
                            <input type="text" name="phone" value="<%= dto.getPhone()%>"/>
                        </td>
                        <td>
                            <input type="text" name="email" value="<%= dto.getEmail()%>"/>
                        </td>
                        <td>
                            <select name="cmbRole" class="form-control">
                                <%
                                    if (roleList != null) {
                                        for (RoleDTO role : roleList) {
                                %>
                                <option value="<%= role.getRoleID()%>"
                                        <%if (dto.getRoleID().equals(role.getRoleID())) {%> 
                                        selected="selected"
                                        <%}%>>
                                    <%= role.getName()%>
                                </option>
                                <%
                                        }
                                    }
                                %>
                            </select>
                        </td>                    
                        <td>
                            <a href="MainController?search=<%= request.getParameter("search")%>&action=DeleteUser&userID=<%=dto.getUserID()%>">
                                Delete
                            </a>
                        </td>
                        <td>
                            <input type="hidden" name="userID" value="<%= dto.getUserID()%>"/>
                            <input type="hidden" name="name" value="<%= dto.getName()%>"/>
                            <input type="hidden" name="address" value="<%= dto.getAddress()%>"/>
                            <input type="hidden" name="phone" value="<%= dto.getPhone()%>"/>
                            <input type="hidden" name="email" value="<%= dto.getEmail()%>"/>
                            <input type="hidden" name="cmbRole" value="<%= dto.getRoleID()%>"/>
                            <input type="hidden" name="search" value="<%= request.getParameter("search")%>"/>
                            <input type="submit" name="action" value="UpdateUser"/>
                        </td>
                    </tr>

                </form>
                <% }%>    
                </tbody>
            </table>
            <% }%>
        </div>
    </body>
</html>
