<%-- 
    Document   : AllTransactions
    Created on : 16 May, 2024, 11:12:16 AM
    Author     : thoma
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page  import = "java.sql.ResultSet"%>
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
        <title>Request View</title>
        <style>
            body {
                margin: 0;
                padding: 0;
                background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('../Assets/Templates/Main/img/facts-bg.jpg') no-repeat center center/cover;
                font-family: Arial, sans-serif;
                color: white;
                flex-direction: column;
                align-items: center;
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

            h2 {
                text-align: center;
                font-weight: 400;
                font-size: 33px;
                line-height: 34px;
                margin-top: 150px;
            }

        </style>
    </head>
    <body>
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
            <li class="menu-active"><a href="HomePage.jsp">Home</a></li>
          <li><a href="#contacts">Contact</a></li>
          <li><a href="../index.html">Logout</a></li>
        </ul>
      </nav><!-- #nav-menu-container -->
    </div>
  </header><!-- #header -->      
    <h2>ALL TRANSACTIONS</h2>
     <div class="table-container">
         <table  border="2" align="center">
                <tr>
                    <th>Sl No</th>
                    <th>UserName</th>                    
                    <th>UserPropertyno</th>
                    <th>TransactionId</th>
                    <th>TransactionDate</th>
                    <th>TransactionType</th>
                    <th>TransactionAmount</th>

                     <%
                    String insqry = "select*from tbl_transaction t inner join tbl_user u on t.user_id = u.user_id";
                    ResultSet rs = con.selectCommand(insqry);
                    int i = 0;
                    while (rs.next()) {
                        i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("user_name")%></td>          
                    <td><%=rs.getString("user_propertyno")%></td>
                    <td><%=rs.getString("transaction_id")%></td>
                    <td><%=rs.getString("transaction_date")%></td>
                    <td><%=rs.getString("transaction_type")%></td>
                    <td><%=rs.getString("transaction_amount")%></td>
                </tr>
                 <%
                    }
                 %>  
            </table>
              </div>
                                <%@include file="../Guest/Foot.jsp" %>
    </body>
</html>