<%-- 
    Document   : EditProfile
    Created on : 5 Jan, 2024, 4:15:40 PM
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
        <%
            if(request.getParameter("txtsave")!=null)
            {
              String upqry = "update tbl_agency set agency_name = '"+request.getParameter("txttitle")+"',agency_contact = '"+request.getParameter("txtcontact")+"',agency_email = '"+request.getParameter("txtemail")+"',agency_address = '"+request.getParameter("txtaddress")+"'where agency_id = '"+session.getAttribute("Agid")+"'";
              con.executeCommand(upqry);
              response.sendRedirect("Myprofile.jsp");
            }   
            String editname="";
            String editemail="";        
            String editcontact="";
            String editaddress="";
            String selqry = "select*from tbl_agency where agency_id ='"+session.getAttribute("Agid")+"'";
            ResultSet rs=con.selectCommand(selqry);
            rs.next();
            editname=rs.getString("agency_name");
            editemail=rs.getString("agency_email");
            editcontact=rs.getString("agency_contact");
            editaddress=rs.getString("agency_address");
        %>
        <form method="POST">
            <table border="3" align="center">
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txttitle" value="<%=editname%>" placeholder="Enter name" title="Name Allows Only Alphabets,Spaces and First Letter Must Be Capital Letter" pattern="^[A-Z]+[a-zA-Z ]*$" required</td>
                </tr>
                 <tr>
                <td>Contact</td>
                    <td><input type="text" name="txtcontact" value="<%=editcontact%>" placeholder="Enter contact No" pattern="[7-9]{1}[0-9]{9}" title="Phone number starting with 7-9 and remaing 9 digit with 0-9" required></td>
                </tr>
                 <tr>
                    <td>Email</td>
                    <td><input type="email" name="txtemail" value="<%=editemail%>" placeholder="Enter the email address" required</td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><textarea placeholder="Enter address" name="txtaddress"  required ><%=editaddress%></textarea></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="Update" name="txtsave">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
