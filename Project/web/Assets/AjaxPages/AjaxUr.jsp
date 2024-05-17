<%-- 
    Document   : AjaxUr
    Created on : 15 May, 2024, 11:17:35 AM
    Author     : thoma
--%>
<jsp:useBean class="DB.ConnectionClass" id = "con"></jsp:useBean>
<%@page  import = "java.sql.ResultSet"%>
        <%
            String req = "";
            int samount = 0;
            
            String clr[] = request.getParameterValues("ids");
            String upqy = "Select * from tbl_user where user_id='" + session.getAttribute("uid") + "'";
            ResultSet rs3 = con.selectCommand(upqy);
            rs3.next();
            int balance = rs3.getInt("user_wallet");
            if (clr != null) { 
                String insqry = "insert into tbl_request(user_id,request_date)values('" + session.getAttribute("uid") + "',curdate())";
                con.executeCommand(insqry);
                String sel = "select max(request_id) as id from tbl_request where user_id='" + session.getAttribute("uid") + "'";//selecting recent request id as id
                ResultSet rs1 = con.selectCommand(sel);
                rs1.next();
                req = rs1.getString("id");
                String iq = "insert into tbl_requesttype(request_id,wastetype_id)values";
                for (int i = 0; i < clr.length; i++) {
                    String s = "select*from tbl_wastetype where wastetype_id='" + clr[i] + "'";
                    ResultSet rs2 = con.selectCommand(s);
                    rs2.next();
                    int amount = rs2.getInt("wastetype_rate");
                    samount = amount + samount;
                    if (i != 0) {
                        iq += ",";
                    }
                    iq += "('" + req + "','" + clr[i] + "')";
                }
                if(con.executeCommand(iq))
                {
                    out.print("Request Submitted");
                    String insqy = "insert into tbl_transaction (transaction_date, transaction_type, transaction_amount, user_id) values ( curdate(), '" + "Min amount" + "', " + samount + ", '" + session.getAttribute("uid") + "')";
                    con.executeCommand(insqy);  
                    balance = balance - samount;
                    String upqry = "update tbl_user set user_wallet='" + balance + "' where user_id='" + session.getAttribute("uid") + "'";
                    con.executeCommand(upqry);
                    String upq = "update tbl_request set request_minimumamount = '" + samount + "' where request_id ='" + req + "'";
                    con.executeCommand(upq);                    
                }
                }
                    
                
                
        %>