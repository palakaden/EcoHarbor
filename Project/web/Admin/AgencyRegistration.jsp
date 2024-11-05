<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <link rel="stylesheet" href="../Assets/shopreg.css">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title> User Registration Form</title>
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
            margin-top: 100px;
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
            <li><a href="#contacts">Contact</a></li>
            <li><a href="../Guest/Login.jsp">Logout</a></li>
        </ul>
      </nav><!-- #nav-menu-container -->
    </div>
  </header><!-- #header -->
    <div class="formbold-main-wrapper">
      <div class="formbold-form-wrapper">
        <form method="POST" enctype="multipart/form-data" action="../Assets/ActionPages/AgencyUploadAction.jsp">    
          <div class="formbold-form-title">
            <h2 align="center">AGENCY REGISTRATION</h2>
          </div>  
          <div class="formbold-mb-3">
            <label class="formbold-form-label">Agency Name</label>
            <input type="text" class="formbold-form-input" name="txtname" placeholder="Enter agency name" title="Name Allows Only Alphabets,Spaces and First Letter Must Be Capital Letter" pattern="^[A-Z]+[a-zA-Z ]*$" required />
          </div>
          <div class="formbold-mb-3">
            <label class="formbold-form-label">Phone Number</label>
            <input type="text" class="formbold-form-input" placeholder="Enter phone number" name="txtcontact" title="Phone number with 7-9 and remaining 9 digits with 0-9" pattern="[7-9]{1}[0-9]{9}" required />
          </div>
          <div class="formbold-mb-3">
            <label class="formbold-form-label">Email Address</label>
            <input type="text" class="formbold-form-input" name="txtemail" placeholder="Enter email address" required />
          </div>
          <div class="formbold-mb-3">
          <div class="column">
            <div class="formbold-mb-3">
              <label for="file1" class="formbold-form-label">Agency Logo</label>
              <input type="file" id="file1" name="file_photo" style="display: none;" required onchange="displayFileName('file1', 'file1-label')" required>
              <button type="button" class="choose-file-button" onclick="document.getElementById('file1').click()" required>Choose File</button>
              <span id="file1-label">No file chosen</span>
            </div>
            <div class="formbold-mb-3">
              <label for="file2" class="formbold-form-label">Agency Proof</label>
              <input type="file" id="file2" name="file_proof" style="display: none;" required onchange="displayFileName('file2', 'file2-label')" required>
              <button type="button" class="choose-file-button" onclick="document.getElementById('file2').click()" required>Choose File</button>
              <span id="file2-label">No file chosen</span>
            </div>
          </div>
          <div class="formbold-mb-3">
            <label class="formbold-form-label">Address</label>
          </div>  
          <div class="formbold-mb-3">
            <textarea name="address" placeholder="Enter street address" class="formbold-form-input" required></textarea>
          </div>   
          <div class="formbold-mb-3">
            <input type="password" placeholder="Password" class="formbold-form-input" name="txtpsswd" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required/>
          </div> 
          <div class="formbold-mb-3">
            <input type="password" class="formbold-form-input" placeholder="Confirm Password" name="txtcpsswd" required/>
          </div>   
           
          <div class="button-container">   
            <input type="submit" class="formbold-btn" name="btn_save" value="Register">
            <input type="reset" class="formbold-btn" name="btn_reset" value="Reset"> 
          </div>
        </form>
      </div>
    </div>
  <script src="../Assets/JQuery/jQuery.js"></script> <!--The jQuery (Javascript Library) file in the specified directory is being processed here-->         
  <script>
    function displayFileName(inputId, labelId) {
        var input = document.getElementById(inputId);
        var label = document.getElementById(labelId);
        if (input.files.length > 0) {
            label.textContent = input.files[0].name;
        } else {
            label.textContent = "No file chosen";
        }
    }
  </script>
      
              </div>
            </div>
        </div>
      </div>
    </div>
  </section><!-- #intro -->

<!--==========================<br>
    Footer
  ============================-->
  <footer id="footer">
    <div class="footer-top">
      <div class="container">
        <div class="row">

          <div class="col-lg-3 col-md-6 footer-info" style="margin-left: 50px">
            <h3>EcoHarbor</h3>
            <p>EcoHarbor pioneers sustainable waste management solutions tailored for coastal communities, combining advanced technology and community engagement for a cleaner, greener future. Join us in shaping a sustainable tomorrow.</p>
          </div>

         <div class="col-lg-3 col-md-6 footer-links" style="margin-left: 100px">
            <h4>Useful Links</h4>
            <ul>
              <li><i class="ion-ios-arrow-right"></i> <a href="../index.html#home">Home</a></li>
              <li><i class="ion-ios-arrow-right"></i> <a href=../index.html#about">About us</a></li>
              <li><i class="ion-ios-arrow-right"></i> <a href="../index.html#services">Services</a></li>
              <li><i class="ion-ios-arrow-right"></i> <a href="../index.html#call-to-action">Call to action</a></li>
              <li><i class="ion-ios-arrow-right"></i> <a href="../index.html#facts">Facts</a></li>
            </ul>
          </div>

            <div class="col-lg-3 col-md-6 footer-contact" style="margin-left: 100px" id="contacts">
            <h4>Contact Us</h4>
            <p>
              Avoly Panchayath<br>
              Muvattupuzha, Pin:686670<br>
              Kerala, India <br>
              <strong>Phone:</strong> 0485 226 0243<br>
              <strong>Email:</strong> avoly.gp.mvpa@gmail.com<br>
            </p>

            <div class="social-links">
              <a href="#" class="twitter"><i class="fa fa-twitter"></i></a>
              <a href="#" class="facebook"><i class="fa fa-facebook"></i></a>
              <a href="#" class="instagram"><i class="fa fa-instagram"></i></a>
            </div>

          </div>
        </div>
      </div>
    </div>

    <div class="container">
      <div class="copyright">
        &copy; Copyright <strong>EcoHarbor</strong>. All Rights Reserved
      </div>
    </div>
  </footer><!-- #footer -->

  <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

  <!-- JavaScript Libraries -->
  <script src="../Assets/Templates/Main/lib/jquery/jquery.min.js"></script>
  <script src="../Assets/Templates/Main/lib/jquery/jquery-migrate.min.js"></script>
  <script src="../Assets/Templates/Main/lib/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="../Assets/Templates/Main/lib/easing/easing.min.js"></script>
  <script src="../Assets/Templates/Main/lib/superfish/hoverIntent.js"></script>
  <script src="../Assets/Templates/Main/lib/superfish/superfish.min.js"></script>
  <script src="../Assets/Templates/Main/lib/wow/wow.min.js"></script>
  <script src="../Assets/Templates/Main/lib/waypoints/waypoints.min.js"></script>
  <script src="../Assets/Templates/Main/lib/counterup/counterup.min.js"></script>
  <script src="../Assets/Templates/Main/lib/owlcarousel/owl.carousel.min.js"></script>
  <script src="../Assets/Templates/Main/lib/isotope/isotope.pkgd.min.js"></script>
  <script src="../Assets/Templates/Main/lib/lightbox/js/lightbox.min.js"></script>
  <script src="../Assets/Templates/Main/lib/touchSwipe/jquery.touchSwipe.min.js"></script>
  <!-- Contact Form JavaScript File -->
  <script src="contactform/contactform.js"></script>

  <!-- Template Main Javascript File -->
  <script src="../Assets/Templates/Main/js/main.js"></script>

</body>
</html>
  </body>
</html>