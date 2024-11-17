<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Logica.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="components/navbar_user_log.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ver Perfil</title>
        <style>
            body, html {
                height: 100%;
            }
            .container {
                display: flex;
                align-items: center;
                justify-content: center;
                flex-direction: column; /* Alinea el botón debajo del contenedor */
                height: 85vh;
            }
            .profile-container {
                background-color: #f0f0f0;
                padding: 30px;
                border-radius: 10px;
                max-width: 800px;
                width: 100%;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            .profile-label {
                font-weight: 500;
                color: #333;
            }
            .profile-value {
                color: #555;
            }
            .row {
                padding-left: 60px;
            }
            .btn-custom {
                background-color: #6f42c1; /* Morado */
                color: white;
            }
            .btn-custom:hover {
                background-color: #5a369c; /* Morado más oscuro al hacer hover */
                color: white;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="profile-container">
                <h1 class="text-center mb-4">Perfil</h1>
                <div class="row">
                    <%
                        Cliente currentCliente = (Cliente) request.getSession().getAttribute("currentCliente");
                        

                            SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
                            String fechaFormateada = formato.format(currentCliente.getFecha_nac());
                            

                    %>

                    <div class="col-md-6">
                        <h5 class="profile-label">Nombre</h5>
                        <p class="profile-value"><%=currentCliente.getNombre()%></p>
                    </div>
                    <div class="col-md-6">
                        <h5 class="profile-label">Tipo documento</h5>
                        <p class="profile-value"><%=currentCliente.getTipo_documento()%></p>
                    </div>
                    <div class="col-md-6">
                        <h5 class="profile-label">Apellido</h5>
                        <p class="profile-value"><%=currentCliente.getApellido()%></p>
                    </div>
                    <div class="col-md-6">
                        <h5 class="profile-label">Número de documento</h5>
                        <p class="profile-value"><%=String.valueOf(currentCliente.getId_cliente())%></p>
                    </div>
                    <div class="col-md-6">
                        <h5 class="profile-label">Fecha de nacimiento</h5>
                        <p class="profile-value"><%=fechaFormateada%></p>
                    </div>
                    <div class="col-md-6">
                        <h5 class="profile-label">Correo</h5>
                        <p class="profile-value"><%=currentCliente.getCorreo()%></p>
                    </div>
                </div>
            </div>

            <div class="text-center mt-4">
                <a href="pagina_inicio.jsp">
                    <button type="button" class="btn btn-custom" >Página Principal</button>
                </a>
            </div>
        </div>
    </body>
</html>