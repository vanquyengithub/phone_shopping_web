<%-- 
    Document   : createUser
    Created on : Mar 2, 2021, 4:17:04 PM
    Author     : User
--%>

<%@page import="java.util.List"%>
<%@page import="phone.daos.UserDAO"%>
<%@page import="phone.dtos.RoleDTO"%>
<%@page import="phone.dtos.ErrorUserDTO"%>
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
        <title>Trang tạo tài khoản</title>
    </head>
    <body>
        <div class="container-fluid">
            <%
                ErrorUserDTO error = (ErrorUserDTO) request.getAttribute("ERROR");
                if (error == null) {
                    error = new ErrorUserDTO("", "", "", "", "", "", "", "");
                }
                UserDAO dao = new UserDAO();
                List<RoleDTO> roleList = dao.getRoleList();
            %>
            <form action="MainController" method="POST">
                Tên đăng nhập <input type="text" name="userID" required="true"></br>
                <%= error.getUserIDError()%></br>
                Họ tên <input type="text" name="name" required="true"></br>
                <%= error.getNameError()%></br>
                Địa chỉ <input type="text" name="address" required="true"></br>
                <%= error.getAddressError()%></br>
                số điện thoại <input type="text" name="phone" required="true"></br>
                <%= error.getPhoneError()%></br>
                Email <input type="text" name="email" required="true"></br>
                <%= error.getEmailError()%></br>
                Role ID <select name="cmbRole" class="form-control">
                    <%
                        if (roleList != null) {
                            for (RoleDTO role : roleList) {
                    %>
                    <option value="<%= role.getRoleID()%>"><%= role.getName()%></option>
                    <%
                            }
                        }
                    %>
                </select>
                Password <input type="text" name="password" required="true"></br>
                Nhập lại password <input type="text" name="confirm" required="true"></br>
                <%= error.getConfirm()%></br>
                <input type="submit" name="action" value="Create"/>
                <input type="reset" value="Reset"/>
            </form>
        </div>
    </body>
</html>
