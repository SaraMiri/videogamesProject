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
        <script src="https://kit.fontawesome.com/d1e7beaa21.js" crossorigin="anonymous"></script>
        <title>Videojuegos accesibles y LGTBI</title>
    </head>
    <body>
        <%
              HttpSession sesion=request.getSession();
            if( sesion.getAttribute("logueado")==null ||  sesion.getAttribute("logueado").equals("0") ){
                response.sendRedirect("login.jsp");
            }
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
        %>
        <div class="container mt-5">
            <h1 class="text-center">Catálogo de videojuegos accesibles y LGTBI</h1>
        </div>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col" colspan="4" class="text-center"><h3>Videojuegos</h3></th>
                                <th scope="col" style="padding-left: 24px;">
                                    <a href="create.jsp"><i class="fa fa-plus" aria-hidden="true"></i></a>
                                </th>

                            </tr>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Compañía</th>
                                <th scope="col">Fecha</th>
                                <th scope="col">Acciones</th>
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
                                <td>
                                    <a href="edit.jsp?id=<%= rs.getString(1)%>&nombre=<%= rs.getString(2)%>&empresa=<%= rs.getString(3)%>&fecha=<%= rs.getString(4)%>"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                    <a href="delete.jsp?id=<%= rs.getString(1)%>" class="ml-1"><i class="fa fa-trash" aria-hidden="true"></i></a>
                                </td>
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