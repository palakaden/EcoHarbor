<%-- 
    Document   : Collection.jsp
    Created on : 26 Feb, 2024, 5:10:24 PM
    Author     : thoma
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
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
    <title>Collection</title>
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
            margin-top: 150px;
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
                max-width: 880px;
    margin: auto;
    padding: 20px;
    border-radius: 5px;
    background-color: rgba(249, 249, 249, 0.1);
    margin-top: -465px;
    margin-bottom: 315px;
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
                    .hidden-label {
                display: none;
            }
    </style>
</head>
<%

        if (request.getParameter("txtsave") != null) {
            
            String sqz = "select*from tbl_request r inner join tbl_user u on r.user_id = u.user_id where r.request_id ='" + request.getParameter("cid") + "'";
            ResultSet rsz = con.selectCommand(sqz);
            while (rsz.next()) {
                String sq1z = "select*from tbl_requesttype l inner join tbl_wastetype t on l.wastetype_id = t.wastetype_id where request_id ='" + request.getParameter("cid") + "'";
                ResultSet rs2z = con.selectCommand(sq1z);
                while (rs2z.next()) {
                    String updString = "update tbl_requesttype set requesttype_qty='" + request.getParameter(rs2z.getString("wastetype_id")) + "' where requesttype_id='" + rs2z.getString("requesttype_id") + "'";
                    con.executeCommand(updString);
                }
            }
            String upString = "update tbl_request set actual_amount='" + request.getParameter("resultText") + "',request_status ='"+3+"' where request_id='" + request.getParameter("cid") + "'";
            if (con.executeCommand(upString)) {
                response.sendRedirect("UserRequestDetails.jsp");
            }
            
            String sz = "select*from tbl_request r inner join tbl_user u on r.user_id = u.user_id where r.request_id ='" + request.getParameter("cid") + "'";
            ResultSet rz = con.selectCommand(sz);
            rz.next();
            int wamount = rz.getInt("user_wallet");
            int aamount = rz.getInt("actual_amount");
            wamount = wamount - aamount;//reducing the amount from wallet after collection
            String up = "update tbl_user set user_wallet = '" + wamount + "' where user_id = '" + rz.getString("user_id") + "'";
            con.executeCommand(up);
            if(aamount>0)
            {
            String insqry = "insert into tbl_transaction (transaction_date, transaction_type, transaction_amount, user_id) values ( curdate(), '" + "Actual amount" + "', " + aamount + ", '" +rz.getString("user_id") + "')";
            con.executeCommand(insqry);  
            }
            
        }
        else
        {
            String upstrg="update tbl_request set request_status ='"+4+"'where request_id='" + request.getParameter("cid") + "'";//updated cllection status  to 4,when the collection is pending
            con.executeCommand(upstrg);
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
            <li class="menu-active"><a href="HomePage.jsp">Home</a></li>
          <li><a href="#contacts">Contact</a></li>
          <li><a href="../index.html">Logout</a></li>
        </ul>
      </nav><!-- #nav-menu-container -->
    </div>
  </header><!-- #header --> 
    <div class="table-container">
        <table border="1" align="center">
            <tr>
                <th>SI.No</th>
                <th>User Name</th>
                <th>Contact</th>
                <th>Address</th>
                <th>Request Date</th>
                <th>Property Number</th>
            </tr>
            <tr>
                <%
                    String sq = "select*from tbl_request r inner join tbl_user u on r.user_id = u.user_id where r.request_id ='" + request.getParameter("cid") + "'";
                    ResultSet rs = con.selectCommand(sq);
                    int i = 0;
                    while (rs.next()) {
                        i++;
                %>
                <td><%=i%></td>
                <td><%=rs.getString("user_name")%></td>
                <td><%=rs.getString("user_contact")%></td>
                <td><%=rs.getString("user_address")%></td>
                <td><%=rs.getString("request_date")%></td>
                <td><%=rs.getString("user_propertyno")%></td>
            </tr>
            <%
                }
            %>
        </table>
    </div>
    <br>
    <div class="formbold-form-wrapper">
        <form method="post">
            <div class="formbold-form-title">
                <h2 align="center">WASTE QUANTITY ENTRY</h2>
            </div>
            <%
                String sq1 = "select*from tbl_requesttype l inner join tbl_wastetype t on l.wastetype_id = t.wastetype_id where request_id ='" + request.getParameter("cid") + "'";
                ResultSet rs2 = con.selectCommand(sq1);
                while (rs2.next()) {
            %>
            <div class="formbold-form-label" align="left">
                <label><%=rs2.getString("wastetype_name")%> : </label>
<input onkeyup="calcAmount(this)" type="number" step="0.01" class="formbold-form-input" name="<%=rs2.getString("wastetype_id")%>" alt="<%=rs2.getString("wastetype_rate")%>">

                   <label class="hidden-label"><%=rs2.getString("wastetype_rate")%></label>
                <label id="<%=rs2.getString("wastetype_id")%>" class="hidden-label allAmount">0</label>
            </div>
            <%
                }
            %>
            <br>
            <p id="result"></p>
            <input type="hidden" class="formbold-form-input" name="resultText" id="resultText">
            <div class="button-container">
                <input type="submit" class="formbold-btn" name="txtsave" value="Submit">
                <input type="reset" class="formbold-btn" name="txtcancel" value="Cancel">
            </div>
        </form>
    </div>
    <script>
        function calcAmount(id) {
            const textBox = id.value;
            const amount = id.alt;
            if (textBox >= 2) {
                document.getElementById(id.name).innerHTML = textBox * ((amount * 10) / 100);
            } else {
                document.getElementById(id.name).innerHTML = 0;
            }
            getTotal();
        }

        function getTotal() {
            var elements = document.getElementsByClassName('allAmount');
            var total = 0;
            for (var i = 0; i < elements.length; i++) {
                total += parseInt(elements[i].innerText);
            }
            document.getElementById('result').innerText = 'Total: ' + total;
            document.getElementById('resultText').value = total;
        }
    </script>
          <%@include file="../Guest/Foot.jsp" %>    
</body>
</html>