<%-- 
    Document   : UserRequestDetails
    Created on : 22 Feb, 2024, 2:19:26 PM
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
                    <th>Name</th>
                    <th>Contact</th>
                    <th>Address</th>
                    <th>RequestId</th>
                    <th>RequestDate</th>
                    <th>PropertyNo</th>
                    <th>Wastetype</th>
                    <th>Action</th>
                     <%
                    String insqry = "select*from tbl_request w inner join tbl_user l on w.user_id=l.user_id";
                    ResultSet rs = con.selectCommand(insqry);
                    int i = 0;
                    while (rs.next()) {
                        i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("user_name")%></td>
                    <td><%=rs.getString("user_contact")%></td>
                    <td><%=rs.getString("user_address")%></td>
                    <td><%=rs.getString("request_id")%></td>
                    <td><%=rs.getString("request_date")%></td>
                    <td><%=rs.getString("user_propertyno")%></td>
                    
          
              <%
                }
              %>
            </table>
    </body>
</html>
