<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
                        *{
                    margin: 0;
                    padding: 0;
                    box-sizing: border-box;
                }
                body{
                    background-color: #f5f5f5;
                    font-family: Arial, Helvetica, sans-serif;
                }
                .wrapper{
                    background-color: #fff;
                    width: 500px;
                    padding: 25px;
                    margin: 25px auto 0;
                    box-shadow: 0px 0px 20px rgba(0,0,0,0.5);
                }
                .wrapper h2{
                    background-color: #fcfcfc;
                    color: #7ed321;
                    font-size: 24px;
                    padding: 10px;
                    margin-bottom: 20px;
                    text-align: center;
                    border: 1px dotted #333;
                }
                h4{
                    padding-bottom: 5px;
                    color: #7ed321;
                }
                .input-group{
                    margin-bottom: 8px;
                    width: 100%;
                    position: relative;
                    display: flex;
                    flex-direction: row;
                    padding: 5px 0;
                }
                .input-box{
                    width: 100%;
                    margin-right: 12px;
                    position: relative; 
                }
                .input-box:last-child{
                    margin-right: 0;
                }
                .name{
                    padding: 14px 10px 14px 50px;
                    width: 100%;
                    background-color: #fcfcfc;
                    border: 1px solid #00000033;
                    outline: none;
                    letter-spacing: 1px;
                    transition: 0.3s;
                    border-radius: 3px;
                    color: #333;
                }
                .name:focus, .dob:focus{
                    -webkit-box-shadow:0 0 2px 1px #7ed32180;
                    -moz-box-shadow:0 0 2px 1px #7ed32180;
                    box-shadow: 0 0 2px 1px #7ed32180;
                    border: 1px solid #7ed321;
                }
                .input-box .icon{
                    width: 48px;
                    display: flex;
                    justify-content: center;
                    position: absolute;
                    padding: 15px;
                    top: 0px;
                    left: 0px;
                    bottom: 0px;
                    color: #333;
                    background-color: #f1f1f1;	
                    border-radius: 2px 0 0 2px;
                    transition: 0.3s;
                    font-size: 20px;
                    pointer-events: none;
                    border: 1px solid #000000033; 
                    border-right: none;
                }


                .name:focus + .icon{
                    background-color: #7ed321;
                    color: #fff;
                    border-right: 1px solid #7ed321;
                    border-right: none;
                    transition: 1s;
                }
                .radio:checked + label {
                    background-color: #7ed321;
                    color: #fcfcfc	;
                    border-right: 1px solid #7ed321;
                    border-right: none;
                    transition: 1s;
                }
                .dob{
                    width: 30%;
                    padding: 14px;
                    text-align: center;
                    background-color: #fcfcfc;
                    transition: 0.3s;
                    outline: none;
                    border: 1px solid #c0bfbf;
                    border-radius: 3px;
                }
                .radio{
                    display: none;
                }
                .input-box label{
                    width: 50%;
                    padding: 13px;
                    background-color: #fcfcfc;
                    display: inline-block;
                    float: left;
                    text-align: center;
                    border: 1px solid #c0bfbf; 
                }
                .input-box label:first-of-type{
                    border-top-left-radius: 3px;
                    border-bottom-left-radius: 3px;
                    border-right: none;
                }
                .input-box label:last-of-type{
                    border-top-left-radius: 3px;
                    border-bottom-left-radius: 3px;
                }

                .radio:checked{
                    background-color:green;
                    color: #fff;
                }

                input[type=submit]{
                    width: 100%;
                    background: transparent;
                    border: none;
                    background: #7ed321;
                    color: #fff;
                    padding: 15px;
                    border-radius: 4px;
                    font-size: 16px;
                    transition: all 0.35s ease;
                }
                input[type=submit]:hover{
                    cursor: pointer;
                    background: #5eb105;
                }

    </style>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css">
    <title>Payment Gateway</title>
