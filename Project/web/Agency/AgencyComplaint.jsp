<%-- 
    Document   : AgencyComplaint
    Created on : 17 May, 2024, 10:35:33 AM
    Author     : thoma
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Feedback</title>
    </head>
    <body>
        <%
            if (request.getParameter("btn_submit") != null) {
                String uq = "insert into tbl_complaint set complaint_content = '" + request.getParameter("complaint_content") + "'"
                        + ",complaint_date =curdate() ,agency_id = '" + session.getAttribute("Agid") + "'";
                if (con.executeCommand(uq)) { %>
        <script type="text/javascript" >
            alert("Complaint Submitted");
            setTimeout(function() {
                window.location.href = 'HomePage.jsp'
            }, 1000);
        </script>
        <%
                }
            }
        %>
        <form method="post" >
            <table border="1" align="center">
                <tr>
                    <td>Complaint</td>
                    <td>
                        <textarea name="complaint_content" rows="6" cols="20"></textarea>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btn_submit" value="Register">&nbsp&nbsp<input type="reset" name="btn_reset" value="Reset"</td>
                </tr>
            </table>
        </form>
    </body>
</html>
