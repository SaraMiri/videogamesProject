<%-- 
    Document   : viewBlog
    Created on : 4 dic. 2023, 11:25:26
    Author     : saram
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="favicon.ico"> 
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>Ver noticia</title>
    </head>
    <body class="bg-image text-white" 
          style="background-image: url('Images/mario_violet.png');
          height: 100vh">
        <%
            String id = request.getParameter("id");
            String title = request.getParameter("titular");
            String content = request.getParameter("contenido");
            String date = request.getParameter("fecha");
            String day, month = null, year = null, finalDate;
            String[] divide = date.split("-");
            year = divide[0];
            month = divide[1];
            day = divide[2];
            finalDate = day + "-" + month + "-" + year;
            String accesible = request.getParameter("accesible");
            boolean boolAccesible = Boolean.parseBoolean(accesible);
            String LGTBI = request.getParameter("LGTBI");
            boolean boolLGTBI = Boolean.parseBoolean(LGTBI);
        %>
        <div class="container mt-5">
            <div class="row" >
                <div class="col-sm" >
                    <form action="viewBlog.jsp" method="get">
                        <div class="form-group">
                            <h1 id="titular" name="titular"><%= title%>&nbsp;&nbsp;<a href="blog.jsp" class="btn btn-primary">Volver al catálogo <i class="" aria-hidden="true"></i></a></h1>
                            <h6 style= "font-style: italic;" id="fecha" name="fecha"><%=finalDate%></h6>
                            <p id="contenido" name="contenido"><%= content%></p>
                            <img src="Images/<%= id%>.png" alt="Imagen videojuego"></</img>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
