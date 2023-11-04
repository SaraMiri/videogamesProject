<%-- 
    Document   : edit
    Created on : 23 oct. 2023, 18:20:00
    Author     : saram
--%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>Editar videojuego</title>
    </head>
    <body class="bg-image text-white" 
          style="background-image: url('https://www.cleanlink.com/resources/editorial/2022/28810-gaming-sstock-1925516489.jpg');
          height: 100vh">
        <%
            String id = request.getParameter("id");
            String name = request.getParameter("nombre");
            String company = request.getParameter("empresa");
            String year = request.getParameter("fecha");
            String accesible = request.getParameter("accesible");
            boolean boolAccesible = Boolean.parseBoolean(accesible);
            String LGTBI = request.getParameter("LGTBI");
            boolean boolLGTBI = Boolean.parseBoolean(LGTBI);
        %>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">

                    <form action="edit.jsp" method="get">
                        <div class="form-group">
                            <label for="nombre">Nombre</label>
                            <input type="text" class="form-control" id="nombre" value="<%= name%>" name="nombre" placeholder="Nombre" required="required">
                        </div>
                        <div class="form-group">
                            <label for="empresa">Empresa</label>
                            <input type="text" class="form-control" id="empresa" value="<%= company%>"  name="empresa" placeholder="Empresa" required="required">
                        </div>
                        <div class="form-group">
                            <label for="fecha">Año</label>
                            <input type="text" class="form-control" id="fecha"  value="<%= year%>"  name="fecha" placeholder="Fecha" required="required">
                        </div>
                        <div class="form-group">
                            <label for="accesible">Indica si el juego es accesible o no</label>                   
                            <select id="accesible" name="accesible" required="required" value="<%= boolAccesible%>">
                                <option value= 1 >Cumple requisitos de accesibilidad</option>
                                <option selected value= 0 >No cumple requisitos de accesibilidad</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="LGTBI">Indica si el juego es accesible o no</label>                   
                            <select id="LGTBI" name="LGTBI" required="required" value="<%= boolLGTBI%>">
                                <option value= 0  >No incluye personajes LGTBI</option>
                                <option value= 1 selected>Sí incluye personajes LGTBI</option>
                            </select>
                        </div>
                        <a href="home.jsp" class="btn btn-danger">Cancelar <i class="fa fa-ban" aria-hidden="true"></i></a>
                        <button type="submit" name="enviar" class="btn btn-primary">Guardar <i class="fa fa-floppy-o" aria-hidden="true"></i></button>
                        <!-- Añadir mensaje de tu cambio se ha añadido o no -->
                        <input type="hidden" name="id" value="<%= id%>" >
                    </form>
                    <%
                        if (request.getParameter("enviar") != null) {

                            try {
                                Connection con = null;
                                Statement st = null;
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/videogames?user=root");
                                st = con.createStatement();
                                st.executeUpdate("update videojuegos set nombre='" + name + "',empresa='" + company + "',fecha='" + year + "',accesible='" + accesible + "',LGTBI='" + LGTBI + "' where id='" + id + "';");
                                out.print(" <div class=\"alert alert-success mt-2\" role=\"alert\"> Registro modificado correctamente </div>");
                            } catch (Exception e) {
                                out.print(e);
                            }

                        }
                    %>
                </div>
            </div>
        </div>
    </body>
</html>