<%-- 
    Document   : UserRequest
    Created on : Oct 27, 2023, 8:59:00 PM
    Author     : frank
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
        <link rel="stylesheet" href="../Assets/CSS/shopreg.css">
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Collection Request</title>
        <style>
            body {
                margin: 0;
                padding: 0;
                background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('../Assets/Templates/Main/img/facts-bg.jpg') no-repeat center center/cover;
                font-family: Arial, sans-serif;
                color: white;
                display: flex;
                flex-direction: column;
                justify-content: space-between;
            }

            .table-container {
                width: 100%;
                display: flex;
                flex-direction: column;
                align-items: center;
                margin-top: 100px;
                margin-bottom: 125px;
                min-height: 60vh;
            }

            table {
                width: 80%;
                margin: 0 auto;
                border-collapse: collapse;
                background-color: rgba(249, 249, 249, 0.1);
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
                color: white;
                border: 1px solid transparent; /* Makes the outer border transparent */
            }

            th, td {
                padding: 12px;
                border: 1px solid transparent; /* Makes individual cell borders transparent */
                text-align: center;
            }

            th {
                background-color: #4CAF50;
                color: white;
            }

            tr:nth-child(even) {
                background-color: rgba(255, 255, 255, 0.1);
            }

            tr:hover {
                background-color: rgba(255, 255, 255, 0.2);
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
                margin-top: 220px;
                margin-bottom: 315px;
                width: 600px;
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

            span {
                color: white;
            }

            /* Styles for custom multi-select */
            .multi-select {
                position: relative;
                display: inline-block;
                width: 100%;
            }

            .multi-select-dropdown {
                 display: none;
                 position: absolute;
    background-color: #f9f9f9;
    min-width: 100%;
    max-height: 200px; /* Set the maximum height */
    overflow-y: auto; /* Enable vertical scrolling */
    box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
    z-index: 1;
}

            .multi-select-dropdown.show {
                display: block;
            }

            .multi-select-item {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
                cursor: pointer;
            }

            .multi-select-item:hover {
                background-color: #f1f1f1;
            }

            .multi-select-item.selected {
                background-color: #4CAF50;
                color: white;
            }
        </style>
    </head> 
    <body>
        <header id="header">
            <div class="container-fluid">
                <div id="logo" class="pull-left">
                    <h1><a href="../index.html" class="scrollto">EcoHarbor</a></h1>
                </div>
                <nav id="nav-menu-container">
                    <ul class="nav-menu">
                        <li class="menu-active"><a href="HomePage.jsp">Home</a></li>
                        <li><a href="#contacts">Contact</a></li>
                        <li><a href="../index.html">Logout</a></li>
                    </ul>
                </nav>
            </div>
        </header>

        <%
            if (request.getParameter("did") != null) {
                int count = 0;
                String rqstid = request.getParameter("rid");
                String delqry = "delete from tbl_requesttype where requesttype_id='" + request.getParameter("did") + "'";
                if (con.executeCommand(delqry)) {
                    String selCount = "select count(*) as cout from tbl_requesttype where request_id='" + rqstid + "'";
                    ResultSet rs = con.selectCommand(selCount);
                    if (rs.next()) {
                        count = rs.getInt("cout");
                        if (count > 0) {
                            response.sendRedirect("UserRequest.jsp");
                        } else {
                            String delQry = "delete from tbl_request where request_id='" + request.getParameter("rid") + "'";
                            if (con.executeCommand(delQry)) {
                                response.sendRedirect("UserRequest.jsp");
                            }
                        }
                    }
                }
            }
        %>
        
        <div class="formbold-main-wrapper">
            <div class="formbold-form-wrapper">
                <form method="post">
                    <div class="formbold-form-title">
                        <h2 align="center">USER REQUEST</h2>
                    </div> 
                    <label class="formbold-form-label">Select Waste Type</label>
                    <div class="multi-select">
                        <div class="multi-select-input formbold-form-input" id="multiSelectInput">Select Waste Types</div>
                        <div class="multi-select-dropdown" id="multiSelectDropdown">
                            <% 
                                String selq = "select * from tbl_wastetype";
                                ResultSet rs = con.selectCommand(selq);
                                while (rs.next()) {
                            %> 
                            <div class="multi-select-item" data-value="<%=rs.getString("wastetype_id")%>"><%=rs.getString("wastetype_name")%></div>
                            <% } %>
                        </div>
                    </div>
                    <div class="button-container">   
                        <button type="button" id="add" class="formbold-btn">Submit</button>
                        <button type="reset" id="add" name="txtcancel" class="formbold-btn">Cancel</button>
                    </div>       
                </form>
            </div>
        </div>       

        <script src="../Assets/JQuery/jQuery.js"></script>
        <script>
            document.addEventListener('DOMContentLoaded', (event) => {
                const multiSelectInput = document.getElementById('multiSelectInput');
                const multiSelectDropdown = document.getElementById('multiSelectDropdown');
                const multiSelectItems = multiSelectDropdown.getElementsByClassName('multi-select-item');

                multiSelectInput.addEventListener('click', function() {
                    multiSelectDropdown.classList.toggle('show');
                });

                document.addEventListener('click', function(event) {
                    if (!multiSelectInput.contains(event.target) && !multiSelectDropdown.contains(event.target)) {
                        multiSelectDropdown.classList.remove('show');
                    }
                });

                for (let item of multiSelectItems) {
                    item.addEventListener('click', function() {
                        item.classList.toggle('selected');
                    });
                }

                const logButton = document.getElementById('add');//button id add ile value logbutton ill vechu
                logButton.addEventListener('click', function() {//calling the event
                    if(confirm("Confirm Your Payment")) {
                        const selectedValues = [];
                        for (let item of multiSelectItems) {
                            if (item.classList.contains('selected')) {
                                selectedValues.push(item.getAttribute('data-value'));
                            }
                        }
                        console.log('Selected values:', selectedValues);
                        $.ajax({
                            url: "../Assets/AjaxPages/AjaxUr.jsp",
                            type: "GET",
                            data: {
                                ids: selectedValues // Pass the array here
                            },
                            traditional: true, // This ensures the array is serialized correctly
                            dataType: "html",
                            success: function(result) { 
                                alert(result);
                                window.location = "Requestview.jsp";
                            }
                        });
                    } else {
                        alert("Request Cancelled");
                    }
                });
            });
        </script>
    </body>
            <%@include file="../Guest/Foot.jsp" %>
</html>