<%-- 
    Document   : HomePage
    Created on : 12 Jan, 2024, 3:51:57 PM
    Author     : thoma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1><%=session.getAttribute("Aname")%></h1>
        <a href="ChangePassword.jsp">CHANGE PASSWORD</a>
    </body>
</html>
