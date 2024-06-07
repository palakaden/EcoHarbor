<%--
    Document   : Myprofile
    Created on : 5 Jan, 2024, 4:04:25 PM
    Author     : thoma
--%>

<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
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

        <link href="../Assets/Templates/Form.css" rel="stylesheet">

        <link rel="stylesheet" href="../Assets/shopreg.css">

        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>MY Profile</title>
        <style>

            body {
                margin: 0;
                padding: 0;
                background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('../Assets/Templates/Main/img/facts-bg.jpg') no-repeat center center/cover;
                min-height: 800px
            }
            .containers {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh; /* Full viewport height */
            }

            .profile-box {
                background-color: rgba(75, 72, 72, 0.26); /* Transparent background with white color */
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
                display: flex;
                align-items: center;
                margin: 0; /* Reset margin */
                max-width: 700px;
                width: 100%;
            }



            .profile-image {
                flex: 0 0 120px;
                margin-right: 20px;
            }

            .profile-image img {
                width: 150px;
                height: 150px;
                object-fit: cover;
                border-radius: 50%;
            }

            .profile-details {
                flex: 1;
                font-family: math;
                font-size: 29px;
                color: white;
            }

            .profile-details h2 {
                font-size: 24px; /* Increased font size */
                margin-bottom: 20px; /* Increased margin-bottom for more spacing */
                line-height: 1.5; /* Optional: Adjust line height for better readability */
            }

            .profile-details p {
                margin-bottom: 10px;
            }

            .profile-details label {
                display: inline-block;
                width: 80px;
                font-weight: bold;
            }
        </style>
    <body>
        <header id="header" >
            <div class="container-fluid">

                <div id="logo" class="pull-left">
                    <h1><a href="../index.html" class="scrollto">EcoHarbor</a></h1>
                    <!-- Uncomment below if you prefer to use an image logo -->
                    <!-- <a href="#intro"><img src="img/logo.png" alt="" title="" /></a>-->
                </div>

                <nav id="nav-menu-container">
                    <ul class="nav-menu">
                        <li class="menu-active"><a href="HomePage.jsp">Home</a></li>
                        <li><a href="#contacts">Contact</a></li>
                        <li><a href="../index.html">Logout</a></li>
                    </ul>
                </nav><!-- #nav-menu-container -->
            </div>
        </header>
        <%
            String sel1 = "select*from tbl_agency where agency_id='" + session.getAttribute("Agid") + "'";
            ResultSet rsa = con.selectCommand(sel1);
            if (rsa.next()) {
        %>
        <div class="containers">
            <div class="profile-box">
                <div class="profile-image">
                    <img src="../Assets/file/AgencyLogo/<%=rsa.getString("agency_logo")%>" alt="Profile Image">
                </div>
                <div class="profile-details">
                    <div>Name   : <%=rsa.getString("agency_name")%></div>
                    <div>Contact: <%=rsa.getString("agency_contact")%></div>
                    <div>Email  : <%=rsa.getString("agency_email")%></div>
                    <div>Address:     <%=rsa.getString("agency_address")%></div>
                </div>
            </div>
            <%
                }
            %>        

        </div> 
    </body>
    <%@include file="../Guest/Foot.jsp" %>
</html>
