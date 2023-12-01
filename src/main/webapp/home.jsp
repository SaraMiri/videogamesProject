<%-- 
    Document   : index
    Created on : 13 oct. 2023, 14:42:36
    Author     : saram
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/d1e7beaa21.js" crossorigin="anonymous"></script>
        <title>Videojuegos accesibles y LGTBI</title>
    </head>
    <body class="bg-image text-white" 
          style="background-image: url('https://www.cleanlink.com/resources/editorial/2022/28810-gaming-sstock-1925516489.jpg');
          height: 100vh" >
        <% HttpSession sesion = request.getSession(); %>
        <div class="container mt-5">
            <h1 class="text-center">Catálogo de videojuegos accesibles y LGTBI</h1>
        </div>
        <div class="container mt-5">
            <div class="container">
                <nav class="navbar navbar-light bg-light rounded" style="padding-left:0;">
                    <form class="form-inline" action="requestGame.jsp">
                        <button class="btn btn-primary my-2 my-sm-0 ml-2" type="submit">Solicitar videojuego <i class="fa fa-user-circle" aria-hidden="true"></i></button>
                    </form>
                    <form class="form-inline" action="logout.jsp">
                        <a href="userData.jsp"><i class="fa fa-user-circle" aria-hidden="true"></i> </a>
                        <button class="btn btn-danger my-2 my-sm-0 ml-2" type="submit">Logout</button>
                    </form>
                </nav>
                <div class="row mt-2 ">
                    <div class="col-sm">
                        <form action="home.jsp" method="get">
                            <table id= "videogames" class="table table-striped bg-light rounded">
                                <thead>
                                    <tr class="text-center">
                                        <th scope="col" class="text-center"></th>
                                        <th scope="col" class="text-center">
                                            <input type="text" name="nombre" class="form-control" placeholder="Buscar por nombre"/>
                                        </th>
                                        <th scope="col" class="text-center">
                                            <input type="submit" value="Buscar" name="buscar" class="form-control btn btn-primary" />
                                        </th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
      
                                        <% if ( sesion.getAttribute("admin").equals(true)) { %>
                                        <th scope="col"  >
                                            <a href="create.jsp"><i class="fa-solid fa-plus" aria-hidden="true"></i></a>
                                        </th>
                                        <% } else { %>
                                        <% } %>
                                    </tr>
                                    <tr>
                                        <th scope="col">ID</th>
                                        <th scope="col">Nombre</th>
                                        <th scope="col">Empresa</th>
                                        <th scope="col">Año</th>
                                        <th scope="col" class="text-center">Accesible</th>
                                        <th scope="col" class="text-center">LGTBI</th>
                                        <th scope="col"class="text-center">Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <jsp:include page="Videojuegos"/>
                                </tbody>
                            </table>
                        </form>
                    </div>
                </div>                    
            </div>
    </body>
</html>
