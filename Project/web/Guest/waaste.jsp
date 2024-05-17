<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Agency Registration Form</title>
        <link rel="stylesheet" href="../Assets/Waste.css">
    </head>
    <section id="intro">
    <div class="intro-container">
        <div class="carousel-inner" role="listbox">
          <div class="carousel-item active" style="background-image: url('../Assets/Templates/Main/img/intro-carousel/15.jpeg');">
            <div class="carousel-container">
              <div class="carousel-content">
     <%@include file="Head.jsp" %>
    
          <body>
              <section id="intro">

         
            <div class="carousel-container">
              <div class="carousel-content">
        <section class="container1" align="center">
            <header>Agency Registration</header>
            <form action="../Assets/ActionPages/AgencyUploadAction.jsp" class="form" method="post" enctype="multipart/form-data">
                <div class="input-box">
                    <label align="left">Full Name</label>
                    <input type="text" name="txtagname" placeholder="Enter full name" title="Name Allows Only Alphabets, Spaces and First Letter Must Be Capital Letter" pattern="^[A-Z]+[a-zA-Z ]*$" required style="height: 40px">
                </div>
                <div >
                    <label align="left">Upload Logo</label>
                        <input type="file" name="txtlfile" requried>
                </div>

                <div class="input-box">
                    <label align="left">Phone Number</label>
                    <input type="number" placeholder="Enter phone number" name="txtcontact" title="Phone number with 7-9 and remaing 9 digit with 0-9" pattern="[7-9]{1}[0-9]{9}" required style="height: 40px">
                </div>
                <div class="input-box">
                    <label align="left">Email Address</label>
                    <input type="text" name="txtemail" placeholder="Enter email address" required style="height: 40px">
                </div>

                <div>
                    <label align="left">Upload Proof</label>
                        <input type="file" name="txtpfile" requried>
                </div>

                <div class="input-box address">
                    <label align="left">Address</label>
                    <textarea name="txtaddress" placeholder="Enter street address" required style="height: 40px"></textarea>
                </div>

                <div class="input-box">
                     <label align="left">Password</label>
                    <input type="password" placeholder="Password" name="txtpsswd" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required style="height: 40px">
                </div>

                <div class="input-box">
                    <label align="left">Confirm Password</label>
                    <input type="password" placeholder="Confirm Password" name="txtcpsswd" required style="height: 40px">
                </div>

                <input type="submit" value="Save" name="txtsave" style="width: 100px; height: 32px; padding: 1px 20px; margin-left: 125px">
                <input type="reset" value="Cancel" name="txtcancel" style="width: 100px; height: 32px; padding: 1px 20px; margin-right: 125px">
                   <label  style="color: white; font-size: 15px; "><a href="../Guest/ag.jsp" style="color: limegreen;">Sign up as User?</a></label><br>
            </form>
    </body>
      <%@include file="Foot.jsp" %>
</html>