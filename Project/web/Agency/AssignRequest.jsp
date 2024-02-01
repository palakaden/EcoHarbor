<%-- 
    Document   : AssignRequest
    Created on : 27 Oct, 2023, 10:57:17 PM
    Author     : thoma
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="POST">
               <table  border="2" align="center">
                <tr>
                    <th>Sl no</th>
                    <th>Name</th>
                    <th>Contact</th>
                    <th>Property No</th>
                     <th>Ward No</th>
                    <th>Location</th>
                    <th>Waste type</th>
                     <%
                    String sel = "select*from tbl_request  w inner join tbl_user l on l.user_id=w.user_id  inner join tbl_ward d on l.ward_id=d.ward_id inner join tbl_location e on d.location_id=e.location_id where request_status =1";
                    ResultSet rs = con.selectCommand(sel);
                    int i = 0;
                    while(rs.next()) {
                    String selQ = "select * from tbl_requesttype b inner join tbl_wastetype c on b.wastetype_id=c.wastetype_id where request_id='"+rs.getString("request_id")+"'";
                    ResultSet rs1 = con.selectCommand(selQ);
                        
                        i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("user_name")%></td>
                    <td><%=rs.getString("user_contact")%></td>
                    <td><%=rs.getString("user_propertyno")%></td>
                    <td><%=rs.getString("ward_no")%></td>
                    <td><%=rs.getString("location_name")%></td>
                   
                    <td><%
                    while(rs1.next())
                    {
                        out.println(rs1.getString("wastetype_name")+"<br>");
                    }
                    %></td>
                </tr>
                <%
                    }
                %>
            </table>
        </form>
    </body>
</html>
