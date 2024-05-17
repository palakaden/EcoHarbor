<%-- 
    Document   : UserRegistration
    Created on : 27 Oct, 2023, 11:23:18 PM
    Author     : thoma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <%@page import="java.sql.ResultSet" %>
    <head>
         <link rel="stylesheet" type="text/css" href="Assets/Style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Registration</title>
    </head>
     <%@include file="Head.jsp" %>
    <body>
        <form method="post" enctype="multipart/form-data" action="../Assets/ActionPages/UserUploadAction.jsp">
            <table border="3" align="center">
                <tr>
                    <td>Name</td>
                    <td>
                        <input type="text" name="txtname" placeholder="Enter Name" title="Name Allows Only Alphabets,Spaces and First Letter Must Be Capital Letter" pattern="^[A-Z]+[a-zA-Z ]*$" required>
                    </td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td>
                        <input type="text" name="txtcontact" placeholder="Enter Contact No" title="Phone number with 7-9 and remaing 9 digit with 0-9" pattern="[7-9]{1}[0-9]{9}" required>
                    </td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td>
                        <input type="email" name="txtemail" placeholder="Enter Email-Id" required>
                    </td>
                </tr>
                <tr>
                    <td>Gender</td>
                    <td>
                        Male<input type="radio" name="txtfe" value="Male" required>
                        Female<input type="radio" name="txtfe" value="Female">
                        Others<input type="radio" name="txtfe" value="Others">
                    </td>
                </tr>
                <tr>
                    <td>Photo</td>
                    <td align="center">
                        <input type="file" name="file_photo" required>
                    </td>   
                </tr>
                <tr>
                    <td>Adhar Proof</td>
                    <td align="center">
                        <input type="file" name="file_proof" required>
                    </td>   
                </tr>
                <tr>
                    <td>Property No</td>
                    <td>
                        <input type="text" name="txthno"placeholder="Enter Property No" required>
                    </td>
                </tr>
                <tr>
                    <td>Location</td>
                    <td>
                        <select name="ddlLoc" onchange = "getWard(this.value)" required> <!--Here onchange triggers the function getWard()-->
                            <option value="aa">--select location--</option>
                            <%
                                String sel = "select*from tbl_location";  /*Here data from table location is fecthed*/

                                ResultSet rs = con.selectCommand(sel); /*Here there select query is exectued into ResultSet array*/

                                while (rs.next()) /*Using while loop we iterate every values in the array and pass the value into Drop down list*/ {
                            %>
                            <option value="<%=rs.getString("location_id")%>"><%=rs.getString("location_name")%></option> <!--Values from -->
                            <%
                                }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Ward</td>
                    <td>
                        <select name="ddlWard" id = "selward" > <!--Here we create an id for the Ward Drop down List -->
                            <option>--select Ward--</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td>
                        <textarea name="address" placeholder="Enter Address" required></textarea>
                    </td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td>
                        <input type="password" name="txtpsswd" placeholder="Enter Password" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required>
                    </td>
                </tr>
                <tr>
                    <td>Confirm Password</td>
                    <td>
                        <input type="password" name="txtcpsswd" placeholder="ReEnter Password" required>
                    </td>
                </tr>         
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="txtsave" value="Save">
                        <input type="reset" name="txtcancel" value="Cancel">
                    </td>
                </tr>
            </table>
        </form>
    </body><br><br><br><br><br><br><br><br><br>
    <%@include file="Foot.jsp" %>
    <script src="../Assets/JQuery/jQuery.js"></script> <!--The jQuery (Javascript Library) file in the specified directory is being processed here-->         
    <script>
                            function getWard(wid) /*Here the function is being defined were parameter is being passed*/
                            {

                                //  alert(wid);  
                                $.ajax({url: "../Assets/AjaxPages/AjaxWard.jsp?wid=" + wid, /*Here we use the $.ajax for passing the parameter value into the ajaxward file*/
                                    success: function(result) { /*If the function is invoked successfully*/
                                        $("#selward").html(result); /*We pass the value into the Ward drop down list using its drop down list id*/
                                    }
                                })
                            }

    </script>
</html>