<%-- 
    Document   : Calculator
    Created on : 26 Oct, 2023, 10:59:19 AM
    Author     : thoma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int num1=0,num2=0,result=0;
            if(request.getParameter("add")!=null)
            {
                num1=Integer.parseInt(request.getParameter("no1"));
                num2=Integer.parseInt(request.getParameter("no2"));
                result=num1+num2;
            }
            if(request.getParameter("sub")!=null)
            {
                num1=Integer.parseInt(request.getParameter("no1"));
                num2=Integer.parseInt(request.getParameter("no2"));
                result=num1-num2;
            }
            if(request.getParameter("multi")!=null)
            {
                num1=Integer.parseInt(request.getParameter("no1"));
                num2=Integer.parseInt(request.getParameter("no2"));
                result=num1*num2;
            }
            if(request.getParameter("divi")!=null)
            {
                num1=Integer.parseInt(request.getParameter("no1"));
                num2=Integer.parseInt(request.getParameter("no2"));
                result=num1/num2;
            }
            
        %>
        <form method="POST">
            <table border="3">
                <tr>
                    <td>Enter number1</td>
                    <td><input type="text" name="no1" value="<%=num1%>"></td>
                </tr>
                <tr>
                    <td>Enter number2</td>
                    <td><input type="text" name="no2" value="<%=num2%>"></td>
                </tr>
                <tr>
                    
                    <td colspan="2" align="center"><input type="submit" name="add" value="+">
                    <input type="submit" name="sub" value="-">
                    <input type="submit" name="multi" value="*">
                    <input type="submit" name="divi" value="/"></td>
                </tr>
                <tr>
                    <td>Result</td>
                    <td><%=result%></td>
                </tr>
            </table>
        </form>
    </body>
</html>
