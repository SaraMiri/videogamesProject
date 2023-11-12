
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="Utils.passwordEncription" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/d1e7beaa21.js" crossorigin="anonymous"></script>
        <title>Registro de usuario</title>
    </head>
    <body class="bg-light text-dark">
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <h2 class="text-center">Formulario de registro</h2>
                    <form action="register.jsp" method="post">
                        <div class="form-group">
                            <label for="nombre">Usuario</label>
                            <input type="text" class="form-control" id="user" name="user" placeholder="Introduzca el nombre de usuario" required="required">
                        </div>
                        <label>Contraseña</label>
                        <div class="input-group mb-3">
                            <input type="password" id = "password" class="form-control" name="password" placeholder="Introduzca la contraseña">
                            <div class="input-group-append">
                                <button id= "hide-password" class="btn btn-outline-secondary" onclick="showPassword('password', 'hide-password')" type="button">Mostrar</button>
                            </div>
                        </div>
                        <label >Repita su contraseña</label> 
                        <div class="input-group mb-3">
                            <input type="password" id = "passwordRepeat" class="form-control" name="repeatpassword" placeholder="Repita su contraseña">
                            <button id= "hide-password2" class="btn btn-outline-secondary" onclick="showPassword('passwordRepeat', 'hide-password2')" type="button">Mostrar</button>
                        </div>
                        <button type="submit" name="enviar" class="btn btn-primary">Guardar <i class="fa fa-floppy-o" aria-hidden="true"></i></button>
                        <a href="index.jsp" class="btn btn-danger">Cancelar <i class="fa fa-ban" aria-hidden="true"></i></a>
                    </form>

                </div>
            </div>
        </div>
        <%
            if (request.getParameter("enviar") != null) {
                String user = request.getParameter("user");
                String password = request.getParameter("password");
                String repeatpassword = request.getParameter("repeatpassword");
                if (password.equals(repeatpassword)) {
                    try {
                        Connection con = null;
                        Statement st = null;
                        passwordEncription encript = new passwordEncription();

                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost/videogames?user=root");
                        st = con.createStatement();
                        st.executeUpdate("insert into user (user, password) values('" + user + "','" + encript.getMD5(password) + "' );");
                        response.sendRedirect("index.jsp");
                    } catch (Exception e) {
                        out.print(e);
                    }
                } else {
                    out.print(" <div class=\"alert alert-danger mt-2\" role=\"alert\"> Las contraseñas no coinciden. </div>");
                }
            }
        %>
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
