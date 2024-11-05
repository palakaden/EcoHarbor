<%-- 
    Document   : Ward
    Created on : 27 Oct, 2023, 10:15:49 PM
    Author     : thoma
--%>


<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page  import = "java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Favicons -->
        <link href="../Assets/Templates/Main/img/favicon.jpg" rel="icon">
        <link href="../Assets/Templates/Main/img/apple-touch-icon.jpg" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Montserrat:300,400,500,700" rel="stylesheet">

        <!-- Bootstrap CSS File -->
        <link href="../Assets/Templates/Main/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Libraries CSS Files -->
        <link href="../Assets/Templates/Main/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="../Assets/Templates/Main/lib/animate/animate.min.css" rel="stylesheet">
        <link href="../Assets/Templates/Main/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
        <link href="../Assets/Templates/Main/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="../Assets/Templates/Main/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

        <!-- Main Stylesheet File -->
        <link href="../Assets/Templates/Main/css/style.css" rel="stylesheet">

        <link rel="stylesheet" href="../Assets/shopreg.css">
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Ward Entry</title>
        <style>
            body {
                margin: 0;
                padding: 0;
                background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('../Assets/Templates/Main/img/facts-bg.jpg') no-repeat center center/cover;
            }
            .choose-file-button, .formbold-btn {
                background-color: #4CAF50;
                color: white;
                border: none;
                padding: 10px 20px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                cursor: pointer;
                border-radius: 4px;
                transition: background-color 0.3s ease;
            }
            .choose-file-button:hover, .formbold-btn:hover {
                background-color: #45a049;
            }
            .button-container {
                text-align: center;
                margin-top: 20px;
            }
            .formbold-form-wrapper {
                max-width: 600px;
                margin: auto;
                padding: 20px;
                border-radius: 5px;
                background-color: rgba(249, 249, 249, 0.1);
                margin-top:-16px;
            }
            .gender-radio {
                display: inline-block;
                margin-right: 10px;
            }
            .gender-radio input[type="radio"] {
                display: none;
            }
            .gender-radio input[type="radio"] + label {
                background-color: #e7e7e7;
                color: black;
                padding: 5px 10px;
                border-radius: 4px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }
            .gender-radio input[type="radio"]:checked + label {
                background-color: #4CAF50;
                color: white;
            }
            .formbold-checkbox-wrapper input[type="checkbox"]:checked + .formbold-checkbox-inner {
                background-color: #4CAF50;
                border-color: #4CAF50;
            }
            .formbold-form-title h2 {
                font-weight: 400;
                font-size: 33px;
                line-height: 34px;
                color: #fff;
            }    
            .formbold-form-label {
                color: white;
                font-size: 16px;
                line-height: 24px;
                display: block;
                margin-bottom: 10px;
            }
            .formbold-form-input, select, textarea {
                background: transparent;
                color: white;
                border: 1px solid white;
                border-radius: 4px;
                padding: 10px;
                width: 100%;
                box-sizing: border-box;
                margin-bottom: 15px;
            }
            .formbold-form-input::placeholder, select option, textarea::placeholder {
                color: white;
            }
            span{
                color:white;
            }
            .formbold-main-wrapper {
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 127px;
                flex-direction: column;
            }
            .table-container {
                width: 100%;
                display: flex;
                flex-direction: column;
                align-items: center;
                margin-top: 100px;
                margin-bottom: 125px;
            }

            table {
                width: 80%;
                margin: -158px auto; /* Center the table horizontally */
                border-collapse: collapse;
                background-color: rgba(249, 249, 249, 0.1);
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
                color: white;
                border: 1px solid transparent; /* Makes the outer border transparent */
            }

            th, td {
                padding: 12px;
                border: 1px solid transparent; /* Makes individual cell borders transparent */
                text-align: center;
            }

            th {
                background-color: #4CAF50;
                color: white;
            }

            tr:nth-child(even) {
                background-color: rgba(255, 255, 255, 0.1);
            }

            tr:hover {
                background-color: rgba(255, 255, 255, 0.2);
            }

            h2 {
                text-align: center;
                font-weight: 400;
                font-size: 33px;
                line-height: 34px;

            }
            .choose-file-button {
                background-color: transparent;
                color: white;
                border: 2px solid white;
                padding: 10px 20px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                cursor: pointer;
                border-radius: 20px;
                transition: background-color 0.3s ease, color 0.3s ease;
            }

            .choose-file-button:hover {
                background-color: white;
                color: #4CAF50;
            }

        </style>
    </head>
    <body>
        <!--==========================
