<%-- 
    Document   : Transaction
    Created on : 16 May, 2024, 11:00:35 AM
    Author     : thoma
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
    <jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <table  border="2" align="center">
                <tr>
                    <th>Sl no</th>
                    <th>Transaction_id</th>
                    <th>Transaction_date</th>
                    <th>Transaction_type</th>
                    <th>Transaction_amount</th>
               
                     <%
                    String insqry = "select*from tbl_transaction where user_id ='" + session.getAttribute("uid") + "'";
                    ResultSet rs = con.selectCommand(insqry);
                    int i = 0;
                    while (rs.next()) {
                        i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("transaction_id")%></td>
                    <td><%=rs.getString("transaction_date")%></td>
                    <td><%=rs.getString("transaction_type")%></td>
                    <td><%=rs.getString("transaction_amount")%></td>
                </tr>
                 <%
                    }
                 %>  
            </table>
    </body>
</html>
