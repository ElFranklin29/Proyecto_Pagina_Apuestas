<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="components/navbar_logging.jsp"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <link href="Style/registrar.css" rel="stylesheet" type="text/css"/>
        <title>Registrar</title>       
    </head>
    <body>
        <div class="container">
            <div class="form-container">
                <h2 class="text-center">Registrar</h2>

                <form action="SvCliente" method="POST">
                    <div class="row">

                        <div class="col-md-6">
                            <label class="form-label">Tipo documento:</label>
                            <div class="mb-3">
                                <select class="form-select" name="tipo_doc" aria-label="Tipo de Documento">
                                    <option selected>Seleccionar tipo de documento</option>
                                    <option value="Cédula de Ciudadanía">Cédula de Ciudadanía</option>
                                    <option value="Cédula de Extranjería">Cédula de Extranjería</option>
                                </select>
                            </div>

                            <label class="form-label">Número de documento:</label>
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" name="numero_doc" placeholder="Número de Documento">
                                <label for="floatingDocNumber">Número de Documento</label>
                            </div>

                            <label class="form-label">Nombre:</label>
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" name="nombre" placeholder="Nombre">
                                <label for="floatingName">Nombre</label>
                            </div>

                            <label class="form-label">Apellido:</label>
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" name="apellido" placeholder="Apellido">
                                <label for="floatingLastName">Apellido</label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="fecha" class="form-label">Selecciona una fecha:</label>
                                <input type="date" class="form-control" name="fecha_nac" name="fecha">
                            </div>

                            <label class="form-label">Correo electrónico:</label>
                            <div class="form-floating mb-3">
                                <input type="email" class="form-control" name="correo" placeholder="Correo Electrónico">
                                <label for="floatingEmail">Correo Electrónico</label>
                            </div>

                            <label class="form-label">Contraseña:</label>
                            <div class="form-floating mb-3">
                                <input type="password" class="form-control" name="contraseña" placeholder="Contraseña">
                                <label for="floatingPassword">Contraseña</label>
                            </div>


                            <button type="submit" class="btn btn-primary">Submit</button>
                        </div>

                    </div>
                </form>
            </div>
        </div>
    </body>
</html>