<%-- 
    Document   : ChangePassword
    Created on : 14 Jan, 2024, 2:03:29 PM
    Author     : thoma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
       <jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
       <%@page import="java.sql.ResultSet" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>JSP Page</title>
    </head>
    <body>
        <%
           String p="";
           String crpass ="select*from tbl_agency where agency_id ='"+session.getAttribute("Agid")+"'";
           ResultSet rs=con.selectCommand(crpass);
           rs.next();
           p=rs.getString("agency_password");
           if(request.getParameter("save")!=null)
           {
                if(p.equals(request.getParameter("txtpass")))
                 {
                 if(request.getParameter("txtpassword").equals(request.getParameter("txtpasswords")))
                  {
               
                   String pass = "update tbl_agency set agency_password ='"+request.getParameter("txtpassword")+"' where agency_id ='"+session.getAttribute("Agid")+"'";
                   con.executeCommand(pass);
                   %>
                      <script>
                         alert("Password updated")
                         window.location.href = '../Guest/Login.jsp';
                       </script>
                       
                   <%
                   
                  }
                  else
                  {
                     %>
                      <script>
                         alert("New Password missmatch")
                         window.location.href = '../Agency/ChangePassword.jsp';
                       </script>
                     <%
                   }
                }
                else
                {
                     %>
                      <script>
                         alert("current password missmatch")
                         window.location.href = '../Agency/ChangePassword.jsp'
                       </script>
                     <% 
                }

           }
                  
        %>
        <form method="POST">
        <table border="3" align="center">
                <tr>
                <td>Current Password</td>
                    <td><input type="password" name="txtpass"  placeholder="Enter password " pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required></td>
                </tr>
                <tr>
                    <td>New Password</td>
                    <td><input type="password" name="txtpassword"  placeholder="Enter password " pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required></td>
                </tr>
                <tr>
                    <td>Re-Password</td>
                    <td><input type="password" name="txtpasswords"  placeholder="Enter password " pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required></td>
                </tr>
                 <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="Update" name="save">
                    </td>
                </tr>
                  </table>
        </form>
    </body>
</html>
