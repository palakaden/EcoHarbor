<%-- 
    Document   : UseRrequestVerification
    Created on : 18 Jan, 2024, 4:04:16 PM
    Author     : thoma
--%>
<%-- 
    Document   : UserRequestVerification
    Created on : Jan 18, 2024, 3:59:31 PM
    Author     : frank
--%>
<jsp:useBean class="DB.ConnectionClass" id = "con"></jsp:useBean>
<%@page  import = "java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Request Verification</title>
    </head>
    <body>
        <%
          if(request.getParameter("aid")!=null)
          {
              String uq = "update tbl_request set request_status ='1' where request_id = '"+request.getParameter("aid")+"'";
              con.executeCommand(uq);
          }
          if(request.getParameter("rid")!=null)
          {
              String uq1 = "update tbl_request set request_status = '2' where request_id = '"+request.getParameter("rid")+"'";
              con.executeCommand(uq1);
          }
        %>        
    <form method="post">    
        <table border="1" align="center">
            <tr>
                <th>SI.No</th>
                <th>User Id</th>
                <th>User Request Date</th>
                <th>Action</th>
                <th>Status</th>
            </tr>
            <%
                String sel="select*from tbl_request";
                ResultSet rs = con.selectCommand(sel);
                int i=0;
                while(rs.next())
                {
                    i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("user_id")%></td>
                <td><%=rs.getString("request_date")%></td>
                <td><a href = "UserRequestVerification.jsp?aid=<%=rs.getString("request_id")%>">Accept</a>|<a href = "UserRequestVerification.jsp?rid=<%=rs.getString("request_id")%>">Reject</a></td>
                <td>
                    <%
                    if(rs.getString("request_status").equals("0"))
                    {
                        out.println("User has requested");
                    }
                    if(rs.getString("request_status").equals("1"))
                    {
                        out.println("User Request is Accepted");
                    }
                    if(rs.getString("request_status").equals("2"))
                    {
                        out.println("User Request is Rejected");
                    }
                    %>
                </td>
            </tr>
            <%
                }
            %>
        </table>
    </form>
    </body>
</html>