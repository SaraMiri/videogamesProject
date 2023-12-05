<%-- 
    Document   : viewBlog
    Created on : 4 dic. 2023, 11:25:26
    Author     : saram
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>Ver videojuego</title>
    </head>
    <body class="bg-image text-white" 
          style="background-image: url('Images/controller-1486908_1920.png');
          height: 100vh">
        <%
            String id = request.getParameter("id");
            String name = request.getParameter("nombre");
            String company = request.getParameter("empresa");
            String date = request.getParameter("fecha");
            String accesible = request.getParameter("accesible");
            boolean boolAccesible = Boolean.parseBoolean(accesible);
            String LGTBI = request.getParameter("LGTBI");
            boolean boolLGTBI = Boolean.parseBoolean(LGTBI);
            String url = request.getParameter("url");
        %>
        <div class="container mt-5">
            <div class="row" >
                <div class="col-sm" >
                    <form action="viewBlog.jsp" method="get">
                        <div class="form-group">
                            <h1 class= "text-dark" id="nombre" name="nombre"><%= name%></h1>
                        </div>
                        <div class="form-group">
                            <label class= "text-dark" for="empresa">Compañía:</label>
                            <p id="empresa" name="empresa"><%= company%></p>
                        </div>
                        <div class="form-group">
                            <label class= "text-dark" for="fecha">Fecha de publicación:</label>
                            <h6 id="fecha" name="fecha"><%= date%></h6>
                        </div>
                        <div class="form-group">
                            <label class= "text-dark" for="url">Link a la web:</label><br>
                            <a href="<%= url%>" id="fecha" name="url"><%= url%></a>
                        </div>
                        <div class="form-group">
                            <label class= "text-dark" for="detalles">Otros detalles sobre el juego:</label><br>
                            <p id="detalles" name="detalles">Añadir información aquí</p>
                        </div>
                        <a href="home.jsp" class="btn btn-primary">Volver al catálogo<i class="" aria-hidden="true"></i></a>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
