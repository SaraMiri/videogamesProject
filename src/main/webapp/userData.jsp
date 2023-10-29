<%-- 
    Document   : userData
    Created on : 29 oct. 2023, 12:40:37
    Author     : saram
--%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>Usuario</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
                response.sendRedirect("login.jsp");
            }
            Connection con = null;
            Statement st = null;
        %>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">

                    <form action="userData.jsp" method="post">
                        <div class="form-group">
                            <label >Usuario</label>
                            <input type="text" class="form-control" name="user" placeholder="user" value="<%= sesion.getAttribute("user")%>" >
                        </div>
                        <div class="form-group">
                            <label >Cambiar contraseña</label>
                            <input type="text" class="form-control" name="password1" placeholder="password">
                        </div>
                        <div class="form-group">
                            <label >Repita su contraseña</label>
                            <input type="text" class="form-control" name="repeatpassword" placeholder="Repita su password">
                        </div>
                        <button type="submit" name="guardar" class="btn btn-primary">Guardar</button>
                        <a href="index.jsp" class="btn btn-danger">Cancelar</a>
                    </form>
                </div>
            </div>
        </div>
    </body>
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
                    st.executeUpdate("update user set user='" + user + "',password='" + getMD5(password1) + "' where id='" + sesion.getAttribute("id") + "';");
                    sesion.setAttribute("user", user);
                    response.sendRedirect("index.jsp");
                } catch (Exception e) {
                    out.print(e);
                }
            } else {
                out.print("Las contraseñas no coinciden");
            }
        }
    %>
</html>
<%!
    public String getMD5(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] encBytes = md.digest(input.getBytes());
            BigInteger numero = new BigInteger(1, encBytes);
            String encString = numero.toString(16);
            while (encString.length() < 32) {
                encString = "0" + encString;
            }
            return encString;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
%>
