<%-- 
    Document   : Requestview
    Created on : 26 Feb, 2024, 4:45:53 PM
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
                    String insqry = "select*from tbl_request r inner join tbl_user u on r.user_id = u.user_id where u.user_id ='" + session.getAttribute("uid") + "'";
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
                    <td>
                        <%
                        String in =  "select*from tbl_requesttype l inner join tbl_wastetype t on l.wastetype_id = t.wastetype_id where request_id ='" + rs.getString("request_id") + "'";
                        ResultSet rs2 = con.selectCommand(in);
                        StringBuilder wn=new StringBuilder();// object that will be used to concatenate the "wastetype_name" values into a single string.
                        while(rs2.next())
                        {
                            if(wn.length()>0)//first execution ill kerilla
                            {
                                wn.append(", ");
                            }
                        
                        wn.append(rs2.getString("wastetype_name"));
                        }
                        %>
                        <%=wn%><!--calling above object-->
                    
                     </td>
                     <td></td>
                </tr>
              <%
                          
                }
              %>
            </table>
    </body>
</html>
