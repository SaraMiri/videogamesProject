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
    <body>
        <%
            String id = request.getParameter("id");
            String name = request.getParameter("nombre");
            String company = request.getParameter("empresa");
            String year = request.getParameter("fecha");

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
                            <label for="empresa">Direccion</label>
                            <input type="text" class="form-control" id="empresa" value="<%= company%>"  name="empresa" placeholder="Empresa" required="required">
                        </div>
                        <div class="form-group">
                            <label for="fecha">Telefono</label>
                            <input type="text" class="form-control" id="fecha"  value="<%= year%>"  name="fecha" placeholder="Fecha" required="required">
                        </div>
                        <a href="index.jsp" class="btn btn-danger">Cancelar <i class="fa fa-ban" aria-hidden="true"></i></a>
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
                                st.executeUpdate("update videojuegos set nombre='" + name + "',empresa='" + company + "',fecha='" + year + "' where id='" + id + "';");
                                //request.getRequestDispatcher("index.jsp").forward(request, response);
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