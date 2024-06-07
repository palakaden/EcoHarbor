<%-- 
    Document   : UserFeedbsck.jsp
    Created on : 16 May, 2024, 10:36:32 PM
    Author     : thoma
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../Guest/Head.jsp"%>  
        <link rel="stylesheet" href="../Assets/shopreg.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
            .formbold-main-wrapper {
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 48px;
    margin-bottom: 345px;
}
.formbold-form-wrapper {
    max-width: 600px;
    margin: auto;
    padding: 20px;
    border-radius: 5px;
    background-color: rgba(249, 249, 249, 0.1);
    margin-top: 217px;
        </style>
    </head>
    <body>
        <div class="formbold-main-wrapper">
            <div class="formbold-form-wrapper">
                <%
                    if (request.getParameter("btn_submit") != null) {
                        String insqry = "insert into tbl_feedback (feedback_content, feedback_date, user_id) values ( '" + request.getParameter("content") + "',curdate(), '" + session.getAttribute("uid") + "')";
                        con.executeCommand(insqry);

                %>
                <script>
                    alert("Feedback Send");
                    window.location = "HomePage.jsp";//password thettiya same pg illot varan
                </script>

                <%            }
                %>
                <form method="post" >
                    <div class="formbold-form-title">
              <h2 align="center">FEEDBACK</h2>
        </div>
                    <div class="formbold-mb-3">
                        <textarea name="content" placeholder="Enter Feedback Content" class="formbold-form-input" required></textarea>
                    </div>   
                    <div class="button-container">   
                        <input type="submit" class="formbold-btn" name="btn_submit" value="Register">
                        <input type="reset" class="formbold-btn" name="btn_reset" value="Reset"> 
                    </div>
                </form>
            </div>
        </div>
                  <%@include file="../Guest/Foot.jsp" %>
    </body>
</html>