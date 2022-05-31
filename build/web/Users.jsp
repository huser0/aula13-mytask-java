<%-- 
    Document   : index
    Created on : 16 de mai. de 2022, 19:32:39
    Author     : Fatec
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Exception usersException = null;
    ArrayList<User> users = new ArrayList<>();
    try {
        users = User.getAllUsers();
    } catch (Exception ex) {
        usersException = ex;
    }
    try {
        if (request.getParameter("user-add") != null) {
            String username = request.getParameter("username");
            String name = request.getParameter("name");
            String password = request.getParameter("password");
            User user = new User(username, (username + password).hashCode(), name);
            User.addUser(user);
            response.sendRedirect(request.getRequestURI());

        } else if (request.getParameter("user-delete") != null) {
            String username = request.getParameter("username");

        } else if (request.getParameter("user-delete") != null) {
            String username = request.getParameter("username");
            String newPassword = request.getParameter("newPassword");
            User.changePassword
            (username, (username+newPassword).hashCode());
            response.sendRedirect(request.getRequestURI());
        }
    } catch (Exception ex) {
        usersException = ex;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Início - MyTasks</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <h2>Inicio</h2>
        <h2>Lista de Usuarios</h2>
        <%if (usersException != null) {%>
        <div style="color:red">
            <%= usersException.getMessage()%>
        </div><hr>
        <%}%>
        <%if (session.getAttribute("user") == null) {%>
        voce deve fazer login para visualizar este conteúdo.
        <%} else {%>
        <form>
            <fieldset>
                <legend>Adicionar ususario</legend>
                Username:<br/>
                <input type="text" name="username"/><br/>
                Nome:<br/>
                <input type="text" name="name"/><br/>
                Senha:<br/>
                <input type="password" name="passoword"/>
                <input type="submit" name="user-add" value="adcionar"/>

            </fieldset>
        </form>
        <table>
            <tr><th>Username</th><th>Name</th></tr>
                    <%for (User u : users) {%>
            <tr>
                <td><%= u.getUsername()%></td>
                <td><%= u.getUsername()%></td>
                <td>
                    <form>
                        <input type="hidden" name="username"
                               value="<%= u.getUsername()%>"/>
                        <input type="submit" name="user-delete"
                               value="Remover"/>
                    </form>
                </td>
                <td>
                    <form>
                        <input type="hidden" name="username"
                               value="<%= u.getUsername()%>"/>
                        <input type="password" name="newPassword"/>
                        <input type="submit" name="user-new-pass"
                               value="Remover"/>
                    </form>
                </td>
            </tr>
            <%}%>
        </table>
        <%}%>
    </body>
</html>
