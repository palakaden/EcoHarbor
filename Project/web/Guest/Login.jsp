<%--
    Document   : Login
    Created on : 5 Jan, 2024, 4:04:25 PM
    Author     : thoma
--%>

<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="Assets/Form.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@page import="java.sql.ResultSet"%>
        <title>JSP Page</title>
    </head>
    <%@include file="Head.jsp" %>
    <body>
        <%
            if (request.getParameter("btnsave") != null) {
                String email = request.getParameter("txtmail");
                String password = request.getParameter("password");
                int sts = 0;
                String seluser = "select*from tbl_user where user_email= '" + email + "' and user_password ='" + password + "'";
                String seladmin = "select*from tbl_admin where admin_email= '" + email + "' and admin_password ='" + password + "'";
                String selagency = "select*from tbl_agency where agency_email= '" + email + "' and agency_password ='" + password + "'";
                ResultSet rsU = con.selectCommand(seluser);
                ResultSet rsA = con.selectCommand(seladmin);
                ResultSet rsAg = con.selectCommand(selagency);
                if (rsU.next()) {
                    sts = rsU.getInt("user_status");
                    if (sts == 0)//property table ill illa
                    {
        %>
        <script>
            alert("Pending verification");
            window.location = "Login.jsp";
        </script>
        <%
        } else if (sts == 1)//property table ond but admin nokkittila
        {
        %>
        <script>
            alert("Pending verification");
            window.location = "Login.jsp";
        </script>
        <%
        } else if (sts == 3)//rejected
        {
        %>
        <script>
            alert("Rejected User");
            window.location = "Login.jsp";
        </script>
        <%
            } else {
                session.setAttribute("uid", rsU.getString("user_id"));
                session.setAttribute("uname", rsU.getString("user_name"));
                response.sendRedirect("../User/HomePage.jsp");
            }
        } else if (rsA.next()) {
            session.setAttribute("Aid", rsA.getString("admin_id"));
            session.setAttribute("Aname", rsA.getString("admin_name"));
            response.sendRedirect("../Admin/HomePage.jsp");
        } else if (rsAg.next()) {
            session.setAttribute("Agid", rsAg.getString("agency_id"));
            session.setAttribute("Agname", rsAg.getString("agency_name"));
            response.sendRedirect("../Agency/HomePage.jsp");
        } else {
        %>
        <script>
            alert("invalid credentilas");
            window.location = "Login.jsp";//password thettiya same pg illot varan
        </script>
        <%
                }

            }


        %>
        <form method="POST">
            <label align="left" style="color: white; font-size: 58px; font-family: serif ">LOGIN</label><br>
            <input type="email" name="txtmail" placeholder="Enter the email address" required style="width: 300px; height: 40px "><br>
            <input type="password" name="password" placeholder="Enter password" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" style="width: 300px; height: 40px "><br>
            <input type="submit" value="Login" name="btnsave"style="width: 100px; height: 40px; padding: 10px 20px;">  &nbsp;
            <input type="reset" value="Cancel" name="btncan" style="width: 100px; height: 40px; padding: 10px 20px;">  
        </form>
    </body>
    <%@include file="Foot.jsp" %>
</html>
