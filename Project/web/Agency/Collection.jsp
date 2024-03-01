<%-- 
    Document   : Collection.jsp
    Created on : 26 Feb, 2024, 5:10:24 PM
    Author     : thoma
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page  import = "java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Collection</title>
    </head>
    <%

        if (request.getParameter("txtsave") != null) {
            String sqz = "select*from tbl_request r inner join tbl_user u on r.user_id = u.user_id where r.request_id ='" + request.getParameter("cid") + "'";
            ResultSet rsz = con.selectCommand(sqz);
            while (rsz.next()) {
                String sq1z = "select*from tbl_requesttype l inner join tbl_wastetype t on l.wastetype_id = t.wastetype_id where request_id ='" + request.getParameter("cid") + "'";
                ResultSet rs2z = con.selectCommand(sq1z);
                while (rs2z.next()) {
                    String updString = "update tbl_requesttype set requesttype_qty='" + request.getParameter(rs2z.getString("wastetype_id")) + "' where requesttype_id='" + rs2z.getString("requesttype_id") + "'";
                    con.executeCommand(updString);
                }
            }
            String upString = "update tbl_request set actual_amount='" + request.getParameter("resultText") + "' where request_id='" + request.getParameter("cid") + "'";
            if (con.executeCommand(upString)) {
                response.sendRedirect("UserRequestDetails.jsp");
            }
        }

    %>
    <body>
        <table border="1" align="center">         
            <tr>
                <th>SI.No</th>
                <th>User Name</th>
                <th>Contact</th>
                <th>Address</th>
                <th>Request Date</th>
                <th>Property Number</th>
            </tr>    
            <tr>
                <%                    
                    String sq = "select*from tbl_request r inner join tbl_user u on r.user_id = u.user_id where r.request_id ='" + request.getParameter("cid") + "'";
                    ResultSet rs = con.selectCommand(sq);
                    int i = 0;
                    while (rs.next()) {
                        i++;
                %>       
                <td><%=i%></td>
                <td><%=rs.getString("user_name")%></td>
                <td><%=rs.getString("user_contact")%></td>
                <td><%=rs.getString("user_address")%></td>
                <td><%=rs.getString("request_date")%></td>
                <td><%=rs.getString("user_propertyno")%></td>
            </tr>        
            <%
                }
            %>        
        </table><br> 
        <form method="post">
            <h1 align="center">Enter Quantity</h1>
            <%
                String sq1 = "select*from tbl_requesttype l inner join tbl_wastetype t on l.wastetype_id = t.wastetype_id where request_id ='" + request.getParameter("cid") + "'";
                ResultSet rs2 = con.selectCommand(sq1);
                while (rs2.next()) {
            %>
            <br>
            <div align="center">
                <label><%=rs2.getString("wastetype_name")%></label>
                : <input onkeyup="calcAmount(this)" type="number" name="<%=rs2.getString("wastetype_id")%>" alt="<%=rs2.getString("wastetype_rate")%>">
                * <label><%=rs2.getString("wastetype_rate")%></label>
                = <label id="<%=rs2.getString("wastetype_id")%>" class="allAmount">0</label>
            </div>
            <%
                }
            %>
            <br>
            <p id="result"></p>
            <input type="hidden" name="resultText" id="resultText">
            <div align="center">
                <input type="submit" name="txtsave" value="Submit">
            </div>
        </form>    
    </body>
    <script>
                function calcAmount(id)
                {
                const textBox = id.value;
                        const amount = id.alt;
                        if (textBox >= 2)
                {
                document.getElementById(id.name).innerHTML = textBox * ((amount * 10) / 100);
                }
                else
                {
                document.getElementById(id.name).innerHTML = 0;
                }
                getTotal()
                }
        function getTotal() {
        var elements = document.getElementsByClassName('allAmount');
                var total = 0;
                for (var i = 0; i < elements.length; i++)
        {
        total += parseInt(elements[i].innerText);
        }
        document.getElementById('result').innerText = 'Total: ' + total;
                document.getElementById('resultText').value = total;
        }

    </script>

</html>