<%-- 
    Document   : jurosSimples
    Created on : 7 de nov de 2022, 14:48:43
    Author     : Fatec
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf"%>
        <h1>Juros Simples</h1>
        
        <%
            String errorMessage = null;
            boolean hasParameterC = request.getParameter("c")!=null;
            boolean hasParameterI = request.getParameter("i")!=null;
            boolean hasParameterT = request.getParameter("t")!=null;
            double c=0, i=0, t=0, juros=0, m=0;
            try{
            c= Double.parseDouble(request.getParameter("c"));
            i= Double.parseDouble(request.getParameter("i"));
            t= Double.parseDouble(request.getParameter("t"));
            i=i/100;
            juros = c*i*t;
            m = juros + c;
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
                Tempo:
                <input type="number" name="t"/>
                <input type="submit" value="="/>
            </form>
            <% if(hasParameterC && hasParameterI && hasParameterT){ %>
                Montante = Capita: R$<%= c %> + Juros: R$<%= juros %> = R$<%= m %>
            <% } %>
    </body>
</html>
