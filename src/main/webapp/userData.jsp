<%-- 
    Document   : userData
    Created on : 29 oct. 2023, 12:40:37
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
        <title>Usuario</title>
    </head>
    <body class="bg-light text-white" style="background-image: url('Images/Mario_2.png')">
        <%
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
                response.sendRedirect("home.jsp");
            }
            Connection con = null;
            Statement st = null;
            passwordEncription encript = new passwordEncription();
        %>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <h2 class="text-center">Formulario de cambio de contraseña</h2>
                    <form action="userData.jsp" method="post">
                        <div class="form-group">
                            <label >Usuario</label>
                            <input type="text" class="form-control" name="user" placeholder="user" value="<%= sesion.getAttribute("user")%>" >
                        </div>
                        <label>Cambiar contraseña</label>
                        <div class="input-group mb-3">
                            <input type="password" id = "password" class="form-control" name="password1" placeholder="Contraseña">
                            <div class="input-group-append">
                                <button id= "hide-password" class="btn btn-primary" onclick="showPassword('password', 'hide-password')" type="button">Mostrar</button>
                            </div>
                        </div>
                        <label >Repita su contraseña</label> 
                        <div class="input-group mb-3">
                            <input type="password" id = "passwordRepeat" class="form-control" name="repeatpassword" placeholder="Repita su contraseña">
                            <button id= "hide-password2" class="btn btn-primary" onclick="showPassword('passwordRepeat', 'hide-password2')" type="button">Mostrar</button>
                        </div>
                        <button type="submit" name="guardar" class="btn btn-primary">Guardar</button>
                        <a href="home.jsp" class="btn btn-danger">Cancelar</a>
                    </form>
                </div>
            </div>
            <%
                if (request.getParameter("guardar") != null) {
                    String user = request.getParameter("user");
                    String password1 = request.getParameter("password1");
                    String repeatpassword = request.getParameter("repeatpassword");
                    if (password1.equals(repeatpassword)) {
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://localhost/videogames?user=root");
                            st = con.createStatement();
                            st.executeUpdate("update user set user='" + user + "',password='" + encript.getMD5(password1) + "' where id='" + sesion.getAttribute("id") + "';");
                            sesion.setAttribute("user", user);
                            response.sendRedirect("home.jsp");
                        } catch (Exception e) {
                            out.print(e);
                        }
                    } else {
                        out.print(" <div class=\"alert alert-danger mt-2\" role=\"alert\"> Las contraseñas no coinciden. </div>");
                    }
                }
            %>
        </div>
    </body>
    <script>
        function showPassword(id, buttonId) {
            var x = document.getElementById(id);
            var buttonHide = document.getElementById(buttonId);
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
