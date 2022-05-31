<%-- 
    Document   : index
    Created on : 16 de mai. de 2022, 19:32:39
    Author     : Fatec
--%>

<%@page import="model.Task"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User user = (User)session.getAttribute("user");
    Exception indexException = null;
    int userListCount = -1;
    int taskListCount = -1;
    int myTaskListCount = -1;

    try{
        userListCount = User.getAllUsers().size();
        taskListCount = Task.getUserTasks(user.getUsername()).size();
    }catch(Exception ex){
        indexException = ex;
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
        <h2>Usuarios</h2>
        <%if(indexException != null){%>
        <div style="color:red">
            <%= indexException.getMessage()%>
        </div><hr>
        <%}%>
        <h3>
            Usuarios:
            <a href="Users.jsp">
            <%= (usersCount>-1) ? usersCount : '-' %>
            </a>
        </h3>      
    </body>
</html>
