<%@page import="APIFutbol.ApiFutbol"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="components/navbar_user_log.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>

        <style>
            .card {
                width: 90%;
                margin: auto;
                display: flex;
                justify-content: center; /* Centrar horizontalmente */
                align-items: center;    /* Centrar verticalmente */
                /* Establecer altura del contenedor */

            }
            .team {
                font-size: 1.5rem;
                font-weight: bold;
            }
            .vs {
                text-align: left;
                font-size: 1.2rem;
                margin: 10px 0;
            }
            .info{
                background-color: red;
                display: grid;
                grid-template-columns: 1fr 1fr; /* Dos columnas de igual tamaño */
                grid-template-rows: auto auto;  /* Dos filas automáticas */
                gap: 10px;                      /* Espacio entre las filas y columnas */
                background-color: lightgray;
                padding: 20px;
            }


            .container {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 90vh;
                padding: 20px; /* Agrega un poco de relleno para evitar que el formulario toque los bordes */
            }
            .info-container {
                background-color: #f0f0f0; /* Color de fondo del contenedor */
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                max-width: 900px; /* Ajusta el ancho máximo del contenedor */
                width: 100%; /* Asegura que el contenedor ocupe el 100% del ancho disponible hasta el max-width */
            }
        </style>
    </head>
    <body>
        <h1>Esta es la pagina principal;)</h1>


        <div class="card border-primary p-3">

            <div class="info">
                <div class="team">Equipo Local</div>
                <div class="vs">vs</div>
                <div class="team">Equipo Visitante</div>
            </div>

        </div>

        <div class="container">
            <div class="info-container">



                <div class="row">

                    <div class="col-md-3">

                        <div class="mb-3">
                            <h3>Barcelona</h3>
                        </div> 


                    </div>

                    <div class="col-md-3">

                        <div class="mb-3">
                            <h3>1.75</h3>
                        </div> 


                    </div>

                </div>
                
                
                <div class="row">

                    <div class="col-md">

                        <div class="mb-1">
                            <h3>95' vs</h3> 
                        </div> 

                    </div>

                    <div class="col-md">

                        <div class="mb-3">
                            
                        </div> 

                    </div>
                </div>
                
                <div class="row">

                    <div class="col-md-3">

                        <div class="mb-3">
                            <h3>Real Madrid</h3>
                        </div> 


                    </div>

                    <div class="col-md-3">

                        <div class="mb-3">
                            <h3>1.90</h3>
                        </div> 


                    </div>

                </div>
                

            </div>

        </div>





        <!-- 
        <%
            ApiFutbol api = new ApiFutbol();
            String nombreEquipoLocal;
            api.equipoLocal();

            for (int i = 0; i < api.getJsonArrayHomeName().length(); i++) {


        %>

        <h2>Equipos locales: <%=api.getJsonArrayHomeName().getString(i)%></h2>
        <% }%>
        -->       
    </body>
</html>
