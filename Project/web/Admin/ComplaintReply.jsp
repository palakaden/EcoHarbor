<%-- 
    Document   : ComplaintReply
    Created on : 17 May, 2024, 10:58:07 AM
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
            String seleQry = "select * from tbl_complaint f inner join tbl_user u on f.user_id=u.user_id where f.complaint_id ='" + request.getParameter("cid") + "'";
            ResultSet ress = con.selectCommand(seleQry);
            if (ress.next()) 
            {
        %>
        <table border="1" align="center">
            <tr>
                <td>User Name</td> 
                <td>Property NO</td>
                <td>Date</td>
                <td>Complaint content</td>
            </tr>
            <tr>
                <td><%=ress.getString("user_name")%></td>
                <td align="center"><%=ress.getString("user_propertyno")%></td>
                <td><%=ress.getString("complaint_date")%></td>
                <td><%=ress.getString("complaint_content")%></td>
            </tr>
        </table>
            <%
                }
            %>
            
            <%
            String seQry = "select * from tbl_complaint f inner join tbl_agency u on f.agency_id=u.agency_id where f.complaint_id ='" + request.getParameter("cid") + "'";
            ResultSet r = con.selectCommand(seQry);
            if (r.next()) 
            {
                    %>                
            <table border="1" align="center">
            <tr>
                <td>Agency Name</td> 
                <td>Date</td>
                <td>Complaint content</td>
            </tr>
            <tr>
                <td><%=r.getString("agency_name")%></td>
                <td><%=r.getString("complaint_date")%></td>
                <td><%=r.getString("complaint_content")%></td>
            </tr>
            <%
                }
            %>
            </table>
            <%
            if(request.getParameter("btn_submit")!=null)
            {
                String uq = "update tbl_complaint set complaint_reply='"+request.getParameter("reply_content")+"' where complaint_id = '"+request.getParameter("cid")+"'";
                if(con.executeCommand(uq)){ %>
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
        <td>Complaint Reply</td>
        <td>
        <textarea name="reply_content" rows="6" cols="20"></textarea>
        </td>
        </tr>
        <tr>
        <td colspan="2" align="center"><input type="submit" name="btn_submit" value="Register">&nbsp&nbsp<input type="reset" name="btn_reset" value="Reset"</td>
        </tr>
        </table>
        </form>
    </body>
</html>
        