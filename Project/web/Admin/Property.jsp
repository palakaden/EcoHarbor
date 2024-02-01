<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <%@page import="java.sql.ResultSet" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Property</title>
    </head>
    <body>
        <%
            if(request.getParameter("txtsave")!=null)
            {
                if(request.getParameter("txtid")=="")
                {
                    String iq = "insert into tbl_property(ward_id,property_no,property_ownername)values('"+request.getParameter("ddlWard")+"','"+request.getParameter("txtprop")+"','"+request.getParameter("txtname")+"')";
                    con.executeCommand(iq);
                }
                else 
                {
                    String uq = "update tbl_property set ward_id = '"+request.getParameter("ddlWard")+"',property_no = '"+request.getParameter("txtprop")+"'where property_id = '"+request.getParameter("txtid")+"',property_ownername = '"+request.getParameter("txtname")+"'where property_id = '"+request.getParameter("txtid")+"'";
                    con.executeCommand(uq);
                    response.sendRedirect("Property.jsp");                    
                }   
            }
            if(request.getParameter("did")!=null)
            {
                String dq = "delete from tbl_property where property_id = '"+request.getParameter("did")+"'";
                con.executeCommand(dq);
                response.sendRedirect("Property.jsp");
            }
            String editwid="";
            String editid="";
            String editpno="";
            String editname="";
            if(request.getParameter("eid")!=null)
            {
                String sq2 = "select*from tbl_property where property_id ='"+request.getParameter("eid")+"'";
                ResultSet rs2 = con.selectCommand(sq2);
                rs2.next();
                editwid = rs2.getString("ward_id");
                editid = rs2.getString("property_id");
                editpno = rs2.getString("property_no");
                editname = rs2.getString("property_ownername");
            }
            
        %>        
        <form method="post">
            <table align="center" border="1">
                <tr>
                    <td>Property No</td>
                    <td>
                        <input type="text" name="txtprop" required value="<%=editpno%>">
                        <input type="hidden" name = "txtid" value="<%=editid%>">
                    </td>
                </tr>
                <tr>
                    <td>Ward No</td>
                    <td>
                        <select name="ddlWard" required> 
                            <option>--select ward--</option>
                            <%
                                String sel = "select*from tbl_ward";  

                                ResultSet rs = con.selectCommand(sel); 

                                while (rs.next()) 
                                {
                            %>
                            <option value = "<%=rs.getString("ward_id")%>" <% if(rs.getString("ward_id").equals(editwid)) { out.print("selected"); } %>><%=rs.getString("ward_no")%></option>
                            <%
                                }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Ownername</td>
                    <td><input type="text" name="txtname" value="<%=editname%>"></td>
                     <input type="hidden" name = "txtid" >
                </tr>
                <tr>
                    <td align="center" colspan="2">
                        <input type="submit" name="txtsave" value="Submit">
                        <input type="reset" name="txtcancel" value="Cancel">
                    </td>
                </tr>
            </table>
            <table border="1" align="center">
                <tr>
                    <th>SI.No</th>
                    <th>Property No</th>
                    <th>Ward No</th>
                    <th>Ownername</th>
                </tr>
                <%
                       String sq1 = "select * from tbl_property w inner join tbl_ward l on w.ward_id = l.ward_id";
                       ResultSet rs1 = con.selectCommand(sq1);
                       int i=0;
                       while(rs1.next())
                       {
                           i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs1.getString("property_no")%></td>
                    <td><%=rs1.getString("ward_no")%></td>
                    <td><%=rs1.getString("property_ownername")%></td>
                    <td><a href = "Property.jsp?did=<%=rs1.getString("property_id")%>">Delete</a>|<a href = "Property.jsp?eid=<%=rs1.getString("property_id")%>">Edit</a></td>
                </tr>   
                <%
                       }
                %>
            </table>                        
        </form>
    </body>
</html>