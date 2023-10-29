
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/d1e7beaa21.js" crossorigin="anonymous"></script>
        <title>Añadir videojuego al catálogo</title>
    </head>
    <body>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">

                    <form action="create.jsp" method="post">
                        <div class="form-group">
                            <label for="nombre">Nombre</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre" required="required">
                        </div>
                        <div class="form-group">
                            <label for="empresa">Compañía</label>
                            <input type="text" class="form-control" id="empresa" name="empresa" placeholder="Empresa" required="required">
                        </div>
                        <div class="form-group">
                            <label for="fecha">Fecha publicación</label>
                            <input type="text" class="form-control" id="fecha" name="fecha" placeholder="Fecha" required="required">
                        </div>
                        <a href="index.jsp" class="btn btn-danger">Cancelar <i class="fa fa-ban" aria-hidden="true"></i></a>
                        <button type="submit" name="enviar" class="btn btn-primary">Guardar <i class="fa fa-floppy-o" aria-hidden="true"></i></button>
                    </form>

                </div>
            </div>
        </div>
        <%
            if (request.getParameter("enviar") != null) {
                String name = request.getParameter("nombre");
                String company = request.getParameter("empresa");
                String year = request.getParameter("fecha");

                try {
                    Connection con = null;
                    Statement st = null;

                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost/videogames?user=root");
                    st = con.createStatement();
                    st.executeUpdate("insert into videojuegos (nombre,empresa,fecha) values('" + name + "','" + company + "','" + year + "');");
                    //request.getRequestDispatcher("index.jsp").forward(request, response);
                    response.sendRedirect("index.jsp");
                } catch (Exception e) {
                    out.print(e);
                }

            }
        %>
    </body>
</html>
