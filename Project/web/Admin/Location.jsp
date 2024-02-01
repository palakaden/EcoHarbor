<%-- 
    Document   : location.jpg
    Created on : 26 Oct, 2023, 2:07:19 PM
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
        <%
            if(request.getParameter("Save")!=null)
            {
                if(request.getParameter("txtid")=="")
                {
                
                String insqry="insert into tbl_location(location_name)values('"+request.getParameter("txtloc")+"')";
                con.executeCommand(insqry);
                }
                else
                {
                    String upqry="update tbl_location set location_name='"+request.getParameter("txtloc")+"' where location_id='"+request.getParameter("txtid")+"'";
                    con.executeCommand(upqry);
                    response.sendRedirect("Location.jsp");
                }
                
                
            }
             if(request.getParameter("did")!=null)
            {
                String delqry="delete from tbl_location where location_id='"+request.getParameter("did")+"'";
                con.executeCommand(delqry);
                response.sendRedirect("Location.jsp");
            }
             String editid="";
             String editname=" ";
             if(request.getParameter("eid")!=null)
             {
                 String selqry1="select * from tbl_location where location_id ='"+request.getParameter("eid")+"'";
                 ResultSet rs1=con.selectCommand(selqry1);
                 rs1.next();
                 editid=rs1.getString("location_id");
                 editname=rs1.getString("location_name");
                     
             }
             
        %>
        <form method="post">
        <table border="3" align="center">
            <tr>
                <td>
                   Name
                </td>
                <td><input type="text" name="txtloc" value="<%=editname%>" placeholder="Enter location name" required>
                        <input type="hidden" name="txtid" value="<%=editid%>">
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" name="Save" value="Save">
                    <input type="reset" name="cancel" value="cancel">
                </td>
            </tr>
        </table>
                </form>
            <table border="1" align="center">
                <tr>
                    <th>Sl.No</th>
                    <th>Location</th>
                    <th>Action</th>
                </tr>
                <%
            String selqry="select * from tbl_location";
            ResultSet rs=con.selectCommand(selqry);
            int i=0;
            while(rs.next())
            {
                i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("location_name")%></td>
                    <td><a href="Location.jsp?did=<%=rs.getString("location_id")%>">delete</a>|<a href="Location.jsp?eid=<%=rs.getString("location_id")%>">Edit</a></td>
                </tr>
                <%
            }
                %>
            </table>
            
    </body>
</html>
