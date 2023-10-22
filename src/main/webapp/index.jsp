<%-- 
    Document   : index
    Created on : 13 oct. 2023, 14:42:36
    Author     : saram
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Videojuegos accesibles y LGTBI</title>
    </head>
    <body>
        <%
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
        %>
        <div class="container mt-5">
            <h1>Catálogo de videojuegos accesibles y LGTBI</h1>
            <div class="row">
                <div class="col-sm">
                    <form action="index.jsp" method="post">
                        <div class="form-group">
                            <label for="name">Introduce tu nombre</label>
                            <input type="text" class="form-control" name="name" aria-describedby="name" placeholder="Introduce tu nombre">
                        </div>
                        <div class="form-group">
                            <label for="email">Introduce tu email</label>
                            <input type="email" class="form-control" name="email" aria-describedby="email" placeholder="Introduce tu email">
                        </div>
                        <button type="submit" class="btn btn-primary">Enviar</button>
                    </form>
                </div>
            </div>
            <div class="row">
                <div class="col-sm">
                    <div class="alert alert-primary" role="alert">
                        <%                    
                            String name = request.getParameter("name");
                            String email = request.getParameter("email");
                            if (name != null & email != null) {
                                String greetings = "Hola " + name + ". Tu email es " + email;
                                out.print(greetings);
                            } else {
                                out.print("Introduce tus datos para continuar.");
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Compañía</th>
                                <th scope="col">Año de publicación</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%        
                                try {
                                    
                                    Class.forName("com.mysql.jdbc.Driver");
                                    con = DriverManager.getConnection("jdbc:mysql://localhost/videogames?user=root");
                                    st = con.createStatement();
                                    rs = st.executeQuery("SELECT * FROM `videojuegos`");
                                    while (rs.next()) {
                            %>
                            <tr>
                                <th scope="row"><%= rs.getString(1)%></th>
                                <td><%= rs.getString(2)%></td>
                                <td><%= rs.getString(3)%></td>
                                <td><%= rs.getString(4)%></td>
                            </tr> 
                            <%
                                    }
                                } catch (Exception e) {
                                    out.print("error mysql" + e);
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
