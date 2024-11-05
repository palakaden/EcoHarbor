<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <%@include file="../Guest/Head.jsp"%>  
    <link rel="stylesheet" href="../Assets/shopreg.css">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title> User Registration Form</title>
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
    margin-bottom: 100px;
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
        <%
            if(request.getParameter("txtsave")!=null)
            {
                if(request.getParameter("txtpsswd").equals(request.getParameter("txtcpsswd")))
                {
                 String insqry="insert into tbl_admin(admin_name,admin_email,admin_password)values('"+request.getParameter("txtaname")+"','"+request.getParameter("txtaemail")+"','"+request.getParameter("txtpsswd")+"')";
                 con.executeCommand(insqry);    
        %>
                <script type="text/javascript" >
                    alert("Upload Successfully..");
                    setTimeout(function() {
                    window.location.href = '../Guest/Login.jsp'
                    }, 100);
                </script>
        <%
                }
                else
                {
                    %>
                    <script type="text/javascript" >
                        alert("Password Mismatched..");
                        setTimeout(function() {
                        window.location.href = 'Adminregistration.jsp'
                        }, 100);
                    </script>
                    <%
                }    
            }
        %>
    <div class="formbold-main-wrapper">
      <div class="formbold-form-wrapper">
        <form method="POST"  action="Adminregistration.jsp">    
          <div class="formbold-form-title">
            <h2 align="center">AGENCY REGISTRATION</h2>
          </div>  
          <div class="formbold-mb-3">
            <label class="formbold-form-label">Full Name</label>
            <input type="text" class="formbold-form-input" name="txtaname" placeholder="Enter full name" title="Name Allows Only Alphabets,Spaces and First Letter Must Be Capital Letter" pattern="^[A-Z]+[a-zA-Z ]*$" required />
          </div>
          <div class="formbold-mb-3">
            <label class="formbold-form-label">Email Address</label>
            <input type="text" class="formbold-form-input" name="txtaemail" placeholder="Enter email address" required />
          </div>
          <div class="formbold-mb-3">
            <input type="password" placeholder="Password" class="formbold-form-input" name="txtpsswd" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"required/>
          </div> 
          <div class="formbold-mb-3">
            <input type="password" class="formbold-form-input" placeholder="Confirm Password" name="txtcpsswd" required/>
          </div>   
           
          <div class="button-container">   
            <input type="submit" class="formbold-btn" name="txtsave" value="Register">
            <input type="reset" class="formbold-btn" name="txtreset" value="Reset"> 
          </div>
        </form>
      </div>
    </div>        
      <%@include file="../Guest/Foot.jsp" %>
    </body>
</html