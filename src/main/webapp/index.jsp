<%-- 
    Document   : login
    Created on : 25 oct. 2023, 21:43:59
    Author     : saram
--%>
<%@page import="java.math.BigInteger"%>
<%@page import="Utils.passwordEncription" %>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="favicon.ico"> 
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>Login</title>
    </head>
    <body class="bg-light text-white" style="background-image: url('Images/mario-3788492_1920.png');">
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <div class="column text-center">
                        <h2 class="text-center">Área de login</h2><br>
                        <img class="rounded img-thumbnail" src="Images/Inclusive Games white.jpg" style= "width: 120px" alt="Logo Inclusive Games"></</img></div>&nbsp;
               
                    <form method="post" action="index.jsp" >
                        <div class="form-group">
                            <label>Usuario</label>
                            <input type="text" class="form-control" name="user" placeholder="Introduce tu usuario">
                        </div>
                        <label>Contraseña</label>
                        <div class="input-group mb-3">
                            <input type="password" id="password" class="form-control" name="password" placeholder="Introduce tu contraseña">
                            <div class="input-group-append ">
                                <button id= "hide-password" class="btn btn-primary text-white" onclick="showPassword('password', 'hide-password')" type="button">Mostrar</button>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary" name="login" >Login</button>
                        <a href="register.jsp" class="btn btn-primary">Ir a formulario de registro</a>
                    </form>
                    <%
                        Connection con = null;
                        Statement st = null;
                        ResultSet rs = null;
                        passwordEncription encript = new passwordEncription();
                        if (request.getParameter("login") != null) {
                            String user = request.getParameter("user");
                            String password = request.getParameter("password");
                            HttpSession sesion = request.getSession();
                            try {
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/videogames?user=root");
                                st = con.createStatement();
                                rs = st.executeQuery(" SELECT * FROM `user` where user='" + user + "' and password='" + encript.getMD5(password) + "'; ");
                                while (rs.next()) {
                                    sesion.setAttribute("logueado", "1");
                                    sesion.setAttribute("user", rs.getString("user"));
                                    sesion.setAttribute("id", rs.getString("id"));
                                    sesion.setAttribute(("admin"), rs.getBoolean("admin"));
                                    response.sendRedirect("home.jsp");
                                }
                                out.print(" <div class=\"alert alert-danger mt-2\" role=\"alert\"> Usuario incorrecto </div>");
                            } catch (Exception e) {
                            }
                        }
                    %>

                </div>
            </div>
        </div>
    </body>

    <script>
        function showPassword() {
            var x = document.getElementById('password');
            var buttonHide = document.getElementById('hide');
            if (x.type === "password") {
                x.type = "text";
                buttonHide.innerText = 'Ocultar';
            } else {
                x.type = "password";
                buttonHide.innerText = 'Mostrar';
            }
        }
    </script>
</html>
