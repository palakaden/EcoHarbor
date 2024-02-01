<%-- 
    Document   : location.jpg
    Created on : 26 Oct, 2023, 2:07:19 PM
    Author     : thoma
--%>
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
            if(request.getParameter("Save")!=null)
            {
                String insqry="insert into tbl_location(location_name)values('"+request.getParameter("txtloc")+"')";
                con.executeCommand(insqry);
                
            }
        %>
        <form method="post">
        <table border="3" align="center">
            <tr>
                <td>
                   Name
                </td>
                <td><input type="text" name="txtloc" placeholder="Enter location name"></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" name="Save" value="Save">
                    <input type="reset" name="cancel" value="reset">
                </td>
            </tr>
        </table>
            </form>
    </body>
</html>
