<%-- 
    Document   : Ward
    Created on : 27 Oct, 2023, 10:15:49 PM
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
            if (request.getParameter("submit") != null) {
                if (request.getParameter("txtid")!="") {
                    String uq = "update tbl_ward set ward_no='" + request.getParameter("textname") + "',location_id='" + request.getParameter("location") + "' where ward_id='" + request.getParameter("txtid") + "'";
                    con.executeCommand(uq);
                    response.sendRedirect("Ward.jsp");
                } else {
                    String insqry = "insert into tbl_ward(ward_no,location_id)values('" + request.getParameter("textname") + "','" + request.getParameter("location") + "')";
                    con.executeCommand(insqry);
                }
            }
            if (request.getParameter("did") != null) {
                String delqry = "delete from tbl_ward where ward_id='" + request.getParameter("did") + "'";
                con.executeCommand(delqry);
                response.sendRedirect("Ward.jsp");

            }
            String editwardid = "";
            String editwardno = "";
            String editlocid = "";
            if (request.getParameter("eid") != null) {
                String selqry1 = "select * from tbl_ward where ward_id='" + request.getParameter("eid") + "'";
                ResultSet rs1 = con.selectCommand(selqry1);
                rs1.next();
                editwardid = rs1.getString("ward_id");
                editwardno = rs1.getString("ward_no");
                editlocid = rs1.getString("location_id");
            }

        %>

        <form method="POST">

            <table border="3" align="center">
                <tr>
                    <td>Location</td>
                    <td>
                        <select name="location">
                            <option>--select Location--</option>
                            <%  String selqry = "select*from tbl_location";
                                ResultSet rs = con.selectCommand(selqry);

                                while (rs.next()) {

                            %>
                            <option value="<%=rs.getString("location_id")%>"<% if (rs.getString("location_id").equals(editlocid)) {
                                          out.print("selected");
                                      }%>><%=rs.getString("location_name")%></option>  
                            <%
                                }
                            %>
                        </select>
                    </td>

                </tr>
                <tr>
                    <td>Number</td>
                    <td><input type="text" name="textname" placeholder="Enter ward no" value="<%=editwardno%>">
                        <input type="hidden" name="txtid" value="<%=editwardid%>" </td>
                </tr>             
                <tr>
                    <td colspan = "2" align = "center">
                        <input type="submit" name="submit" value="save">
                        <input type="reset" name="cancel" value="cancel"></td>
                </tr>
            </table>
            <table  border="2" align="center">
                <tr>
                    <th>serial no</th>
                    <th>ward no</th>
                    <th>location</th>
                    <th>action</th>

                </tr>
                <%
                    String insqry = "select*from tbl_ward w inner join tbl_location l on l.location_id=w.location_id";
                    ResultSet rs1 = con.selectCommand(insqry);
                    int i = 0;
                    while (rs1.next()) {
                        i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs1.getString("ward_no")%></td>
                    <td><%=rs1.getString("location_name")%></td>
                    <td><a href="Ward.jsp?did=<%=rs1.getString("ward_id")%>">delete</a>|<a href="Ward.jsp?eid=<%=rs1.getString("ward_id")%>">edit</a></td>
                </tr>
                <%
                    }
                %>
            </table>
        </form>
    </body>
</html>
