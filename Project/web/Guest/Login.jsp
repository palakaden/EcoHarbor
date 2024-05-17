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
  <meta charset="utf-8">
  <title>EcoHarbor</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <!-- Favicons -->
  <link href="../Assets/Templates/Main/img/favicon.png" rel="icon">
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

  <link href="../Assets/Templates/Form.css" rel="stylesheet">

  <!-- =======================================================
    Theme Name: BizPage
    Theme URL: https://bootstrapmade.com/bizpage-bootstrap-business-template/
    Author: BootstrapMade.com
    License: https://bootstrapmade.com/license/
  ======================================================= -->
   <link rel="stylesheet" type="text/css" href="Assets/Form.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@page import="java.sql.ResultSet"%>
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
            <li class="menu-active"><a href="../index.html">Home</a></li>
            <li><a href="ag.jsp">Sign Up</a></li>
          <li><a href="#about">About Us</a></li>
          <li><a href="#services">Services</a></li>
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
        <form method="POST">
            <label align="left" style="color: white;  font-size: 58px; height:64px; font-family:-webkit-body ">LOGIN</label><br>
            <input type="email" name="txtmail" placeholder="Enter the email address" required style="width: 300px; height: 40px "><br>
            <input type="password" name="password" placeholder="Enter password" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" style="width: 300px; height: 40px "><br>
           <input type="submit" value="Login" name="btnsave" style="width: 100px; height: 40px; padding: 10px 20px; background-color: #20ab20; color: white;"> <br>
            <label  style="color: white; font-size: 15px; ">not a member?<a href="../Guest/ag.jsp" style="color: limegreen;">Sign up</a></label><br>
        </form>
    </body>
    <%@include file="Foot.jsp" %>
</html>
