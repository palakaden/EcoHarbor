<%-- 
    Document   : Property
    Created on : Jan 11, 2024, 10:33:52 AM
    Author     : thoma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <%@page import="java.sql.ResultSet" %>
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

        <link rel="stylesheet" href="../Assets/CSS/shopreg.css">
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Property Entry</title>
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
                    max-width: 780px;
                    margin: auto;
                    padding: 20px;
                    border-radius: 5px;
                    background-color: rgba(249, 249, 249, 0.1);
                    margin-top: 100px;
                    margin-bottom: 100px;
                    width: 780px;

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
                    margin-bottom: 330px;
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
                        <li><a style="color:white;">Entry Options</a>
                            <ul>
                                <li><a href="Location.jsp">Location Entry</a></li>
                                <li><a href="WasteType.jsp">Waste Type Entry</a></li>
                                <li><a href="Ward.jsp">Ward Entry</a></li>
                            </ul>
                        </li>
                        <li><a href="../Guest/Login.jsp">Logout</a></li>
                    </ul>
                </nav><!-- #nav-menu-container -->
            </div>
        </header><!-- #######################################header############################################ -->        
        <%
             if(request.getParameter("txtreset")!=null)
             {
                  response.sendRedirect("Property.jsp");    
             }
            if(request.getParameter("txtsave")!=null)
            {
                if(request.getParameter("txtid").equals(""))
                {
                    String iq = "insert into tbl_property(ward_id,property_no,property_ownername)values('"+request.getParameter("ddlWard")+"','"+request.getParameter("txtprop")+"','"+request.getParameter("txtown")+"')";
                    con.executeCommand(iq);
                }
                else 
                {
                    String uq = "update tbl_property set ward_id = '"+request.getParameter("ddlWard")+"',property_no = '"+request.getParameter("txtprop")+"',property_ownername = '"+request.getParameter("txtown")+"'where property_id = '"+request.getParameter("txtid")+"'";
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
            String editown ="";
            if(request.getParameter("eid")!=null)
            {
                String sq2 = "select*from tbl_property where property_id ='"+request.getParameter("eid")+"'";
                ResultSet rs2 = con.selectCommand(sq2);
                rs2.next();
                editwid = rs2.getString("ward_id");
                editid = rs2.getString("property_id");
                editpno = rs2.getString("property_no");
                editown = rs2.getString("property_ownername");
            }
            
        %>   
        <div class="formbold-main-wrapper">
        <div class="formbold-form-wrapper">        
        <form method="post">
                    <div class="formbold-form-title">
                        <h2 align="center">PROPERTY ENTRY</h2>
                    </div> 
                    <label class="formbold-form-label">Property No</label> 
                    <div class="formbold-mb-3">
                        <input type="text" class="formbold-form-input" placeholder="Enter Property Number" name="txtprop" required value="<%=editpno%>">
                        <input type="hidden" name = "txtid" value="<%=editid%>">
                    </div>    
                    <label class="formbold-form-label">Ward No</label> 
                    <div class="formbold-input-flex">
                        <select name="ddlWard" class="formbold-form-input" required> 
                            <option value="" style="color:black;">Select Ward</option>
                            <%
                                String sel = "select*from tbl_ward";  

                                ResultSet rs = con.selectCommand(sel); 

                                while (rs.next()) 
                                {
                            %>
                            <option style="color:black;" value = "<%=rs.getString("ward_id")%>" <% if(rs.getString("ward_id").equals(editwid)) { out.print("selected"); } %>><%=rs.getString("ward_no")%></option>
                            <%
                                }
                            %>
                        </select>
                    </div>  
                    <label class="formbold-form-label">Property Ownername</label> 
                    <div class="formbold-mb-3">    
                        <input type="text" class="formbold-form-input" name="txtown" placeholder="Enter Owner Name" required value="<%=editown%>">
                        <input type="hidden" name = "txtid" value="<%=editid%>">
                    </div>
                    <div class="button-container">   
                        <input type="submit" class="formbold-btn" name="txtsave" value="Register">
                        <input type="submit" class="formbold-btn" name="txtreset" value="Reset"> 
                    </div>
                    </form> 
        </div>
        </div>
<div class="table-container">            
            <table border="1" align="center">
                <tr>
                    <th>SI.No</th>
                    <th>Property No</th>
                    <th>Ward No</th>
                    <th>Owner Name</th>
                    <th>Action</th>
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
                    <td><a class="choose-file-button" href = "Property.jsp?did=<%=rs1.getString("property_id")%>">Delete</a><a class="choose-file-button" href = "Property.jsp?eid=<%=rs1.getString("property_id")%>">Edit</a></td>
                </tr>   
                <%
                       }
                %>
            </table>     
    </div>
            <%@include file="../Guest/Foot.jsp" %>
    </body>
</html>
