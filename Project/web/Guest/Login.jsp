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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <%@page import="java.sql.ResultSet"%>
        <title>JSP Page</title>
    </head>
    <body>
       <%
           if(request.getParameter("btnsave")!=null)
           {
                String email=request.getParameter("txtmail");
                String password=request.getParameter("password");
                
                String seluser = "select*from tbl_user where user_email= '"+email+"' and user_password ='"+password+"'";
                String seladmin = "select*from tbl_admin where admin_email= '"+email+"' and admin_password ='"+password+"'";
                String selagency = "select*from tbl_agency where agency_email= '"+email+"' and agency_password ='"+password+"'";
                ResultSet rsU=con.selectCommand(seluser);
                ResultSet rsA=con.selectCommand(seladmin);
                ResultSet rsAg=con.selectCommand(selagency);
                
                if(rsU.next())
                {
                    session.setAttribute("uid",rsU.getString("user_id"));
                    session.setAttribute("uname",rsU.getString("user_name"));
                    response.sendRedirect("../User/HomePage.jsp");
                }
                else if(rsA.next())
                {
                    session.setAttribute("Aid",rsA.getString("admin_id"));
                    session.setAttribute("Aname",rsA.getString("admin_name"));
                    response.sendRedirect("../Admin/HomePage.jsp");  
                }
                else if(rsAg.next())
                {
                    session.setAttribute("Agid",rsAg.getString("agency_id"));
                    session.setAttribute("Agname",rsAg.getString("agency_name"));
                    response.sendRedirect("../Agency/HomePage.jsp");  
                }
                else
                {
                    %>
                    <script>
                        alert("invalid credentilas")
                        window.Location="Login.jsp"//password thettiya same pg illot varan
                    </script>
                    <%
                }
                
           }
       
       
       
       %>
        <form method="POST">
            <table border="3" align="center">
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="txtmail" placeholder="Enter the email address" required</td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="password" placeholder="Enter password" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" </td>
                </tr>
                 <tr>
                    <td colspan="2" align="center">
                      <input type="submit" value="Login" name="btnsave">  
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>