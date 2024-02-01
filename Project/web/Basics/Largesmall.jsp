<%-- 
    Document   : largesmall
    Created on : 26 Oct, 2023, 11:56:25 AM
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
            int a=0,b=0,c=0,largest=0,smallest=0;
            if(request.getParameter("result")!=null)
            {
                a=Integer.parseInt(request.getParameter("no1"));
                b=Integer.parseInt(request.getParameter("no2"));
                c=Integer.parseInt(request.getParameter("no3"));
                if(a>b)
                {
                    if(a>c)
                    {
                        largest=a;
                    }
                    else
                    {
                        largest=c;
                    }
                }
                else
                {
                    if(b>c)
                    {
                        largest=b;
                    }
                    else
                    {
                        largest=c;
                    }
                    
                if(a<b)
                {
                    if(a<c)
                    {
                        smallest=a;
                    }
                    else
                    {
                        smallest=c;
                    }
                }
                else
                {
                    if(b<c)
                    {
                        smallest=b;
                    }
                    else
                    {
                        smallest=c;
                    }
                    
                    
                }
            }
            }
        %>
        <form method="POST">
            <table border="2">
                <tr>
                    <td>Enter number1</td>
                    <td><input type="text" name="no1" value="<%=a%>"</td>
                  
                </tr>
                <tr>
                    <td>Enter number2</td>
                    <td><input type="text" name="no2" value="<%=b%>"></td>
                   
                </tr>
                <tr>
                    <td>Enter number3</td>
                    <td><input type="text" name="no3" value="<%=c%>"></td>
 
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="result" value="result" >
                        
                    </td>
                    
                </tr>
                <tr>
                    <td>Largest</td>
                    <td><%=largest%></td>
                </tr>
              
                <tr>
                    <td>Smallest</td>
                    <td><%=smallest%></td>
                     
                </tr>
            </table>
        </form>
    </body>
</html>