Header
============================-->
        <header id="header" >
            <div class="container-fluid">
                <div id="logo" class="pull-left">
                    <h1><a href="../index.html" class="scrollto">EcoHarbor</a></h1>
                    <!-- Uncomment below if you prefer to use an image logo -->
                    <!-- <a href="#intro"><img src="img/logo.png" alt="" title="" /></a>-->
                </div>

                <nav id="nav-menu-container">
                    <ul class="nav-menu">
                        <li><a href="HomePage.jsp">Home</a></li>
                        <li><a href="">Entry Options</a>
                            <ul>
                                <li><a href="Location.jsp">Location Entry</a></li>
                                <li><a href="Wastetype.jsp">Waste Type Entry</a></li>
                                <li><a href="Property.jsp">Property Entry</a></li>
                            </ul>
                        </li>
                        <li><a href="../Guest/Login.jsp">Logout</a></li>
                    </ul>
                </nav><!-- #nav-menu-container -->
            </div>
        </header><!-- #######################################header############################################ -->


        <%
            if (request.getParameter("btn_reset") != null)
            {
                response.sendRedirect("Ward.jsp");
            }
            if (request.getParameter("btn_save") != null) {
                if (request.getParameter("txtid").equals("")) {
                    String iq = "insert into tbl_ward(location_id,ward_no)values('" + request.getParameter("ddlWard") + "','" + request.getParameter("txtwardno") + "')";
                    con.executeCommand(iq);
                } else {
                    String uq = "update tbl_ward set location_id = '" + request.getParameter("ddlWard") + "',ward_no = '" + request.getParameter("txtwardno") + "'where ward_id = '" + request.getParameter("txtid") + "'";
                    con.executeCommand(uq);
                    response.sendRedirect("Ward.jsp");
                }
            }
            if (request.getParameter("did") != null) {
                String dq = "delete from tbl_ward where ward_id = '" + request.getParameter("did") + "'";
                con.executeCommand(dq);
                response.sendRedirect("Ward.jsp");
            }
            String editlid = "";
            String editid = "";
            String editwno = "";
            if (request.getParameter("eid") != null) {
                String sq2 = "select*from tbl_ward where ward_id ='" + request.getParameter("eid") + "'";
                ResultSet rs2 = con.selectCommand(sq2);
                rs2.next();
                editlid = rs2.getString("location_id");
                editid = rs2.getString("ward_id");
                editwno = rs2.getString("ward_no");
            }

        %>
        <div class="formbold-main-wrapper">
            <div class="formbold-form-wrapper">

                <form method="post">    
                    <div class="formbold-form-title">
                        <h2 align="center">WARD ENTRY</h2>
                    </div> 

                    <select name="ddlWard" class="formbold-form-input" required>
                        <option value="" style="color:black;">--select location--</option>
                        <%                        String sq = "select*from tbl_location";
                            ResultSet rs = con.selectCommand(sq);
                            while (rs.next()) {
                        %>
                                <option style="color:black;" value = "<%=rs.getString("location_id")%>" <% if (rs.getString("location_id").equals(editlid)) {
                                        out.print("selected");
                                    }%>><%=rs.getString("location_name")%></option>
                        <%
                            }
                        %>
                    </select>

                    <div class="formbold-mb-3">
                        <input type="text" name="txtwardno" class="formbold-form-input" placeholder="Enter Ward No" value="<%=editwno%>"required>
                        <input type="hidden" name = "txtid" value="<%=editid%>">
                    </div>

                    <div class="button-container">   
                        <input type="submit" class="formbold-btn" name="btn_save" value="Register">
                        <input type="submit" class="formbold-btn" name="btn_reset" value="Reset"> 
                    </div>
                </form>  
            </div>

        </div>
        <div class="table-container">
            <table border="1" align="center">  
                <tr>
                    <th>SI.No</th>
                    <th>Location Name</th>
                    <th>Ward No</th>
                    <th>Action</th>
                </tr>
                <%
                    String sq1 = "select * from tbl_ward w inner join tbl_location l on w.location_id = l.location_id";
                    ResultSet rs1 = con.selectCommand(sq1);
                    int i = 0;
                    while (rs1.next()) {
                        i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs1.getString("location_name")%></td>
                    <td><%=rs1.getString("ward_no")%></td>
                    <td><a class="choose-file-button" href = "Ward.jsp?did=<%=rs1.getString("ward_id")%>">Delete</a>|<a class="choose-file-button" href = "Ward.jsp?eid=<%=rs1.getString("ward_id")%>">Edit</a></td>
                </tr>   
                <%
                    }
                %>
            </table>    
        </div>


        <%@include file="../Guest/Foot.jsp" %>
    </body>
</html>
