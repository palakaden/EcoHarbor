<%-- 
    Document   : UserRegistration
    Created on : 27 Oct, 2023, 11:23:18 PM
    Author     : thoma
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <%@include file="Head.jsp"%>  
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
           .modal {
                display: none;
                position: fixed;
                z-index: 1;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgb(0,0,0);
                background-color: rgba(0,0,0,0.4);
            }
            .modal-content {
                background-color: #fefefe;
                margin: 15% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 80%;
                max-width: 500px;
            }
            .close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }
            .close:hover,
            .close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }
            .modal-btn {
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
            .modal-btn:hover {
                background-color: #45a049;
            }
    </style>
  </head>
  <body>
    <div class="formbold-main-wrapper">
      <div class="formbold-form-wrapper">
        <form method="POST" enctype="multipart/form-data" action="../Assets/ActionPages/UserUploadAction.jsp">    
          <div class="formbold-form-title">
            <h2 align="center">USER REGISTRATION</h2>
          </div>  
          <div class="formbold-mb-3">
            <label class="formbold-form-label">Full Name</label>
            <input type="text" class="formbold-form-input" name="txtname" placeholder="Enter full name" title="Name Allows Only Alphabets,Spaces and First Letter Must Be Capital Letter" pattern="^[A-Z]+[a-zA-Z ]*$" required />
          </div>
          <div class="formbold-mb-3">
            <label class="formbold-form-label">Phone Number</label>
            <input type="text" class="formbold-form-input" placeholder="Enter phone number" name="txtcontact" title="Phone number with 7-9 and remaining 9 digits with 0-9"  pattern="[7-9]{1}[0-9]{9}"  required />
          </div>
          <div class="formbold-mb-3">
            <label class="formbold-form-label">Email Address</label>
            <input type="text" class="formbold-form-input" name="txtemail" placeholder="Enter email address" required />
          </div>
          <div class="formbold-mb-3">
            <label class="formbold-form-label" required >Gender</label>
            <div class="gender-radio">
              <input type="radio" id="male" name="gender" value="Male" />
              <label for="male">Male</label>
            </div>
            <div class="gender-radio">
              <input type="radio" id="female" name="gender" value="Female" />
              <label for="female">Female</label>
            </div>
            <div class="gender-radio">
              <input type="radio" id="others" name="gender" value="Others" />
              <label for="others">Others</label>
            </div> 
          </div>
          <div class="column">
            <div class="formbold-mb-3">
              <label for="file1" class="formbold-form-label">Profile Photo</label>
              <input type="file" id="file1" name="file_photo" style="display: none;" required onchange="displayFileName('file1', 'file1-label')" required>
              <button type="button" class="choose-file-button" onclick="document.getElementById('file1').click()" required>Choose File</button>
              <span id="file1-label">No file chosen</span>
            </div>
            <div class="formbold-mb-3">
              <label for="file2" class="formbold-form-label">Aadhaar Proof</label>
              <input type="file" id="file2" name="file_proof" style="display: none;" required onchange="displayFileName('file2', 'file2-label')">
              <button type="button" class="choose-file-button" onclick="document.getElementById('file2').click()" required>Choose File</button>
              <span id="file2-label">No file chosen</span>
            </div>
          </div>
          <div class="formbold-mb-3">
            <label class="formbold-form-label"></label>
            <input type="number" class="formbold-form-input" placeholder="Enter Property No" name="txtpropno" required />
          </div> 
          <div class="formbold-input-flex">
            <div>
              <select name="ddlLoc" class="formbold-form-input" onchange="getWard(this.value)" required>
                <option value="" hidden required>Select Location</option>
                <%
                  String sel = "select * from tbl_location";  
                  ResultSet rs = con.selectCommand(sel); 
                  while (rs.next()) {
                %>
                <option style="color:black;"value="<%=rs.getString("location_id")%>"><%=rs.getString("location_name")%></option>
                <%
                  }
                %>
              </select>
            </div>   
            <div>
              <select name="ddlWard" id="selward" class="formbold-form-input" required>
                <option hidden>Ward No</option>
              </select>
            </div>
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
          <div class="formbold-checkbox-wrapper">
                        <label for="supportCheckbox" class="formbold-checkbox-label">
                            <div class="formbold-relative">
                                <input type="checkbox" id="supportCheckbox" class="formbold-input-checkbox" required>
                                <div class="formbold-checkbox-inner">
                                    <span class="formbold-opacity-0">
                                        <svg width="11" height="8" viewBox="0 0 11 8" fill="none" class="formbold-stroke-current">
                                        <path d="M10.0915 0.951972L10.0867 0.946075L10.0813 0.940568C9.90076 0.753564 9.61034 0.753146 9.42927 0.939309L4.16201 6.22962L1.58507 3.63469C1.40401 3.44841 1.11351 3.44879 0.932892 3.63584C0.755703 3.81933 0.755703 4.10875 0.932892 4.29224L0.932878 4.29225L0.934851 4.29424L3.58046 6.95832C3.73676 7.11955 3.94983 7.2 4.1473 7.2C4.36196 7.2 4.55963 7.11773 4.71406 6.9584L10.0468 1.60234C10.2436 1.4199 10.2421 1.1339 10.0915 0.951972ZM4.2327 6.30081L4.2317 6.2998C4.23206 6.30015 4.23237 6.30049 4.23269 6.30082L4.2327 6.30081Z" stroke-width="0.4"></path>
                                        </svg>
                                    </span>
                                </div>
                            </div>
                            <span>I agree to the defined</span> <a href="#" id="terms-link"> terms, conditions, and policies</a>
                        </label>
                    </div>     
                    <div class="button-container">   
                        <input type="submit" class="formbold-btn" name="btn_save" value="Register">
                        <input type="reset" class="formbold-btn" name="btn_reset" value="Reset"> 
                    </div>
                    <div id="termsModal" class="modal">
                        <div class="modal-content">
                            <span class="close">&times;</span>
                            <h2>Terms and Conditions</h2>
                            <p>
                                Welcome to EcoHarbor! By accessing or using our services, you agree to be bound by the terms and conditions set forth below. Please read them carefully. If you do not agree to these terms and conditions, you may not use our services.
                            </p>
                            <p>
                                These terms and conditions govern your use of our website, including all content, features, and functionality available through our site. We reserve the right to make changes to these terms and conditions at any time. Your continued use of our services following the posting of changes will mean that you accept and agree to the changes.
                            </p>
                            <p>
                                You agree to use our website and services in a lawful manner and for their intended purposes only. You must not use our services for any fraudulent or illegal activities, including but not limited to spamming, hacking, or distributing malware.
                            </p>
                            <p>
                                All content on our website, including text, graphics, logos, and images, is the property of EcoHarbor and is protected by applicable copyright and trademark laws. You may not reproduce, distribute, or use any content from our website without our prior written consent.
                            </p>
                            <p>
                                We do not guarantee the accuracy, completeness, or reliability of any information provided on our website. Your use of the information provided on our website is at your own risk. We are not liable for any damages or losses resulting from your use of our website or services.
                            </p>
                            <p>
                                If you have any questions about these terms and conditions, please contact us at support@ecoharbor.com.
                            </p>
                        </div>
                    </div>    
                </form>
            </div>
        </div>
        <script src="../Assets/JQuery/jQuery.js"></script> <!--The jQuery (Javascript Library) file in the specified directory is being processed here-->         
        <script>
                                function getWard(wid) {
                                    $.ajax({
                                        url: "../Assets/AjaxPages/AjaxWard.jsp?wid=" + wid,
                                        success: function(result) {
                                            $("#selward").html(result);
                                        }
                                    })
                                }
                                function displayFileName(inputId, labelId) {
                                    var input = document.getElementById(inputId);
                                    var label = document.getElementById(labelId);
                                    if (input.files.length > 0) {
                                        label.textContent = input.files[0].name;
                                    } else {
                                        label.textContent = "No file chosen";
                                    }
                                }
                                $(document).ready(function() {
                                    var modal = $("#termsModal");
                                    var btn = $("#terms-link");
                                    var span = $(".close");
                                    var agreeBtn = $("#agree-btn");
                                    var cancelBtn = $("#cancel-btn");
                                    var checkbox = $("#supportCheckbox");

                                    btn.click(function(event) {
                                        event.preventDefault();
                                        modal.show();
                                    });

                                    span.click(function() {
                                        modal.hide();
                                    });

                                    agreeBtn.click(function() {
                                        checkbox.prop("checked", true);
                                        modal.hide();
                                    });

                                    cancelBtn.click(function() {
                                        checkbox.prop("checked", false);
                                        modal.hide();
                                    });

                                    $(window).click(function(event) {
                                        if (event.target == modal[0]) {
                                            modal.hide();
                                        }
                                    });
                                });
        </script>
        <%@include file="Foot.jsp" %>
    </body>
</html>