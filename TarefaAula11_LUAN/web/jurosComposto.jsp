<%-- 
    Document   : jurosComposto
    Created on : 7 de nov de 2022, 14:48:54
    Author     : Fatec
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf"%>
        <h1>Juros Composto</h1>
        
        <%
            String errorMessage = null;
            boolean hasParameterC = request.getParameter("c")!=null;
            boolean hasParameterI = request.getParameter("i")!=null;
            boolean hasParameterT = request.getParameter("t")!=null;
            double c=0, i=0, t=0, m=0;
            try{
            c= Double.parseDouble(request.getParameter("c"));
            i= Double.parseDouble(request.getParameter("i"));
            t= Double.parseDouble(request.getParameter("t"));
            i=i/100;
            }catch(Exception ex){
            errorMessage = ex.getMessage();
            }
            %>

        
        <div>
            <% if(errorMessage!=null){ %>
                <div style="color:red"><%= errorMessage %></div>
            <% } %>
            <form>
                Capital: 
                <input type="number" name="c"/>
                Taxa: 
                <input type="number" name="i"/>
                Quantidade de meses:
                <input type="number" name="t"/>
                <input type="submit" value="="/>
            </form>
            <% if(hasParameterC && hasParameterI && hasParameterT){ %>
            <% DecimalFormat df = new DecimalFormat("#,###.00"); %>
            <table border="1">
                <h3>Valores Futuros</h3>
                <td>Montante</td>
                <td>Taxa</td>
                <td>Mes</td>
                <% for(int j = 1; j <= t; j+=1) {%> 
                <% 
                    m = Math.pow((1+i),j);
                    m = c * m;
                %>
                
                <tr> </tr>
                <td>
                R$<%= df.format(m) %>    
                </td>
                <td>
                <%= i*100 %>%
                </td>
                <td>
                <%= j %><br>
                </td>
                
                <%}%>
                
            </table>
                <% } %>
    </body>
</html>
