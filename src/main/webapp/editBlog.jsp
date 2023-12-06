<%-- 
    Document   : editBlog
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
        <link rel="shortcut icon" href="favicon.ico"> 
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>Editar noticia</title>
    </head>
    <body class="bg-image text-white" 
          style="background-image: url('Images/marioBlue.png');
          height: 100vh">
        <%
            String id = request.getParameter("id");
            String title = request.getParameter("titular");
            String content = request.getParameter("contenido");
            String date = request.getParameter("fecha");
          //  new SimpleDateFormat("dd-MM-yyyy").parse(date);
            String accesible = request.getParameter("accesible");
            boolean boolAccesible = Boolean.parseBoolean(accesible);
            String LGTBI = request.getParameter("LGTBI");
            boolean boolLGTBI = Boolean.parseBoolean(LGTBI);
        %>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">

                    <form action="editBlog.jsp" method="get">
                        <div class="form-group">
                            <label for="titular">Titular de la noticia</label>
                            <input type="text" class="form-control" id="titular" value="<%= title%>" name="titular" placeholder="Titular" required="required">
                        </div>
                        <div class="form-group">
                            <label for="contenido">Contenido</label>
                            <textarea class="form-control" id="contenido" value="<%= content%>" name="contenido" placeholder="Contenido" required="required" rows="4" cols="50"><%= content%></textarea>
                        </div>
                        <div class="form-group">
                            <label for="fecha">Año</label>
                            <input type="date" placeholder="YYYY-MM-DD" class="form-control" id="fecha"  value="<%= date%>"  name="fecha" required="required">
                        </div>
                        <div class="form-group">
                            <label for="accesible">Indica si tiene contenido sobre accesibilidad</label>                   
                            <select id="accesible" name="accesible" required="required" value="<%= boolAccesible%>">
                                <option value= 1 >Con contenido de accesibilidad</option>
                                <option selected value= 0 >Sin contenido de accesibilidad</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="LGTBI">Indica si tiene contenido LGTBI</label>                   
                            <select id="LGTBI" name="LGTBI" required="required" value="<%= boolLGTBI%>">
                                <option value= 0  >No incluye contenido LGTBI</option>
                                <option value= 1 selected>Sí incluye contenido LGTBI</option>
                            </select>
                        </div>
                        <a href="blog.jsp" class="btn btn-danger">Cancelar <i class="fa fa-ban" aria-hidden="true"></i></a>
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
                                st.executeUpdate("update noticias set titular='" + title + "',contenido='" + content + "',fecha='" + date + "',accesible='" + accesible + "',LGTBI='" + LGTBI + "' where id='" + id + "';");
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
