<%@page import="java.util.List"%>
<%@page import="Logica.Apuesta"%>
<%@include file="components/navbar_user_log.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>


        <style>
            .container-custom {
                display: flex;
                flex-direction: column;
                justify-content: flex-start;
                align-items: center;
                padding: 20px;
                margin-top: 20px;
            }

            .container-custom h1 {
                font-size: 2.5rem;
                margin-bottom: 10px;
                text-align: center;
            }
            .team-info {
                display: flex;
                justify-content: space-between;
                width: 100%;
                max-width: 800px;
                margin: 10 px 30px;

            }

            /* Columna izquierda con nombres y vs */
            .team-names {
                display: flex;
                flex-direction: column;
                text-align: left;
                max-width: 250px ;
                margin-left: 7rem;
            }

            .team-name {
                font-size: 1.7rem;
                font-weight: 700;
                margin-bottom: 5px;
            }

            .vs-time {
                font-size: 1.5rem;
                font-weight: 600;
                text-align: left;
                margin-bottom: 5px;
    
            }

            .team-info-item {
                display: flex;
                align-items: center;
                margin-bottom: 5px;
            }

            .team-logo {
                width: 40px;  /* Ajusta el tamaño del escudo */
                height: 40px;
                margin-right: 10px;  /* Espacio entre el escudo y el nombre */
            }

            /* Columna derecha con marcadores y multiplicadores */
            .team-scores {
                display: flex;
                flex-direction: column;
                text-align: right;
                margin-right: 9rem;
            }

            .score-item {
                margin-bottom: 5px; /* Espaciado entre elementos */
                font-size: 1.2rem; /* Ajusta el tamaño de letra según tu preferencia */
                font-weight: 500;
            }

            .score-row {
                display: flex;
                justify-content: flex-end;
                align-items: center;
                margin-bottom: 10px;
            }

            .team-score {
                font-size: 1.8rem;
                font-weight: 600;
                margin-right: 20px;
            }

            .multiplier-btn {
                font-size: 1.3rem;
                border-radius: 2.5px;
                padding: 1px 15px;
            }

            .btn-outline {
                background-color: #4A235A;
                border-color: #4A235A;
                color: white;
            }

            .btn-outline:hover {
                background-color: white;
                color: #4A235A;
                border-color: #4A235A;
            }

            .card {
                width: 90%;
                max-width: 850px;
                margin-bottom: 20px;
            }

            .card-body {
                border: 1px solid black;
                padding: 20px;
            }

            .card-footer {
                background-color: #4A235A;
                color: white !important;
                padding: 5px;
            }


        </style>
    </head>
    <body>

        <div class="container-custom">

            <h1>Historial apuestas</h1>

            <%

                List<Apuesta> listaApuestas = (List) request.getSession().getAttribute("listaApuestas");

                for (Apuesta apuesta : listaApuestas) {
        

            %>

            <div class="card text-center mt-4">
                <div class="card-body">
                    <div class="team-info">
                        <!-- Columna izquierda con nombres y vs -->
                        <div class="team-names">
                            <div class="team-info-item">

                                <div class="team-name"><%=apuesta.getEquipo_local()%></div>
                            </div>
                            <div class="vs-time">vs</div>
                            <div class="team-info-item">

                                <div class="team-name"><%=apuesta.getEquipo_visitante()%></div>
                            </div>

                        </div>


                        <!-- Columna derecha con marcadores y multiplicadores -->
                        <div class="team-scores">
                            <div class="score-item">Cantidad apostada: <%=String.valueOf(apuesta.getCantidad_apostar()) %></div>
                            <div class="score-item">Cuota: <%=String.valueOf(apuesta.getCuota_apuesta()) %></div>
                            <div class="score-item">Pago: <%=String.valueOf(apuesta.getPago_apuesta()) %></div>
                            <div class="score-item">Apuesta: <%=apuesta.getResultado_apostado()%></div>
                        </div>
                    </div>
                </div>
                <div class="card-footer text-body-secondary">
                    16/11/2024 2:00
                </div>
            </div>

            <%}%>

        </div>





    </body>
</html>
