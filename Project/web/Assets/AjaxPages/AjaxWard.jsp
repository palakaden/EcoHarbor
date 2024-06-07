<%-- 
    Document   : AjaxWard
    Created on : 15 Dec, 2023, 2:58:31 PM
    Author     : thoma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%
    String selqry = "select*from tbl_ward where location_id ='" + request.getParameter("wid") + "'";
    ResultSet rs = con.selectCommand(selqry);
    while (rs.next()) {
%>
<option value="<%=rs.getString("ward_id")%>" style="color:black;"><%=rs.getString("ward_no")%> </option>
<%
    }
%>
