<%-- 
    Document   : UserComplaint
    Created on : 17 May, 2024, 10:26:35 AM
    Author     : thoma
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if (request.getParameter("btn_submit") != null) {
                String insqry = "insert into tbl_complaint (complaint_content, complaint_date, user_id) values ( '" + request.getParameter("content") + "',curdate(), '" + session.getAttribute("uid") + "')";
                con.executeCommand(insqry);
                
        %>
             <script>
                alert("Complaint Send");
                window.location = "HomePage.jsp";//password thettiya same pg illot varan
             </script>
                                                                 
        <%
            }
        %>
        <form method="post" >
            <table border="1" align="center">

                <tr>
                    <td>Complaint</td>
                    <td>
                        <textarea name="content" rows="6" cols="20"></textarea>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btn_submit" value="Register">&nbsp&nbsp<input type="reset" name="btn_reset" value="Reset"</td>
                </tr>
            </table>
        </form>

    </body>
</html>
