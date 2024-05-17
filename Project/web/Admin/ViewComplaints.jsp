<%-- 
    Document   : ViewComplaints
    Created on : 17 May, 2024, 10:43:40 AM
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
        <h1 align="center">User Complaint </h1>
        <table border="1" align="center">
            <tr>
                <td>Sl.No</td>
                <td>User Name</td> 
                <td>Property NO</td>
                <td>Date</td>
                <td>Complaint content</td>
                <td>Action</td>
            </tr>
            <% int i = 0;
                String seleQry = "select * from tbl_complaint f inner join tbl_user u on f.user_id=u.user_id";
                ResultSet res = con.selectCommand(seleQry);
                while (res.next()) {
                    i++;
            %>
            <tr>
                <td align="center"><%=i%></td>
                <td><%=res.getString("user_name")%></td>
                <td align="center"><%=res.getString("user_propertyno")%></td>
                <td><%=res.getString("complaint_date")%></td>
                <td><%=res.getString("complaint_content")%></td>
                <td><a href="ComplaintReply.jsp?cid=<%=res.getString("Complaint_id")%>">Reply</a><br></td>
            </tr>
            <%
                }
            %>
        </table>
                <h1 align="center">Agency Complaint </h1>
        <table border="1" align="center">
            <tr>
                <td>Sl.No</td>
                <td>Agency Name</td> 
                <td>Date</td>
                <td>Complaint content</td>
                <td>Action</td>
            </tr>
            <% int j = 0;
                String selQry = "select * from tbl_complaint f inner join tbl_agency u on f.agency_id=u.agency_id";
                ResultSet rs = con.selectCommand(selQry);
                while (rs.next()) {
                    j++;
            %>
            <tr>
                <td align="center"><%=j%></td>
                <td><%=rs.getString("agency_name")%></td>
                <td><%=rs.getString("complaint_date")%></td>
                <td><%=rs.getString("complaint_content")%></td>
                <td><a href="ComplaintReply.jsp?cid=<%=rs.getString("Complaint_id")%>">Reply</a><br></td>
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>

