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
        <%
            String seleQry = "select * from tbl_complaint f inner join tbl_user u on f.user_id=u.user_id where f.complaint_id ='" + request.getParameter("cid") + "'";
            ResultSet ress = con.selectCommand(seleQry);
            if (ress.next()) 
            {
        %>
        <table border="1" align="center">
            <tr>
                <td>User Name</td> 
                <td>Property NO</td>
                <td>Date</td>
                <td>Complaint content</td>
            </tr>
            <tr>
                <td><%=ress.getString("user_name")%></td>
                <td align="center"><%=ress.getString("user_propno")%></td>
                <td><%=ress.getString("complaint_date")%></td>
                <td><%=ress.getString("complaint_content")%></td>
            </tr>
        </table>
            <%
                }
            %>
            
            <%
            String seQry = "select * from tbl_complaint f inner join tbl_agency u on f.agency_id=u.agency_id where f.complaint_id ='" + request.getParameter("cid") + "'";
            ResultSet r = con.selectCommand(seQry);
            if (r.next()) 
            {
                    %>                
            <table border="1" align="center">
            <tr>
                <td>Agency Name</td> 
                <td>Date</td>
                <td>Complaint content</td>
            </tr>
            <tr>
                <td><%=r.getString("agency_name")%></td>
                <td><%=r.getString("complaint_date")%></td>
                <td><%=r.getString("complaint_content")%></td>
            </tr>
            <%
                }
            %>
            </table>
         
    </body>
</html>