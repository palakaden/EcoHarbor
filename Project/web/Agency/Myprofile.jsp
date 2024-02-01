<%--
    Document   : Myprofile
    Created on : 5 Jan, 2024, 4:04:25 PM
    Author     : thoma
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Profile</title>
    </head>
    <body>
        <%
          String sel1 = "select*from tbl_agency where agency_id='"+session.getAttribute("Agid")+"'";  
          ResultSet rsa = con.selectCommand(sel1);
          if(rsa.next())
          {
        %>
        <form method="post">
            <table border="1" align="center">
                <tr>
                    <td colspan="2" align="right"><img src="../Assets/file/AgencyLogo/<%=rsa.getString("agency_logo")%>" height="120" width="120"></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><%=rsa.getString("agency_name")%></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><%=rsa.getString("agency_contact")%></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><%=rsa.getString("agency_email")%></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><%=rsa.getString("agency_address")%></td>
                </tr>
        <%
          }
        %>        
            </table>
        </form>
    </body>
</html>
