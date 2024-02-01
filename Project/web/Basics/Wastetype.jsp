<%-- 
    Document   : wastetype.jpg
    Created on : 26 Oct, 2023, 3:41:00 PM
    Author     : thoma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if(request.getParameter("submit")!=null)
            {
                String insqry="insert into tbl_wastetype(wastetype_name,wastetype_rate)values('"+request.getParameter("txtwaste")+"','"+request.getParameter("txtrate")+"')";
                con.executeCommand(insqry);
            }
        %>
        <form method="POST">
            <table border="3" align="center">
                <tr>
                    <td>WasteType Name</td>
                    <td> <input type="text" name="txtwaste"></td>
                </tr>
                <tr>
                    <td>Rate</td>
                    <td> <input type="text" name="txtrate"></td>
                  
                </tr>
                
                <tr>
                    <td colspan="2" align="center">
                    <input type="submit" name="submit" value="save">
                    <input type="reset" name="cancel" value="cancel"></td>
                </tr>
                    
            </table>
        </form>
    </body>
</html>
