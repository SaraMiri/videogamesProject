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
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="shortcut icon" href="favicon.ico?"> 
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/d1e7beaa21.js" crossorigin="anonymous"></script>
        <title>Videojuegos accesibles y LGTBI</title>
    </head>
    <body class="bg-image" 
          style="background-image: url('Images/mario-3788492_1920.png');
          height: 100vh" >
        <% HttpSession sesion = request.getSession(); %>
        <div class="container mt-5">
            <h1 class="text-center text-white"> Inclusive Games: videojuegos accesibles y LGTBI</h1>
        </div>
        <div class="container mt-5">
            <div class="container">
                <nav class="navbar navbar-light bg-light rounded" style="padding-left:0;">
                    <form class="form-inline" action="requestGame.jsp">
                        <button class="btn btn-primary my-2 my-sm-0 ml-2" type="submit">Solicitar videojuego <i class="fa fa-user-circle" aria-hidden="true"></i></button>
                        <button type="button" class="btn btn-outline-secondary ml-2" data-toggle="modal" data-target="#myModal">
                            Opciones de accesibilidad
                        </button>
                    </form>                 
                    <!-- Para abrir el modal con las opciones de accesibilidad -->
                    <div class="modal" id="myModal">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h4 class="modal-title"> Ajustes de la web</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <!-- Interior del modal -->
                                <div class="modal-body">
                                    Color del fondo:  &nbsp;<input type="color" id="colorpicker" value="#FFFFFF">
                                    <hr>
                                    <p id="ejemplo">Cambiar fuente:</p>
                                    <select id="seleccionarFuente" name="seleccionarFuenteFamilia" onchange="cambiarFuente();">
                                        <option> Arial </option>
                                        <option> Lucida Sans Unicode </option>    
                                        <option> Sans-Serif </option>   
                                        <option> Serif </option>
                                        <option> Tahoma </option>
                                        <option> Verdana </option>
                                    </select>
                                    <script>
                                        function cambiarFuente() {
                                            var selector = document.getElementById('seleccionarFuente');
                                            var family = selector.options[selector.selectedIndex].value;
                                            var p = document.getElementById('ejemplo')
                                            p.style.fontFamily = family;
                                        }
                                    </script>
                                    <hr>
                                    Reproducir audio:  &nbsp;<input type="checkbox">
                                </div>
                                <!-- Cierre del modal --> 
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                                </div>
                            </div>
                        </div>
                    </div>
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

                                        <th scope="col"  >
                                            <a href="blog.jsp" target="_blank"><i class="fa-solid fa-blog" aria-hidden="true">&nbsp;&nbsp;&nbsp;</i></a>
                                            <% if (sesion.getAttribute("admin").equals(true)) { %>
                                            <a href="create.jsp"><i class="fa-solid fa-plus" aria-hidden="true"></i></a>
                                        </th>
                                        <% } else { %>
                                        <% }%>
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
        </div>
    </body>
</html>
