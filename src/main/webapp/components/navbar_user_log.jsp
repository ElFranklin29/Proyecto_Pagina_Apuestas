<%@page import="Logica.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <style>
            .navbar-purple {
                background-color: #8600C6;
                color: white;
            }
            body {
                padding-top: 56px;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-purple fixed-top">
            <div class="container-fluid">
                <a class="navbar-brand" href="pagina_inicio.jsp">
                    <img src="img/yourBet_Logo.png" alt="Logo" width="100" height="30" class="d-inline-block align-text-top">
                </a>
                <div class="dropdown ms-auto">
                    <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" id="perfilDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <img src="img/user_profile.png" alt="Perfil" width="40" height="40" class="rounded-circle">
                        <span  class="ms-2">Perfil</span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="perfilDropdown">
                        
                        <form action="SvHistorialApuestas" method="GET">
                            <button type="submit" class="dropdown-item btn btn-link">
                                Historial Apuestas
                            </button>
                        </form>

                        <form action="ver_perfil.jsp" >
                            <button type="submit" class="dropdown-item btn btn-link">
                                Ver Perfil
                            </button>
                        </form>
                        <form action="SvCliente" method="GET">
                            <button type="submit" class="dropdown-item btn btn-link">
                                Ver Otros Clientes
                            </button>
                        </form>

                        <form action="iniciar_sesion.jsp">
                            <button type="submit" class="dropdown-item btn btn-link">
                                Cerrar Sesion
                            </button>
                        </form>
                    </ul>

                </div>
            </div>
        </nav>
    </body>
</html>
