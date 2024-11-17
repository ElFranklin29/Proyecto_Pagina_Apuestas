<%@page import="Logica.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="components/navbar_logging.jsp"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="Style/inciar_sesion.css" rel="stylesheet" type="text/css"/>
        <title>Iniciar Sesión</title>
    </head>
    <body>
      
        <div class="container-fluid">
            <div class="row">

                <div class="col-md-6 left-col">

                    <div class="form-container">
                        <h2>Iniciar Sesión</h2>
                        <form action="SvIniciarSesion" method="GET">
                            <label class="form-label">Correo Electrónico:</label>
                            <div class="form-floating mb-3">
                                <input type="email" class="form-control" id="email" name="email" placeholder="name@example.com">
                                <label for="floatingInput">Email address</label>
                            </div>

                            <label class="form-label">Contraseña:</label>
                            <div class="form-floating">
                                <input type="password" class="form-control" id="floatingPassword" name="password" placeholder="Password">
                                <label for="floatingPassword">Password</label>
                            </div>

                            <button type="submit" class="btn btn-purple">Iniciar Sesión</button>
                        </form>

                        <label class="register-label">¿No tiene cuenta? <a class="register-link" href="registrar.jsp">Regístrese aquí</a></label>

                    </div>
                </div>

                <div class="col-md-6 right-col">
                    <img src="img/img_inicio_sesion.png" alt="Imagen de inicio de sesión">
                </div>
            </div>
        </div>
    </body>
</html>