</head>
<body>
    <div class="wrapper">
        <h2>Payment Gateway</h2>
        <form method="POST" onsubmit="return validateForm()">
            <h4>Amount</h4>
            <div class="input-group">
                <div class="input-box">
                    <input class="name" type="number" name="txt_amount" min="500" value="500" id="txtemail" placeholder="Amount" required="required">
                    <i class="fa fa-rupee-sign icon" aria-hidden="true"></i>
                </div>
            </div>	
            <div class="input-group">
                <div class="input-box">
                    <h4>Payment Details</h4>
                    <input type="radio" name="rdbpay" id="cc" checked class="radio">
                    <label for="cc">
                        <span><i class="fa fa-cc-visa" aria-hidden="true"></i>Credit Card</span>
                    </label>
                    <input type="radio" name="rdbpay" id="dc" class="radio">
                    <label for="dc">
                        <span><i class="fa fa-cc-visa" aria-hidden="true"></i>Debit Card</span>
                    </label>
                </div>
            </div>
            <div class="input-group">
                <div class="input-box">
                    <input class="name" type="tel" id="txtcardno" name="txtcardno" required="required" placeholder="Card Number">
                    <i class="fa fa-credit-card icon" aria-hidden="true"></i>
                </div>
            </div>
            <div class="input-group">
                <div class="input-box">
                    <input class="name" type="text" name="txtcvc" id="txtcvc" placeholder="CVC" required="required">
                    <i class="fa fa-user icon" aria-hidden="true"></i>
                </div>
                <div class="input-box">
                    <input class="name" type="text" name="txtdate" id="txtdate" placeholder="EXP DATE (MM/YY)" required="required">
                    <i class="fa fa-calendar icon" aria-hidden="true"></i>
                </div>
            </div>

            <div class="input-group">
                <div class="input-box">
                    <input type="submit" name="btn_pay"  value="PAY NOW">
                </div>
            </div>
        </form>
    </div>

<%

            if (request.getParameter("btn_pay") != null) {
                int amount = Integer.parseInt(request.getParameter("txt_amount"));
                int cAmount = 0;
                String sel1 = "select*from tbl_user where user_id='" + session.getAttribute("uid") + "'";
                ResultSet rsu = con.selectCommand(sel1);
                if (rsu.next()) {
                    cAmount = rsu.getInt("user_wallet");
                }
                
                int balAmount = amount + cAmount;

                String upQry = "update tbl_user set user_wallet='" + balAmount + "' where user_id='" + session.getAttribute("uid") + "'";
                if (con.executeCommand(upQry)) {
                String insqry = "insert into tbl_transaction (transaction_date, transaction_type, transaction_amount, user_id) values ( curdate(), '" + "Wallet Amount" + "', " + amount + ", '" + session.getAttribute("uid") + "')";
                con.executeCommand(insqry);    
        %>
        <script type="text/javascript" >
            alert("Payment Completed");
            setTimeout(function() {
                window.location.href = 'HomePage.jsp'
            }, 1000);
        </script>
        <%
                }
            }

        %>
%>

<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js'></script>
<script>
    $(document).ready(function(){
        // Masking input fields
        $('#txtcardno').mask('0000 0000 0000 0000');
        $('#txtcvc').mask('000');
        $('#txtdate').mask('00/00');
    });

    function validateForm() {
        var amount = document.getElementById("txtemail").value;
        var cardNumber = document.getElementById("txtcardno").value;
        var cvc = document.getElementById("txtcvc").value;
        var expDate = document.getElementById("txtdate").value;
        
        // Validate amount
        if (amount < 500) {
            alert("The minimum amount should be 500.");
            return false;
        }
        
        // Validate card number (should be 16 digits)
        if (!/^\d{4} \d{4} \d{4} \d{4}$/.test(cardNumber)) {
            alert("Please enter a valid 16-digit card number.");
            return false;
        }

        // Validate CVC (should be 3 digits)
        if (!/^\d{3}$/.test(cvc)) {
            alert("Please enter a valid 3-digit CVC.");
            return false;
        }

        // Validate expiration date (should be in MM/YY format)
        if (!/^(0[1-9]|1[0-2])\/\d{2}$/.test(expDate)) {
            alert("Please enter a valid expiration date in MM/YY format.");
            return false;
        }

        return true; // If all validations pass, return true to allow form submission
    }
</script>
</body>
</html>