<%-- 
    Document   : delete
    Created on : 25 oct. 2023, 19:32:44
    Author     : saram
--%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Connection con = null;
            Statement st = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/videogames?user=root");
                st = con.createStatement();
                st.executeUpdate("delete FROM videojuegos where id='"+request.getParameter("id") +"';");
                request.getRequestDispatcher("home.jsp").forward(request, response);
            } catch (Exception e) {
                out.print(e);
            }
        %>
    </body>
</html>
