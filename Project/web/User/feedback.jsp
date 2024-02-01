<%-- 
    Document   : feedback
    Created on : 27 Oct, 2023, 11:09:19 PM
    Author     : thoma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="POST">
            <table border="3" align="center">
                <tr>
                    <td>Content</td>
                    <td><textarea name="textcontent"  rowa="20" cols="20" placeholder="Enter content"></textarea></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                      <input type="submit" value="submit" name="save">
                     <input type="reset" value="cancel" name="cancel">   
                    </td>
                </tr>
            </table>
           </form>
    </body>
</html>
