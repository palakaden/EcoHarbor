<%-- 
    Document   : AllTransactions
    Created on : 16 May, 2024, 11:12:16 AM
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
                    <th>Sl No</th>
                    <th>UserName</th>                    
                    <th>UserPropertyno</th>
                    <th>TransactionId</th>
                    <th>TransactionDate</th>
                    <th>TransactionType</th>
                    <th>TransactionAmount</th>

                     <%
                    String insqry = "select*from tbl_transaction t inner join tbl_user u on t.user_id = u.user_id";
                    ResultSet rs = con.selectCommand(insqry);
                    int i = 0;
                    while (rs.next()) {
                        i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("user_name")%></td>          
                    <td><%=rs.getString("user_propertyno")%></td>
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
