<%-- 
    Document   : wastetype.jpg
    Created on : 26 Oct, 2023, 3:41:00 PM
    Author     : thoma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet" %>
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
                if(request.getParameter("txtid")=="")
                {
                String insqry="insert into tbl_wastetype(wastetype_name,wastetype_rate)values('"+request.getParameter("txtwaste")+"','"+request.getParameter("txtrate")+"')";
                con.executeCommand(insqry);
                }
                else
                {
                    
                    String uq ="update tbl_wastetype set wastetype_name='"+request.getParameter("txtwaste")+"',wastetype_rate='"+request.getParameter("txtrate")+"'where wastetype_id ='"+request.getParameter("txtid")+"'";
                    con.executeCommand(uq);
                    response.sendRedirect("Wastetype.jsp");
                }
            }
            if(request.getParameter("did")!=null)
            {
                String delqry="delete from tbl_wastetype where wastetype_id='"+request.getParameter("did")+"'";
                con.executeCommand(delqry);
                response.sendRedirect("Wastetype.jsp");
            }
              String editid="";
              String editname="";
              String editrate="";
              if(request.getParameter("eid")!=null)
              {
                  String selqury1="select*from tbl_wastetype where wastetype_id = '"+request.getParameter("eid")+"'";
                  ResultSet rs1 = con.selectCommand(selqury1);
                  rs1.next();
                  editid=rs1.getString("wastetype_id"); 
                  editname=rs1.getString("wastetype_name");
                  editrate=rs1.getString("wastetype_rate");
              }
        %>
        <form method="POST">
            <table border="2" align="center">
                <tr>
                    <td>WasteType Name</td>
                    <td> <input type="text" name="txtwaste" placeholder="Enter Waste Type" value="<%=editname%>">
                    <input type="hidden" name="txtid" value="<%=editid%>"
                    </td>
                    
                </tr>
                <tr>
                    <td>Rate</td>
                    <td> <input type="text" name="txtrate"placeholder="Enter waste rate " value="<%=editrate%>">
                    <input type="hidden" name="txtid" value="<%=editid%>"
                    </td>
                  
                </tr>
                
                <tr>
                    <td colspan="2" align="center">
                    <input type="submit" name="submit" value="save">
                    <input type="reset" name="cancel" value="cancel"></td>
                </tr>
                    
            </table>
            <table border="1" align="center">
                <tr>
                    <th>Sl No</th>
                    <th>Name</th>
                    <th>Rate</th>
                    <th>Action</th>
                </tr>
                <%
            String selqry="select * from tbl_wastetype";
            ResultSet rs=con.selectCommand(selqry);
            int i=0;
            while(rs.next())
            {
                i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("wastetype_name")%>
                    <td><%=rs.getString("wastetype_rate")%>
                    <td><a href="Wastetype.jsp?did=<%=rs.getString("wastetype_id")%>">delete</a>|<a href="Wastetype.jsp?eid=<%=rs.getString("wastetype_id")%>">Edit</a></td>
                </tr>
                <%
            }
            %>
            
               
            
            </table>
        </form>
    </body>
</html>
