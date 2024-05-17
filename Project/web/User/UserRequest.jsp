<%-- 
    Document   : UserRequest
    Created on : 27 Oct, 2023, 11:38:57 PM
    Author     : thoma
--%>
<jsp:useBean class="DB.ConnectionClass" id = "con"></jsp:useBean>
<%@page  import = "java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Request</title>
    </head>
    <body>
        <%
            if (request.getParameter("did") != null) {
                int count = 0;
                String rqstid = request.getParameter("rid");//request id is placed into a variable
                String delqry = "delete from tbl_requesttype where requesttype_id='" + request.getParameter("did") + "'";//code for deletting wastetype
                if (con.executeCommand(delqry)) {//delete query execute aya if
                    String selCount = "select count(*) as cout from tbl_requesttype where request_id='" + rqstid + "'";//counting data in tbl_requesttype
                    ResultSet rs = con.selectCommand(selCount);
                    if (rs.next()) {
                        count = rs.getInt("cout");//tbl_requesttype ill olla no of data eduth count ill vech
                        if (count > 0) {//1 ill kuduthal data ondakki onnum sambavikkilla
                            response.sendRedirect("UserRequest.jsp");
                        } else {//tbl_requesttype ill data illakki tbl_request ille data delete avum
                            String delQry = "delete from tbl_request where request_id='" + request.getParameter("rid") + "'";
                            if (con.executeCommand(delQry)) {
                                response.sendRedirect("UserRequest.jsp");
                            }
                        }

                    }
                }
            }


        %>
        <form method="post">
            <table border=2 align="center">
                <tr>
                    <td>WasteType</td>
                    <td>
                        <select name="ddlwst" multiple id="ddlwst">
                            <%                                String selq = "select*from tbl_wastetype";
                                ResultSet rs = con.selectCommand(selq);

                                while (rs.next()) {
                            %>
                            <option value = "<%=rs.getString("wastetype_id")%>"><%=rs.getString("wastetype_name")%></option>
                            <%
                                }

                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <button type="button" id="add">Submit</button>
                        <input type="reset" name="txtcancel" value="Cancel">
                    </td>
                </tr>
            </table>
            <br>
            <table border="2" align="center">
                <tr>
                    <td>SL NO</td>
                    <td>Waste type</td>
                    <td>Request Date</td>
                    <td>Action</td>
                </tr>
                <%  
                    String in = "select*from tbl_request w inner join tbl_requesttype l on l.request_id=w.request_id inner join tbl_wastetype t on l.wastetype_id = t.wastetype_id where user_id ='" + session.getAttribute("uid") + "'";
                    ResultSet rs2 = con.selectCommand(in);
                    int i = 0;

                    while (rs2.next()) {
                        i++;
                %>

                <tr>
                    <td><%=i%></td>
                    <td><%=rs2.getString("wastetype_name")%></td>
                    <td><%=rs2.getString("request_date")%></td>
                    <td><a href="UserRequest.jsp?did=<%=rs2.getString("requesttype_id")%>&rid=<%=rs2.getString("request_id")%>">delete</a></td>
                </tr>
                <%
                    }

                %>
            </table>
        </form>
    </body>
    <script src="../Assets/JQuery/jQuery.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', (event) => {//event
        const ddlwst = document.getElementById('ddlwst');
        const logButton = document.getElementById('add');//button id add ile value logbutton ill vechu
        logButton.addEventListener('click', function() {//calling the event
            if(confirm("Confirm Your Payment"))
            {    
            const selectedValues = Array.from(ddlwst.selectedOptions).map(option => option.value);//drop down select chytha values oke array akki store chythu 
            console.log('Selected values:', selectedValues); 
            $.ajax({url: "../Assets/AjaxPages/AjaxUr.jsp",
             type: "GET",
             data: {
                    ids: selectedValues// Pass the array here
            },
            traditional: true, // This ensures the array is serialized correctly
            dataType: "html",
            success: function(result) { 
                alert(result)
                window.location="UserRequest.jsp"
            }
            })
            }
            else{
                alert("Request Cancelled")
            }
        });
    });
        </script>
</html>