<%-- 
    Document   : HomePage
    Created on : 12 Jan, 2024, 3:51:57 PM
    Author     : thoma
--%>

<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page  import = "java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Dashboard</title>
        <style> 
            h4{text-align: right;} 
            .row.counters .col-lg-3 span,
            .row.counters .col-lg-3 h6 {
           margin-right: -850px;
        }
            .title {
         text-align: left;
        }

  .icon {
    text-align: center;
    font-size: 2em;
    margin-bottom: 10px;
  }

        </style> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <!-------------------------------------------header---------------------------------------------------------->
        <meta charset="utf-8">
  <title>EcoHarbor</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

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
  <!------------------------------------------------------------header end------------------------------------------------------>
    </head>
    <body>
  <!--==========================
    Header
  ============================-->
  <header id="header" >
    <div class="container-fluid">
      <div id="logo" class="pull-left">
        <h1><a href="../index.html" class="scrollto">EcoHarbor</a></h1>
      </div>

      <nav id="nav-menu-container">
        <ul class="nav-menu">
            <li><a href="#portfolio">Menu</a></li>
          <li><a href="AgencyRegistration.jsp">Agency Registration</a></li>
          <li><a href="../index.html">Logout</a></li>
        </ul>
      </nav><!-- #nav-menu-container -->
    </div>
  </header><!-- #header -->        
  <!--==========================
    Intro Section
  ============================-->
  <section id="intro">
    <div class="intro-container">
      <div id="introCarousel" class="carousel  slide carousel-fade" data-ride="carousel">
        <ol class="carousel-indicators"></ol>
        <div class="carousel-inner" role="listbox">
          <div class="carousel-item active" style="background-image: url('../Assets/Templates/Main/img/intro-carousel/e2.jpg');"">
            <div class="carousel-container">
              <div class="carousel-content">
                <h2>Hello <%=session.getAttribute("Aname")%></h2>
                <p>Welcome to EcoHarbor Waste Management, where we transform waste into a greener future for Avoly. Together, we can make a significant impact on our environment and inspire change in communities worldwide.</p>
                <a href="#portfolio" class="btn-get-started scrollto">Get Started</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section><!-- #intro -->
    <!--==========================
      Portfolio Section
    ============================-->
    <section id="portfolio"  class="section-bg" >
      <div class="container">
        <div class="row portfolio-container">
          <div class="col-lg-4 col-md-6 portfolio-item filter-web wow fadeInUp" data-wow-delay="0.1s">
            <div class="portfolio-wrap">
              <figure>
                <img src="../Assets/Templates/Main/img/data.jpeg" class="img-fluid" alt=""> 
                <a href="Location.jsp" class="link-details" title="More Details"><i class="ion ion-android-open"></i></a>
              </figure>
              <div class="portfolio-info">
                <h4><a href="Location.jsp">DATA ENTRY</a></h4>
              </div>
            </div>
          </div>            
          <div class="col-lg-4 col-md-6 portfolio-item filter-app wow fadeInUp">
            <div class="portfolio-wrap">
              <figure>
                <img src="../Assets/Templates/Main/img/Changepsd.jpg" class="img-fluid" alt="">
                <a href="ChangePassword.jsp" class="link-details" title="More Details"><i class="ion ion-android-open"></i></a>
              </figure>
              <div class="portfolio-info">
                <h4><a href="ChangePassword.jsp">CHANGE PASSWORD</a></h4>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 portfolio-item filter-app wow fadeInUp" data-wow-delay="0.2s">
            <div class="portfolio-wrap">
              <figure>
                <img src="../Assets/Templates/Main/img/status.jpg" class="img-fluid" alt="">
                <a href="Userverification.jsp" class="link-details" title="More Details"><i class="ion ion-android-open"></i></a>
              </figure>
              <div class="portfolio-info">
                <h4><a href="Userverification.jsp">USER VERIFICATION</a></h4>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 portfolio-item filter-web wow fadeInUp" data-wow-delay="0.1s">
            <div class="portfolio-wrap">
              <figure>
                <img src="../Assets/Templates/Main/img/Request.jpg" class="img-fluid" alt="">
                <a href="UserRequestVerification.jsp" class="link-details" title="More Details"><i class="ion ion-android-open"></i></a>
              </figure>
              <div class="portfolio-info">
                <h4><a href="UserRequestVerification.jsp">USER REQUEST VERIFICATION</a></h4>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 portfolio-item filter-app wow fadeInUp" data-wow-delay="0.2s">
            <div class="portfolio-wrap">
              <figure>
                <img src="../Assets/Templates/Main/img/Transact.jpg"  class="img-fluid" alt="">
                <a href="AllTransactions.jsp" class="link-details" title="More Details"><i class="ion ion-android-open"></i></a>
              </figure>
              <div class="portfolio-info">
                <h4><a href="AllTransactions.jsp">TRANSACTION HISTORY</a></h4>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-card wow fadeInUp">
            <div class="portfolio-wrap">
              <figure>
                <img src="../Assets/Templates/Main/img/feedback.jpg" class="img-fluid" alt="">
                <a href="ViewFeedback.jsp" class="link-details" title="More Details"><i class="ion ion-android-open"></i></a>
              </figure>
              <div class="portfolio-info">
                <h4><a href="ViewFeedback.jsp">FEEDBACK VIEW</a></h4>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-card wow fadeInUp" data-wow-delay="0.1s">
            <div class="portfolio-wrap">
              <figure>
                <img src="../Assets/Templates/Main/img/complaint.jpg" class="img-fluid" alt="">
                <a href="ViewComplaints.jsp" class="link-details" title="More Details"><i class="ion ion-android-open"></i></a>
              </figure>
              <div class="portfolio-info">
                <h4><a href="ViewComplaints.jsp">COMPLAINT VIEW</a></h4>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section><!-- #portfolio -->
    <%@include file="../Guest/Foot.jsp" %>
    </body>
</html>
