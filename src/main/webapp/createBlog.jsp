
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="favicon.ico"> 
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/d1e7beaa21.js" crossorigin="anonymous"></script>
        <title>Crear noticia</title>
    </head>
    <body class="bg-image text-white" 
          style="background-image: url('Images/controller-1486908_1920.png');
          height: 100vh">
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">

                    <form action="createBlog.jsp" method="post">
                        <div class="form-group">
                            <label for="titular">Titular de la noticia</label>
                            <input type="text" class="form-control" id="titular" name="titular" placeholder="Titular" required="required">
                        </div>
                        <div class="form-group">
                            <label for="contenido">Contenido</label>
                            <textarea class="form-control" id="contenido" name="contenido" placeholder="Contenido" required="required" rows="4" cols="50"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="fecha">Fecha de publicación</label>
                            <input type="date" placeholder="yyyy-mm-dd" class="form-control" id="fecha" name="fecha" required="required">
                        </div>
                        <div class="form-group">
                            <label for="accesible">Indica si tiene contenido sobre accesibilidad</label>                   
                            <select id="accesible" name="accesible" required="required">
                                <option value= 1 >Con contenido de accesibilidad</option>
                                <option value= 0 >Sin contenido de accesibilidad</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="accesible">Indica si tiene contenido LGTBI</label>                   
                            <select id="LGTBI" name="LGTBI" required="required">
                                <option value= 0 >Con contenido LGTBI</option>
                                <option value= 1 selected>Sin contenido LGTBI</option>
                            </select>
                        </div>
                        <a href="blog.jsp" class="btn btn-danger">Cancelar <i class="fa fa-ban" aria-hidden="true"></i></a>
                        <button type="submit" name="enviar" class="btn btn-primary">Guardar <i class="fa fa-floppy-o" aria-hidden="true"></i></button>
                    </form>

                </div>
            </div>
        </div>
        <%
            if (request.getParameter("enviar") != null) {
                String title = request.getParameter("titular");
                String content = request.getParameter("contenido");
                String date = request.getParameter("fecha");
                new SimpleDateFormat("dd-MM-yyyy").parse(date);
                String accesible = request.getParameter("accesible");
                String LGTBI = request.getParameter("LGTBI");
                try {
                    Connection con = null;
                    Statement st = null;

                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost/videogames?user=root");
                    st = con.createStatement();
                    st.executeUpdate("insert into noticias (titular,contenido,fecha,accesible,LGTBI) values('" + title + "','" + content + "','" + date + "','" + accesible + "','" + LGTBI + "' );");
                    response.sendRedirect("blog.jsp");
                } catch (Exception e) {
                    out.print(e);
                }

            }
        %>
    </body>
</html>
