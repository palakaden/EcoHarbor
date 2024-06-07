<%-- 
    Document   : ComplaintReply
    Created on : 17 May, 2024, 10:58:07 AM
    Author     : thoma
--%>
<%-- 
    Document   : ComplaintReply
    Created on : May 17, 2024, 10:58:51 AM
    Author     : frank
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
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
    <link rel="stylesheet" href="../Assets/shopreg.css">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Transaction History</title>
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

}
.table-container1 {
    width: 100%;
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-top: 100px;
    margin-bottom: 125px;

}

        table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: rgba(249, 249, 249, 0.1);
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            color: white;
            border: 1px solid transparent;
        }

        th, td {
            padding: 12px;
            border: 1px solid transparent;
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
        }

            .choose-file-button {
                background-color: transparent;
                color: white;
                border: 2px solid white;
                padding: 10px 20px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                cursor: pointer;
                border-radius: 20px;
                transition: background-color 0.3s ease, color 0.3s ease;
            }

            .choose-file-button:hover {
                background-color: white;
                color: #4CAF50;
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
        margin-top: 87px;
}
    </style>
    </head> 
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
        <%
            String seleQry = "select * from tbl_complaint f inner join tbl_user u on f.user_id=u.user_id where f.complaint_id ='" + request.getParameter("cid") + "'";
            ResultSet ress = con.selectCommand(seleQry);
            if (ress.next()) 
            {
        %>
          <div class="table-container">        
        <table border="1" align="center">
            <tr>
                <th>User Name</th> 
                <th>Property NO</th>
                <th>Date</th>
                <th>Complaint content</th>
            </tr>
            <tr>
                <td><%=ress.getString("user_name")%></td>
                <td align="center"><%=ress.getString("user_propertyno")%></td>
                <td><%=ress.getString("complaint_date")%></td>
                <td><%=ress.getString("complaint_content")%></td>
            </tr>
        </table>
          </div>  
            <%
                }
            %>
            
            <%
            String seQry = "select * from tbl_complaint f inner join tbl_agency u on f.agency_id=u.agency_id where f.complaint_id ='" + request.getParameter("cid") + "'";
            ResultSet r = con.selectCommand(seQry);
            if (r.next()) 
            {
                    %>      
            <div class="table-container">  
            <table border="1" align="center">
            <tr>
                <th>Agency Name</th> 
                <th>Date</th>
                <th>Complaint content</th>
            </tr>
            <tr>
                <td><%=r.getString("agency_name")%></td>
                <td><%=r.getString("complaint_date")%></td>
                <td><%=r.getString("complaint_content")%></td>
            </tr>
            <%
                }
            %>
            </table>
                      </div>
            <%
            if(request.getParameter("btn_submit")!=null)
            {
                String uq = "update tbl_complaint set complaint_reply='"+request.getParameter("reply_content")+"', complaint_status='"+1+"' where complaint_id = '"+request.getParameter("cid")+"'";
                if(con.executeCommand(uq)){ %>
                <script type="text/javascript" >
                    alert("Complaint Reply Submitted");
                    setTimeout(function() {
                    window.location.href = 'ViewComplaints.jsp'
                    }, 1000);
                </script>
            <%
                                           }
            }   
            %>   
     <div class="formbold-main-wrapper">
      <div class="formbold-form-wrapper">      
        <form method="post" >
<div class="formbold-form-title">
              <h2 align="center">COMPLAINT REPLY</h2>
        </div>
        <div class="formbold-mb-3">
            <label class="formbold-form-label"> Reply</label>
            <textarea name="reply_content" class="formbold-form-input" rows="6" cols="20" required></textarea>
        </div>
        <div class="button-container">   
                        <input type="submit" class="formbold-btn" name="btn_submit" value="Register">
                        <input type="reset" class="formbold-btn" name="btn_reset" value="Reset"> 
                    </div>
        </form>
      </div>
     </div>
    </body>
</html>