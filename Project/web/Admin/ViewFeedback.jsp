<%-- 
    Document   : ViewFeedback
    Created on : 16 May, 2024, 11:46:50 PM
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
        <h1 align="center">User Feedback </h1>
        <table border="1" align="center">
            <tr>
                <td>Sl.No</td>
                <td>User Name</td> 
                <td>Property NO</td>
                <td>Date</td>
                <td>Feedback content</td>
            </tr>
            <% int i = 0;
                String seleQry = "select * from tbl_feedback f inner join tbl_user u on f.user_id=u.user_id";
                ResultSet res = con.selectCommand(seleQry);
                while (res.next()) {
                    i++;
            %>
            <tr>
                <td align="center"><%=i%></td>
                <td><%=res.getString("user_name")%></td>
                <td align="center"><%=res.getString("user_propertyno")%></td>
                <td><%=res.getString("feedback_date")%></td>
                <td><%=res.getString("feedback_content")%></td>
            </tr>
            <%
                }
            %>
        </table>
                <h1 align="center">Agency Feedback </h1>
        <table border="1" align="center">
            <tr>
                <td>Sl.No</td>
                <td>Agency Name</td> 
                <td>Date</td>
                <td>Feedback content</td>
            </tr>
            <% int j = 0;
                String selQry = "select * from tbl_feedback f inner join tbl_agency u on f.agency_id=u.agency_id";
                ResultSet rs = con.selectCommand(selQry);
                while (rs.next()) {
                    j++;
            %>
            <tr>
                <td align="center"><%=j%></td>
                <td><%=rs.getString("agency_name")%></td>
                <td><%=rs.getString("feedback_date")%></td>
                <td><%=rs.getString("feedback_content")%></td>
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>
