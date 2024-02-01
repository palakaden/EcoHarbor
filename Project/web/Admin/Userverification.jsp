<%-- 
    Document   : Userverification
    Created on : 11 Jan, 2024, 2:07:56 PM
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
         <%
            if (request.getParameter("aid") != null) {
               String up= "update tbl_user set user_status='2' where user_id ='"+request.getParameter("aid")+"'"  ;
               con.executeCommand(up);
            }
            
         %>
          <%
            if (request.getParameter("rid") != null) {
               String up1= "update tbl_user set user_status='3' where user_id ='"+request.getParameter("rid")+"'"  ;
               con.executeCommand(up1);
            }
            
         %>
         
         <table  border="2" align="center">
                <tr>
                    <th>Sl no</th>
                    <th>Name</th>
                    <th>Contact</th>
                    <th>Photo</th>
                    <th>Adhar proof</th>
                    <th>Property  no</th>
                    <th>Action</th>
                    <th>Verification</th>
                     <%
                    String insqry = "select*from tbl_user";
                    ResultSet rs = con.selectCommand(insqry);
                    int i = 0;
                    while (rs.next()) {
                        i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("user_name")%></td>
                    <td><%=rs.getString("user_contact")%></td>
                    <td><%=rs.getString("user_photo")%></td>
                    <td><%=rs.getString("user_adproof")%></td>
                    <td><%=rs.getString("user_propertyno")%></td>
                    <td><a href="Userverification.jsp?aid=<%=rs.getString("user_id")%>">Accept</a>|<a href="Userverification.jsp?rid=<%=rs.getString("user_id")%>">reject</a></td>
                    <td>
            <%
             if (rs.getInt("user_status")==0)//property table ill illa
                 {
                   out.println("User profile is not listed");
                 }
            else if (rs.getInt("user_status")==1)//property table ill ond
                 {
                   out.println("User profile is  listed");
                 }
            else if (rs.getInt("user_status")==2)
                 {
                   out.println("User profile  accepted");
                 }
            else if (rs.getInt("user_status")==3)
                 {
                   out.println("User profile is rejected");
                 }
            
            %>
                </td>
                </tr>
              <%
                }
              %>
            </table>
    </body>
</html>
