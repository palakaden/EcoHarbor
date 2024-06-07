<%--
    Document   : Login
    Created on : 5 Jan, 2024, 4:04:25 PM
    Author     : thoma
--%>

<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>EcoHarbor</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicons -->
        <link href="../Assets/Templates/Main/img/favicon.jpg" rel="icon">
        <link href="../Assets/Templates/Main/img/apple-touch-icon.png" rel="apple-touch-icon">

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


        <!-- =======================================================
          Theme Name: BizPage
          Theme URL: https://bootstrapmade.com/bizpage-bootstrap-business-template/
          Author: BootstrapMade.com
          License: https://bootstrapmade.com/license/
        ======================================================= -->
        <link rel="stylesheet" type="text/css" href="Assets/Form.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@page import="java.sql.ResultSet"%>
        <title>EcoHarbor</title>
        <style>

            .login-box {
                position: relative;
                width: 400px;
            }
            .login-box form {
                width: 100%;
                padding: 0 50px;
            }


            .input-box {
                position: relative;
                margin: 9px 0;
            }
            .input-box input {
                width: 100%;
                height: 50px;
                background: transparent;
                border: 2px solid #00b605;
                outline: none;
                border-radius: 40px;
                font-size: 1em;
                color: white;
                padding: 0 20px;
                transition: .5s ease;
            }
            .input-box input:focus,
            .input-box input:valid {
                border-color:white;
            }
            .input-box label {
                position: absolute;
                top: 50%;
                left: 20px;
                transform: translateY(-50%);
                font-size: 1em;
                color: #fff;
                pointer-events: none;
                transition: .5s ease;
            }
            .input-box input:focus~label,
            .input-box input:valid~label {
                top: 1px;
                font-size: 15px;
                padding: 0 6px;
                color: white;
            }
            .input-box-submit { 
                width: 100%; 
                height: 50px;
                background: transparent;
                border: 2px solid #00b605; 
                outline: none; 
                border-radius: 5px; /* Adjust this value to make the corners less or more rounded */
                font-size: 1em;
                color: white;
                padding: 0 20px; 
                transition: .5s ease;
            }

            .input-box-submit:hover, 
            .input-box-submit:focus { 
                border-color: white; 
            }

            .input-box-submit:focus { 
                background-color: #00b605; 
                color: white; 
            }
            button, input, optgroup, select, textarea {
                margin: 8px;
                font-family: inherit;
                font-size: inherit;
                line-height: inherit;
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
                        <li><a href="../index.html">Home</a></li>
                        <li><a href="UserRegistration.jsp">Sign Up</a></li>
                        <li><a href="../index.html#about">About Us</a></li>
                        <li><a href="../index.html#services">Services</a></li>
                        <li><a href="#contacts">Contact</a></li>
                    </ul>
                </nav><!-- #nav-menu-container -->
            </div>
        </header><!-- #header -->

        <div id="tab" align="center">
            <!--==========================
          Intro Section
        ============================-->

            <section id="intro">
                <div class="intro-container">
                    <div class="carousel-inner" role="listbox">
                        <div class="carousel-item active" style="background-image: url('../Assets/Templates/Main/img/intro-carousel/11.jpg');">
                            <div class="carousel-container">
                                <div class="carousel-content">
                                    <%
                                        if (request.getParameter("btnsave") != null) {
                                            String email = request.getParameter("txtmail");
                                            String password = request.getParameter("password");
                                            int sts = 0;
                                            String seluser = "select*from tbl_user where user_email= '" + email + "' and user_password ='" + password + "'";
                                            String seladmin = "select*from tbl_admin where admin_email= '" + email + "' and admin_password ='" + password + "'";
                                            String selagency = "select*from tbl_agency where agency_email= '" + email + "' and agency_password ='" + password + "'";
                                            ResultSet rsU = con.selectCommand(seluser);
                                            ResultSet rsA = con.selectCommand(seladmin);
                                            ResultSet rsAg = con.selectCommand(selagency);
                                            if (rsU.next()) {
                                                sts = rsU.getInt("user_status");
                                                if (sts == 0)//property table ill illa
                                                {
                                    %>
                                    <script>
                                        alert("Pending verification");
                                        window.location = "Login.jsp";
                                    </script>
                                    <%
                                    } else if (sts == 1)//property table ond but admin nokkittila
                                    {
                                    %>
                                    <script>
                                        alert("Pending verification");
                                        window.location = "Login.jsp";
                                    </script>
                                    <%
                                    } else if (sts == 3)//rejected
                                    {
                                    %>
                                    <script>
                                        alert("Rejected User");
                                        window.location = "Login.jsp";
                                    </script>
                                    <%
                                        } else {
                                            session.setAttribute("uid", rsU.getString("user_id"));
                                            session.setAttribute("uname", rsU.getString("user_name"));
                                            response.sendRedirect("../User/HomePage.jsp");
                                        }
                                    } else if (rsA.next()) {
                                        session.setAttribute("Aid", rsA.getString("admin_id"));
                                        session.setAttribute("Aname", rsA.getString("admin_name"));
                                        response.sendRedirect("../Admin/HomePage.jsp");
                                    } else if (rsAg.next()) {
                                        session.setAttribute("Agid", rsAg.getString("agency_id"));
                                        session.setAttribute("Agname", rsAg.getString("agency_name"));
                                        response.sendRedirect("../Agency/HomePage.jsp");
                                    } else {
                                    %>
                                    <script>
                                        alert("invalid credentilas");
                                        window.location = "Login.jsp";//password thettiya same pg illot varan
                                    </script>
                                    <%
                                            }

                                        }


                                    %>


                                    <div class="login-box">
                                        <h2 style="color: #black; margin-bottom: 7px; font-size: 60px;  font-weight: 700;">Login</h2>
                                        <form method="action">
                                            <div class="input-box">
                                                <input type="email" name="txtmail"  required>
                                                <label>Email</label>
                                            </div>
                                            <div class="input-box">
                                                <input type="password" name="password"  required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" >
                                                <label>Password</label>
                                            </div>
                                            <input type="submit" value="Login" name="btnsave" style="width: 100%; height: 50px; border-radius: 28px; background: transparent; border: 2px solid #00b605; color: white; padding: 10px 20px; transition: border-color 0.3s ease; float: left;">



                                            <div>
                                                <label  style="color: white; font-size: 15px; ">not a member?<a href="../Guest/UserRegistration.jsp" style="color: limegreen;">Sign up</a></label>
                                            </div>
                                        </form>
                                    </div>
                                    </body>
                                    <%@include file="Foot.jsp" %>
                                    </html>