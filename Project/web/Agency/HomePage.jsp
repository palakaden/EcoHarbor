<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page  import = "java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agency Dashboard</title>
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
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="#intro"><img src="img/logo.png" alt="" title="" /></a>-->
      </div>

      <nav id="nav-menu-container">
        <ul class="nav-menu">
            <li><a href="#portfolio">Menu</a></li>
          <li><a href="#services">Rules</a></li>
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
                <h2>Hello <%=session.getAttribute("Agname")%></h2>
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
          <div class="col-lg-4 col-md-6 portfolio-item filter-app wow fadeInUp">
            <div class="portfolio-wrap">
              <figure>
                <img src="../Assets/Templates/Main/img/Myprofile.jpg" class="img-fluid" alt="">
                <a href="Myprofile.jsp" class="link-details" title="More Details"><i class="ion ion-android-open"></i></a>
              </figure>
              <div class="portfolio-info">
                <h4><a href="Myprofile.jsp">MY PROFILE</a></h4>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 portfolio-item filter-web wow fadeInUp" data-wow-delay="0.1s">
            <div class="portfolio-wrap">
              <figure>
                <img src="../Assets/Templates/Main/img/Editprofile.jpg" class="img-fluid" alt=""> 
                <a href="EditProfile.jsp" class="link-details" title="More Details"><i class="ion ion-android-open"></i></a>
              </figure>
              <div class="portfolio-info">
                <h4><a href="EditProfile.jsp">EDIT PROFILE</a></h4>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-app wow fadeInUp" data-wow-delay="0.2s">
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
          <div class="col-lg-4 col-md-6 portfolio-item filter-web wow fadeInUp" data-wow-delay="0.1s">
            <div class="portfolio-wrap">
              <figure>
                <img src="../Assets/Templates/Main/img/Request.jpg" class="img-fluid" alt="">
                <a href="UserRequestDetails.jsp" class="link-details" title="More Details"><i class="ion ion-android-open"></i></a>
              </figure>
              <div class="portfolio-info">
                <h4><a href="UserRequestDetails.jsp">USER REQUESTS VIEW</a></h4>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 portfolio-item filter-card wow fadeInUp">
            <div class="portfolio-wrap">
              <figure>
                <img src="../Assets/Templates/Main/img/feedback.jpg" class="img-fluid" alt="">
                <a href="AgencyFeedback.jsp" class="link-details" title="More Details"><i class="ion ion-android-open"></i></a>
              </figure>
              <div class="portfolio-info">
                <h4><a href="AgencyFeedback.jsp">FEEDBACK</a></h4>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-card wow fadeInUp" data-wow-delay="0.1s">
            <div class="portfolio-wrap">
              <figure>
                <img src="../Assets/Templates/Main/img/complaint.jpg" class="img-fluid" alt="">
                <a href="AgencyComplaint.jsp" class="link-details" title="More Details"><i class="ion ion-android-open"></i></a>
              </figure>
              <div class="portfolio-info">
                <h4><a href="AgencyComplaint.jsp">COMPLAINT</a></h4>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-web wow fadeInUp" data-wow-delay="0.2s">
            <div class="portfolio-wrap">
              <figure>
                <img src="../Assets/Templates/Main/img/status.jpg" class="img-fluid" alt="">
                <a href="AgencyComplaintStatus.jsp" class="link-details" title="More Details"><i class="ion ion-android-open"></i></a>
              </figure>
              <div class="portfolio-info">
                <h4><a href="AgencyComplaintStatus.jsp">COMPLAINT STATUS</a></h4>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section><!-- #portfolio -->
      <!------ service------->
      <section id="services">
  <div class="container">
    <header class="section-header wow fadeInUp">
      <h3>Rules</h3>
      <p>Here are the essential rules for the waste collection agency to ensure efficient, safe, and eco-friendly waste management in our locality.</p>
    </header>
    <div class="row">
      <div class="col-lg-4 col-md-6 box wow bounceInUp" data-wow-duration="1.4s">
        <div class="icon"><i class="fas fa-calendar-check"></i></div>
        <h4 class="title"><a href="">Adherence to Collection Schedule</a></h4>
        <p class="description">The agency must follow the predefined collection schedule. Organic waste is collected on certain days (e.g., Mondays, Wednesdays, Fridays), inorganic waste on other days (e.g., Tuesdays, Thursdays), and hazardous waste once a month.</p>
      </div>
      <div class="col-lg-4 col-md-6 box wow bounceInUp" data-wow-duration="1.4s">
        <div class="icon"><i class="fas fa-recycle"></i></div>
        <h4 class="title"><a href="">Proper Disposal Methods</a></h4>
        <p class="description">The agency must ensure that all collected waste is disposed of using environmentally friendly methods. Organic waste should be composted or converted into biogas, inorganic waste should be sent to recycling facilities, and hazardous waste should be handled and disposed of according to safety regulations.</p>
      </div>
      <div class="col-lg-4 col-md-6 box wow bounceInUp" data-wow-duration="1.4s">
        <div class="icon"><i class="fas fa-broom"></i></div>
        <h4 class="title"><a href="">Maintenance of Cleanliness</a></h4>
        <p class="description">The agency must keep collection areas and vehicles clean and hygienic. Address spills and leaks promptly to prevent contamination and health hazards.</p>
      </div>
      <div class="col-lg-4 col-md-6 box wow bounceInUp" data-wow-delay="0.1s" data-wow-duration="1.4s">
        <div class="icon"><i class="fas fa-shield-alt"></i></div>
        <h4 class="title"><a href="">Training and Safety Protocols</a></h4>
        <p class="description">All staff must receive regular training on waste handling and safety protocols. Equip staff with PPE and follow safety guidelines to minimize risks during waste collection and disposal.</p>
      </div>
      <div class="col-lg-4 col-md-6 box wow bounceInUp" data-wow-delay="0.1s" data-wow-duration="1.4s">
        <div class="icon"><i class="fas fa-bullhorn"></i></div>
        <h4 class="title"><a href="">Efficient Communication</a></h4>
        <p class="description">The agency must maintain clear communication with residents. Inform them of schedule changes, provide guidelines for waste segregation, and address concerns promptly.</p>
      </div>
      <div class="col-lg-4 col-md-6 box wow bounceInUp" data-wow-delay="0.1s" data-wow-duration="1.4s">
        <div class="icon"><i class="fas fa-clipboard-list"></i></div>
        <h4 class="title"><a href="">Record Keeping and Reporting</a></h4>
        <p class="description">The agency must maintain accurate records of waste collected, including quantities and types. Submit regular reports to local authorities to ensure compliance with regulations and track waste reduction progress.</p>
      </div>
    </div>
  </div>
</section><!-- #services -->
    <%@include file="../Guest/Foot.jsp" %>
    </body>
</html>