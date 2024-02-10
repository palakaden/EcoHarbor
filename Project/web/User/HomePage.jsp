<%-- 
    Document   : HomePage
    Created on : 12 Jan, 2024, 3:15:40 PM
    Author     : thoma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        int balance=0;
        String sel="select*from tbl_user where user_id='"+session.getAttribute("uid")+"'";
        ResultSet rsU=con.selectCommand(sel);
        if(rsU.next())
        {
             balance=rsU.getInt("user_wallet");
             if(balance<=0)
             {
                 %>
                  <script>
                    alert("Payment Required");
                    window.location="Payment.jsp";
                </script>
        
        <%
             }
        }
        %>
      <h1><%=session.getAttribute("uname")%></h1>
        <a href="Myprofile.jsp">PROFILE</a><br>
        <a href="ChangePassword.jsp">CHANGE PASSWORD</a><br>
        <a href="EditProfile.jsp">Edit Profile</a><br>
        <a href="UserRequest.jsp">Request</a><br>
    </body>
</html>
