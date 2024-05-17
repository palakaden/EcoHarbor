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
        <h1><%=session.getAttribute("Aname")%></h1><br>
        <a href="ChangePassword.jsp">CHANGE PASSWORD</a><br>
        <a href="Location.jsp">LOCATION ENTRY</a><br>
        <a href="Property.jsp">PROPERTY ENTRY</a><br>
        <a href="Ward.jsp">WARD ENTRY</a><br>
        <a href="UserRequestVerification.jsp">USER REQUEST VERIFICATION</a><br>
        <a href="Userverification.jsp">USER VERIFICATION</a><br>
        <a href="Wastetype.jsp">WASTE TYPE</a><br>
        <a href="AllTransactions.jsp">ALL TRANSACTIONS</a><br>
        <a href="ViewFeedback.jsp">VIEW FEEDBACK</a>
    </body>
</html>
