<%-- 
    Document   : HomePage
    Created on : 12 Jan, 2024, 4:06:45 PM
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
       <h1><%=session.getAttribute("Agname")%></h1>
       <a href="Myprofile.jsp">PROFILE</a><br>
       <a href="EditProfile.jsp">Edit Profile</a><br>
       <a href="ChangePassword.jsp">CHANGE PASSWORD</a>
    </body>
</html>
