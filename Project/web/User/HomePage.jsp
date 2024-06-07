<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page  import = "java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Dashboard</title>
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
        <!------------------------------------------------------------header end------------------------------------------------------>
    </head>
    <%

        int balance = 0;
        String sel1 = "select*from tbl_user where user_id='" + session.getAttribute("uid") + "'";
        ResultSet rsu = con.selectCommand(sel1);
        if (rsu.next()) {
            balance = rsu.getInt("user_wallet");
            if (balance <= 0) {
    %>
    <script>
        alert("Payment Required");
        window.location = "Payment.jsp";
    </script>
    <%
            }
        }
    %>
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
            <li><a href="#portfolio">Menu</a></li>
          <li><a href="#services">Rules</a></li>
          <li><a href="Waste.jsp">Base Rate</a></li>
          <li><a style="color:white;">wallet : ₹<%=rsu.getInt("user_wallet")%></a></li>
          <li><a href="../index.html">Logout</a></li>
        </ul>
      </nav><!-- #nav-menu-container -->
    </div>
  </header><!-- #header -->
  
        <section id="intro">
            <div class="intro-container">
                <div id="introCarousel" class="carousel  slide carousel-fade" data-ride="carousel">
                    <ol class="carousel-indicators"></ol>
                    <div class="carousel-inner" role="listbox">
                        <div class="carousel-item active" style="background-image: url('../Assets/Templates/Main/img/intro-carousel/e2.jpg');"">
                            <div class="carousel-container">
                                <div class="carousel-content">
                                    <h2>Hello <%=session.getAttribute("uname")%></h2>
                                    <p>Welcome to EcoHarbor Waste Management, where we transform waste into a greener future for Avoly. Together, we can make a significant impact on our environment and inspire change in communities worldwide.</p>
                                    <a href="HomePage.jsp#portfolio" class="btn-get-started scrollto">Get Started</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section><!-- #intro -->
 
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

                    <div class="col-lg-4 col-md-6 portfolio-item filter-card wow fadeInUp">
                        <div class="portfolio-wrap">
                            <figure>
                                <img src="../Assets/Templates/Main/img/Collect.jpg" class="img-fluid" alt="">
                                <a href="UserRequest.jsp" class="link-details" title="More Details"><i class="ion ion-android-open"></i></a>
                            </figure>
                            <div class="portfolio-info">
                                <h4><a href="UserRequest.jsp">COLLECTION REQUEST</a></h4>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-6 portfolio-item filter-web wow fadeInUp" data-wow-delay="0.1s">
                        <div class="portfolio-wrap">
                            <figure>
                                <img src="../Assets/Templates/Main/img/Request.jpg" class="img-fluid" alt="">
                                <a href="Requestview.jsp" class="link-details" title="More Details"><i class="ion ion-android-open"></i></a>
                            </figure>
                            <div class="portfolio-info">
                                <h4><a href="Requestview.jsp">REQUEST VIEW</a></h4>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-6 portfolio-item filter-app wow fadeInUp" data-wow-delay="0.2s">
                        <div class="portfolio-wrap">
                            <figure>
                                <img src="../Assets/Templates/Main/img/Transact.jpg"  class="img-fluid" alt="">
                                <a href="Transaction.jsp" class="link-details" title="More Details"><i class="ion ion-android-open"></i></a>
                            </figure>
                            <div class="portfolio-info">
                                <h4><a href="Transaction.jsp">TRANSACTION HISTORY</a></h4>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-6 portfolio-item filter-card wow fadeInUp">
                        <div class="portfolio-wrap">
                            <figure>
                                <img src="../Assets/Templates/Main/img/feedback.jpg" class="img-fluid" alt="">
                                <a href="UserFeedback.jsp" class="link-details" title="More Details"><i class="ion ion-android-open"></i></a>
                            </figure>
                            <div class="portfolio-info">
                                <h4><a href="UserFeedback.jsp">FEEDBACK</a></h4>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-6 portfolio-item filter-card wow fadeInUp" data-wow-delay="0.1s">
                        <div class="portfolio-wrap">
                            <figure>
                                <img src="../Assets/Templates/Main/img/complaint.jpg" class="img-fluid" alt="">
                                <a href="UserComplaint.jsp" class="link-details" title="More Details"><i class="ion ion-android-open"></i></a>
                            </figure>
                            <div class="portfolio-info">
                                <h4><a href="UserComplaint.jsp">COMPLAINT</a></h4>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-6 portfolio-item filter-web wow fadeInUp" data-wow-delay="0.2s">
                        <div class="portfolio-wrap">
                            <figure>
                                <img src="../Assets/Templates/Main/img/status.jpg" class="img-fluid" alt="">
                                <a href="UserComplaintStatus.jsp" class="link-details" title="More Details"><i class="ion ion-android-open"></i></a>
                            </figure>
                            <div class="portfolio-info">
                                <h4><a href="UserComplaintStatus.jsp">COMPLAINT STATUS</a></h4>
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
                    <p>Please note that waste will be collected during the first week of every month.</p>
                </header>
                <div class="row">
                    <div class="col-lg-4 col-md-6 box wow bounceInUp" data-wow-duration="1.4s">
                        <div class="icon"><i class="fas fa-recycle"></i></div>
                        <h4 class="title"><a href="">Segregation at Source</a></h4>
                        <p class="description">Waste must be separated into organic, inorganic, and hazardous categories at the source, such as homes, institutions, and businesses</p>
                    </div>
                    <div class="col-lg-4 col-md-6 box wow bounceInUp" data-wow-duration="1.4s">
                        <div class="icon"><i class="fas fa-calendar-alt"></i></div>
                        <h4 class="title"><a href="">Collection Schedule</a></h4>
                        <p class="description">Waste is collected according to a regular schedule, with specific days allocated for different types of waste to ensure systematic and efficient management</p>
                    </div>
                    <div class="col-lg-4 col-md-6 box wow bounceInUp" data-wow-duration="1.4s">
                        <div class="icon"><i class="fas fa-seedling"></i></div>
                        <h4 class="title"><a href="">Biodegradable Waste Management</a></h4>
                        <p class="description">Organic waste is collected more frequently (daily or on alternate days) to prevent decomposition-related issues and odors</p>
                    </div>
                    <div class="col-lg-4 col-md-6 box wow bounceInUp" data-wow-delay="0.1s" data-wow-duration="1.4s">
                        <div class="icon"><i class="fas fa-trash-alt"></i></div>
                        <h4 class="title"><a href="">Non-Biodegradable Waste Management</a></h4>
                        <p class="description">Inorganic waste is collected separately and less frequently than organic waste to ensure proper recycling and disposal</p>
                    </div>
                    <div class="col-lg-4 col-md-6 box wow bounceInUp" data-wow-delay="0.1s" data-wow-duration="1.4s">
                        <div class="icon"><i class="fas fa-exclamation-triangle"></i></div>
                        <h4 class="title"><a href="">Hazardous Waste Handling</a></h4>
                        <p class="description">Special care is taken for hazardous waste (e.g., batteries, medical waste), requiring safe handling and disposal protocols to prevent environmental contamination and health hazards</p>
                    </div>
                    <div class="col-lg-4 col-md-6 box wow bounceInUp" data-wow-delay="0.1s" data-wow-duration="1.4s">
                        <div class="icon"><i class="fas fa-users"></i></div>
                        <h4 class="title"><a href="">Community Involvement</a></h4>
                        <p class="description">Emphasis on active community participation in waste management practices, including awareness campaigns and local training sessions</p>
                    </div>
                </div>
            </div>
        </section><!-- #services -->
        <%@include file="../Guest/Foot.jsp" %>
    </body>
</html>