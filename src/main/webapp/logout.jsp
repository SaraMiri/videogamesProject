<%-- 
    Document   : logout
    Created on : 29 oct. 2023, 12:34:49
    Author     : saram
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
            HttpSession sesion=request.getSession();
            sesion.invalidate();
            response.sendRedirect("login.jsp");
        %>
    </body>
</html>
