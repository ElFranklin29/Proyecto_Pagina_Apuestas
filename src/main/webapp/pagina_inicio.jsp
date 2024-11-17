<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="APIFutbol.ApiFutbolApuesta"%>
<%@page import="APIFutbol.ApiFutbol"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="components/navbar_user_log.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
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

            .highlight {
                color: #8600C6;
            }

            /* Estructura de la card con dos columnas */
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
                margin-left: 3rem;
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
                justify-content: space-between;
                text-align: right;
                margin-right: 9rem;

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

        <!-- Partidos La Liga-->

        <div class="container-custom">
            <h1>Partidos <span class="highlight">La Liga</span></h1>


            <%

                ApiFutbol api = new ApiFutbol();
                api.FechaActual();
                api.llamarEndpoint();
                api.equipoLocal();

                api.equipoVisitante();
                api.goalsEquipoLocal();
                api.goalsEquipoVisitante();
                api.LogoEquipoLocal();
                api.LogoEquipoVisitante();
                api.obtenerIdLiga();
                api.fechaPartido();

                for (int i = 0; i < api.getJsonArrayHomeName().length(); i++) {
                    if (api.getJsonArrayLeague().getString(i).equals("140")) {


            %>

            <div class="card text-center mt-4">
                <div class="card-body">
                    <form action="SvDescripcionApuesta" method="GET">      
                        <div class="team-info">

                            <!-- Columna izquierda con nombres y vs -->
                            <div class="team-names">
                                <div class="team-info-item">
                                    <img src="<%=api.getJsonArrayLogoHome().getString(i)%>" id="logoLocal" alt="Escudo Local" class="team-logo">
                                    <!-- Pasar datos de DIV a SERVLET -->
                                    <input type="hidden" name="logoLocal" value="<%=api.getJsonArrayLogoHome().getString(i)%>">

                                    <div class="team-name" id="nombreLocal"><%=api.getJsonArrayHomeName().getString(i)%></div>
                                    <!-- Pasar datos de DIV a SERVLET -->
                                    <input type="hidden" name="nombreLocal" value="<%=api.getJsonArrayHomeName().getString(i)%>">
                                </div>
                                <div class="vs-time">45'</div>
                                <div class="team-info-item">
                                    <img src="<%=api.getJsonArrayLogoAway().getString(i)%>" id="logoVisitante" alt="Escudo Visitante" class="team-logo">
                                    <!-- Pasar datos de DIV a SERVLET -->
                                    <input type="hidden" name="logoVisitante" value="<%=api.getJsonArrayLogoAway().getString(i)%>">

                                    <div class="team-name" id="nombreVisitante"><%=api.getJsonArrayAwayName().getString(i)%></div>
                                    <!-- Pasar datos de DIV a SERVLET -->
                                    <input type="hidden" name="nombreVisitante" value="<%=api.getJsonArrayAwayName().getString(i)%>">
                                </div>

                            </div>


                            <!-- Columna derecha con marcadores y multiplicadores -->
                            <div class="team-scores">
                                <div class="score-row">
                                    <div class="team-score" id="golesLocal"><%=api.getJsonArrayHomeGoals().getString(i)%></div>
                                    <!-- Pasar datos de DIV a SERVLET -->
                                   <input type="hidden" name="golesLocal" value="<%=api.getJsonArrayHomeGoals().getString(i)%>">

                                    <button class="btn btn-outline multiplier-btn" type="submit">1.80</button>

                                </div>
                                <div class="score-row">
                                    <div class="team-score" id="GolesVisitante"><%= api.getJsonArrayAwayGoals().getString(i)%></div>
                                    <input type="hidden" name="golesVisitante" value="<%= api.getJsonArrayAwayGoals().getString(i)%>">

                                    <button class="btn btn-outline multiplier-btn">1.75</button>
                                </div>
                            </div>

                        </div>
                    </form>
                </div>

                <div class="card-footer text-body-secondary">

                </div>
            </div>

            <%}
                }%>



            <!-- Partidos Premier League-->

            <h1>Partidos <span class="highlight">Premier League</span></h1>

            <%

                for (int i = 0; i < api.getJsonArrayHomeName().length(); i++) {
                    if (api.getJsonArrayLeague().getString(i).equals("39")) {


            %>

            <div class="card text-center mt-4">
                <div class="card-body">
                    <form action="SvDescripcionApuesta" method="GET">      
                        <div class="team-info">

                            <!-- Columna izquierda con nombres y vs -->
                            <div class="team-names">
                                <div class="team-info-item">
                                    <img src="<%=api.getJsonArrayLogoHome().getString(i)%>" id="logoLocal" alt="Escudo Local" class="team-logo">
                                    <!-- Pasar datos de DIV a SERVLET -->
                                    <input type="hidden" name="logoLocal" value="<%=api.getJsonArrayLogoHome().getString(i)%>">

                                    <div class="team-name" id="nombreLocal"><%=api.getJsonArrayHomeName().getString(i)%></div>
                                    <!-- Pasar datos de DIV a SERVLET -->
                                    <input type="hidden" name="nombreLocal" value="<%=api.getJsonArrayHomeName().getString(i)%>">
                                </div>
                                <div class="vs-time">45'</div>
                                <div class="team-info-item">
                                    <img src="<%=api.getJsonArrayLogoAway().getString(i)%>" id="logoVisitante" alt="Escudo Visitante" class="team-logo">
                                    <!-- Pasar datos de DIV a SERVLET -->
                                    <input type="hidden" name="logoVisitante" value="<%=api.getJsonArrayLogoAway().getString(i)%>">

                                    <div class="team-name" id="nombreVisitante"><%=api.getJsonArrayAwayName().getString(i)%></div>
                                    <!-- Pasar datos de DIV a SERVLET -->
                                    <input type="hidden" name="nombreVisitante" value="<%=api.getJsonArrayAwayName().getString(i)%>">
                                </div>

                            </div>


                            <!-- Columna derecha con marcadores y multiplicadores -->
                            <div class="team-scores">
                                <div class="score-row">
                                    <div class="team-score" id="golesLocal"><%=api.getJsonArrayHomeGoals().getString(i)%></div>
                                    <!-- Pasar datos de DIV a SERVLET -->
                                   <input type="hidden" name="golesLocal" value="<%=api.getJsonArrayHomeGoals().getString(i)%>">

                                    <button class="btn btn-outline multiplier-btn" type="submit">1.80</button>

                                </div>
                                <div class="score-row">
                                    <div class="team-score" id="GolesVisitante"><%= api.getJsonArrayAwayGoals().getString(i)%></div>
                                    <input type="hidden" name="golesVisitante" value="<%= api.getJsonArrayAwayGoals().getString(i)%>">

                                    <button class="btn btn-outline multiplier-btn">1.75</button>
                                </div>
                            </div>

                        </div>
                    </form>
                </div>

                <div class="card-footer text-body-secondary">

                </div>
            </div>

            <%}
                }%>




            <!-- Partidos Bundesliga-->

            <h1>Partidos <span class="highlight">Bundesliga</span></h1>

            <%

                for (int i = 0; i < api.getJsonArrayHomeName().length(); i++) {
                    if (api.getJsonArrayLeague().getString(i).equals("78")) {


            %>

            <div class="card text-center mt-4">
                <div class="card-body">
                    <form action="SvDescripcionApuesta" method="GET">      
                        <div class="team-info">

                            <!-- Columna izquierda con nombres y vs -->
                            <div class="team-names">
                                <div class="team-info-item">
                                    <img src="<%=api.getJsonArrayLogoHome().getString(i)%>" id="logoLocal" alt="Escudo Local" class="team-logo">
                                    <!-- Pasar datos de DIV a SERVLET -->
                                    <input type="hidden" name="logoLocal" value="<%=api.getJsonArrayLogoHome().getString(i)%>">

                                    <div class="team-name" id="nombreLocal"><%=api.getJsonArrayHomeName().getString(i)%></div>
                                    <!-- Pasar datos de DIV a SERVLET -->
                                    <input type="hidden" name="nombreLocal" value="<%=api.getJsonArrayHomeName().getString(i)%>">
                                </div>
                                <div class="vs-time">45'</div>
                                <div class="team-info-item">
                                    <img src="<%=api.getJsonArrayLogoAway().getString(i)%>" id="logoVisitante" alt="Escudo Visitante" class="team-logo">
                                    <!-- Pasar datos de DIV a SERVLET -->
                                    <input type="hidden" name="logoVisitante" value="<%=api.getJsonArrayLogoAway().getString(i)%>">

                                    <div class="team-name" id="nombreVisitante"><%=api.getJsonArrayAwayName().getString(i)%></div>
                                    <!-- Pasar datos de DIV a SERVLET -->
                                    <input type="hidden" name="nombreVisitante" value="<%=api.getJsonArrayAwayName().getString(i)%>">
                                </div>

                            </div>


                            <!-- Columna derecha con marcadores y multiplicadores -->
                            <div class="team-scores">
                                <div class="score-row">
                                    <div class="team-score" id="golesLocal"><%=api.getJsonArrayHomeGoals().getString(i)%></div>
                                    <!-- Pasar datos de DIV a SERVLET -->
                                   <input type="hidden" name="golesLocal" value="<%=api.getJsonArrayHomeGoals().getString(i)%>">

                                    <button class="btn btn-outline multiplier-btn" type="submit">1.80</button>

                                </div>
                                <div class="score-row">
                                    <div class="team-score" id="GolesVisitante"><%= api.getJsonArrayAwayGoals().getString(i)%></div>
                                    <input type="hidden" name="golesVisitante" value="<%= api.getJsonArrayAwayGoals().getString(i)%>">

                                    <button class="btn btn-outline multiplier-btn">1.75</button>
                                </div>
                            </div>

                        </div>
                    </form>
                </div>

                <div class="card-footer text-body-secondary">

                </div>
            </div>

            <%}
                }%>

            <!-- Partidos Ligue 1-->

            <h1>Partidos <span class="highlight">Ligue 1</span></h1>

            <%

                for (int i = 0; i < api.getJsonArrayHomeName().length(); i++) {
                    if (api.getJsonArrayLeague().getString(i).equals("61")) {


            %>

            <div class="card text-center mt-4">
                <div class="card-body">
                    <form action="SvDescripcionApuesta" method="GET">      
                        <div class="team-info">

                            <!-- Columna izquierda con nombres y vs -->
                            <div class="team-names">
                                <div class="team-info-item">
                                    <img src="<%=api.getJsonArrayLogoHome().getString(i)%>" id="logoLocal" alt="Escudo Local" class="team-logo">
                                    <!-- Pasar datos de DIV a SERVLET -->
                                    <input type="hidden" name="logoLocal" value="<%=api.getJsonArrayLogoHome().getString(i)%>">

                                    <div class="team-name" id="nombreLocal"><%=api.getJsonArrayHomeName().getString(i)%></div>
                                    <!-- Pasar datos de DIV a SERVLET -->
                                    <input type="hidden" name="nombreLocal" value="<%=api.getJsonArrayHomeName().getString(i)%>">
                                </div>
                                <div class="vs-time">45'</div>
                                <div class="team-info-item">
                                    <img src="<%=api.getJsonArrayLogoAway().getString(i)%>" id="logoVisitante" alt="Escudo Visitante" class="team-logo">
                                    <!-- Pasar datos de DIV a SERVLET -->
                                    <input type="hidden" name="logoVisitante" value="<%=api.getJsonArrayLogoAway().getString(i)%>">

                                    <div class="team-name" id="nombreVisitante"><%=api.getJsonArrayAwayName().getString(i)%></div>
                                    <!-- Pasar datos de DIV a SERVLET -->
                                    <input type="hidden" name="nombreVisitante" value="<%=api.getJsonArrayAwayName().getString(i)%>">
                                </div>

                            </div>


                            <!-- Columna derecha con marcadores y multiplicadores -->
                            <div class="team-scores">
                                <div class="score-row">
                                    <div class="team-score" id="golesLocal"><%=api.getJsonArrayHomeGoals().getString(i)%></div>
                                    <!-- Pasar datos de DIV a SERVLET -->
                                   <input type="hidden" name="golesLocal" value="<%=api.getJsonArrayHomeGoals().getString(i)%>">

                                    <button class="btn btn-outline multiplier-btn" type="submit">1.80</button>

                                </div>
                                <div class="score-row">
                                    <div class="team-score" id="GolesVisitante"><%= api.getJsonArrayAwayGoals().getString(i)%></div>
                                    <input type="hidden" name="golesVisitante" value="<%= api.getJsonArrayAwayGoals().getString(i)%>">

                                    <button class="btn btn-outline multiplier-btn">1.75</button>
                                </div>
                            </div>

                        </div>
                    </form>
                </div>

                <div class="card-footer text-body-secondary">

                </div>
            </div>

            <%}
                }%>

            <!-- Partidos Serie A-->

            <h1>Partidos <span class="highlight">Serie A</span></h1>

            <%

                for (int i = 0; i < api.getJsonArrayHomeName().length(); i++) {
                    if (api.getJsonArrayLeague().getString(i).equals("135")) {


            %>

            <div class="card text-center mt-4">
                <div class="card-body">
                    <form action="SvDescripcionApuesta" method="GET">      
                        <div class="team-info">

                            <!-- Columna izquierda con nombres y vs -->
                            <div class="team-names">
                                <div class="team-info-item">
                                    <img src="<%=api.getJsonArrayLogoHome().getString(i)%>" id="logoLocal" alt="Escudo Local" class="team-logo">
                                    <!-- Pasar datos de DIV a SERVLET -->
                                    <input type="hidden" name="logoLocal" value="<%=api.getJsonArrayLogoHome().getString(i)%>">

                                    <div class="team-name" id="nombreLocal"><%=api.getJsonArrayHomeName().getString(i)%></div>
                                    <!-- Pasar datos de DIV a SERVLET -->
                                    <input type="hidden" name="nombreLocal" value="<%=api.getJsonArrayHomeName().getString(i)%>">
                                </div>
                                <div class="vs-time">45'</div>
                                <div class="team-info-item">
                                    <img src="<%=api.getJsonArrayLogoAway().getString(i)%>" id="logoVisitante" alt="Escudo Visitante" class="team-logo">
                                    <!-- Pasar datos de DIV a SERVLET -->
                                    <input type="hidden" name="logoVisitante" value="<%=api.getJsonArrayLogoAway().getString(i)%>">

                                    <div class="team-name" id="nombreVisitante"><%=api.getJsonArrayAwayName().getString(i)%></div>
                                    <!-- Pasar datos de DIV a SERVLET -->
                                    <input type="hidden" name="nombreVisitante" value="<%=api.getJsonArrayAwayName().getString(i)%>">
                                </div>

                            </div>


                            <!-- Columna derecha con marcadores y multiplicadores -->
                            <div class="team-scores">
                                <div class="score-row">
                                    <div class="team-score" id="golesLocal"><%=api.getJsonArrayHomeGoals().getString(i)%></div>
                                    <!-- Pasar datos de DIV a SERVLET -->
                                   <input type="hidden" name="golesLocal" value="<%=api.getJsonArrayHomeGoals().getString(i)%>">

                                    <button class="btn btn-outline multiplier-btn" type="submit">1.80</button>

                                </div>
                                <div class="score-row">
                                    <div class="team-score" id="GolesVisitante"><%= api.getJsonArrayAwayGoals().getString(i)%></div>
                                    <input type="hidden" name="golesVisitante" value="<%= api.getJsonArrayAwayGoals().getString(i)%>">

                                    <button class="btn btn-outline multiplier-btn">1.75</button>
                                </div>
                            </div>

                        </div>
                    </form>
                </div>

                <div class="card-footer text-body-secondary">

                </div>
            </div>

            <%}
                }%>


            <!-- Partidos Liga Argentina-->

            <h1>Partidos <span class="highlight">Liga Argentina</span></h1>

            <%

                for (int i = 0; i < api.getJsonArrayHomeName().length(); i++) {
                    if (api.getJsonArrayLeague().getString(i).equals("128")) {


            %>

            <div class="card text-center mt-4">
                <div class="card-body">
                    <form action="SvDescripcionApuesta" method="GET">      
                        <div class="team-info">

                            <!-- Columna izquierda con nombres y vs -->
                            <div class="team-names">
                                <div class="team-info-item">
                                    <img src="<%=api.getJsonArrayLogoHome().getString(i)%>" id="logoLocal" alt="Escudo Local" class="team-logo">
                                    <!-- Pasar datos de DIV a SERVLET -->
                                    <input type="hidden" name="logoLocal" value="<%=api.getJsonArrayLogoHome().getString(i)%>">

                                    <div class="team-name" id="nombreLocal"><%=api.getJsonArrayHomeName().getString(i)%></div>
                                    <!-- Pasar datos de DIV a SERVLET -->
                                    <input type="hidden" name="nombreLocal" value="<%=api.getJsonArrayHomeName().getString(i)%>">
                                </div>
                                <div class="vs-time">45'</div>
                                <div class="team-info-item">
                                    <img src="<%=api.getJsonArrayLogoAway().getString(i)%>" id="logoVisitante" alt="Escudo Visitante" class="team-logo">
                                    <!-- Pasar datos de DIV a SERVLET -->
                                    <input type="hidden" name="logoVisitante" value="<%=api.getJsonArrayLogoAway().getString(i)%>">

                                    <div class="team-name" id="nombreVisitante"><%=api.getJsonArrayAwayName().getString(i)%></div>
                                    <!-- Pasar datos de DIV a SERVLET -->
                                    <input type="hidden" name="nombreVisitante" value="<%=api.getJsonArrayAwayName().getString(i)%>">
                                </div>

                            </div>


                            <!-- Columna derecha con marcadores y multiplicadores -->
                            <div class="team-scores">
                                <div class="score-row">
                                    <div class="team-score" id="golesLocal"><%=api.getJsonArrayHomeGoals().getString(i)%></div>
                                    <!-- Pasar datos de DIV a SERVLET -->
                                   <input type="hidden" name="golesLocal" value="<%=api.getJsonArrayHomeGoals().getString(i)%>">

                                    <button class="btn btn-outline multiplier-btn" type="submit">1.80</button>

                                </div>
                                <div class="score-row">
                                    <div class="team-score" id="GolesVisitante"><%= api.getJsonArrayAwayGoals().getString(i)%></div>
                                    <input type="hidden" name="golesVisitante" value="<%= api.getJsonArrayAwayGoals().getString(i)%>">

                                    <button class="btn btn-outline multiplier-btn">1.75</button>
                                </div>
                            </div>

                        </div>
                    </form>
                </div>

                <div class="card-footer text-body-secondary">

                </div>
            </div>

            <%}
                }%>



            <!-- Partidos Liga Colombia-->

            <h1>Partidos <span class="highlight">Liga Colombia</span></h1>

            <%

                for (int i = 0; i < api.getJsonArrayHomeName().length(); i++) {
                    if (api.getJsonArrayLeague().getString(i).equals("239")) {


            %>

            <div class="card text-center mt-4">
                <div class="card-body">
                    <form action="SvDescripcionApuesta" method="GET">      
                        <div class="team-info">

                            <!-- Columna izquierda con nombres y vs -->
                            <div class="team-names">
                                <div class="team-info-item">
                                    <img src="<%=api.getJsonArrayLogoHome().getString(i)%>" id="logoLocal" alt="Escudo Local" class="team-logo">
                                    <!-- Pasar datos de DIV a SERVLET -->
                                    <input type="hidden" name="logoLocal" value="<%=api.getJsonArrayLogoHome().getString(i)%>">

                                    <div class="team-name" id="nombreLocal"><%=api.getJsonArrayHomeName().getString(i)%></div>
                                    <!-- Pasar datos de DIV a SERVLET -->
                                    <input type="hidden" name="nombreLocal" value="<%=api.getJsonArrayHomeName().getString(i)%>">
                                </div>
                                <div class="vs-time">45'</div>
                                <div class="team-info-item">
                                    <img src="<%=api.getJsonArrayLogoAway().getString(i)%>" id="logoVisitante" alt="Escudo Visitante" class="team-logo">
                                    <!-- Pasar datos de DIV a SERVLET -->
                                    <input type="hidden" name="logoVisitante" value="<%=api.getJsonArrayLogoAway().getString(i)%>">

                                    <div class="team-name" id="nombreVisitante"><%=api.getJsonArrayAwayName().getString(i)%></div>
                                    <!-- Pasar datos de DIV a SERVLET -->
                                    <input type="hidden" name="nombreVisitante" value="<%=api.getJsonArrayAwayName().getString(i)%>">
                                </div>

                            </div>


                            <!-- Columna derecha con marcadores y multiplicadores -->
                            <div class="team-scores">
                                <div class="score-row">
                                    <div class="team-score" id="golesLocal"><%=api.getJsonArrayHomeGoals().getString(i)%></div>
                                    <!-- Pasar datos de DIV a SERVLET -->
                                   <input type="hidden" name="golesLocal" value="<%=api.getJsonArrayHomeGoals().getString(i)%>">

                                    <button class="btn btn-outline multiplier-btn" type="submit">1.80</button>

                                </div>
                                <div class="score-row">
                                    <div class="team-score" id="GolesVisitante"><%= api.getJsonArrayAwayGoals().getString(i)%></div>
                                    <input type="hidden" name="golesVisitante" value="<%= api.getJsonArrayAwayGoals().getString(i)%>">

                                    <button class="btn btn-outline multiplier-btn">1.75</button>
                                </div>
                            </div>

                        </div>
                    </form>
                </div>

                <div class="card-footer text-body-secondary">

                </div>
            </div>

            <%}
                }%>


            <h1>Partidos <span class="highlight">en General</span></h1>

            <%

                for (int i = 0; i < api.getJsonArrayHomeName().length(); i++) {


            %>

            <div class="card text-center mt-4">
                <div class="card-body">
                    <form action="SvDescripcionApuesta" method="GET">      
                        <div class="team-info">

                            <!-- Columna izquierda con nombres y vs -->
                            <div class="team-names">
                                <div class="team-info-item">
                                    <img src="<%=api.getJsonArrayLogoHome().getString(i)%>" id="logoLocal" alt="Escudo Local" class="team-logo">
                                    <!-- Pasar datos de DIV a SERVLET -->
                                    <input type="hidden" name="logoLocal" value="<%=api.getJsonArrayLogoHome().getString(i)%>">

                                    <div class="team-name" id="nombreLocal"><%=api.getJsonArrayHomeName().getString(i)%></div>
                                    <!-- Pasar datos de DIV a SERVLET -->
                                    <input type="hidden" name="nombreLocal" value="<%=api.getJsonArrayHomeName().getString(i)%>">
                                </div>
                                <div class="vs-time">45'</div>
                                <div class="team-info-item">
                                    <img src="<%=api.getJsonArrayLogoAway().getString(i)%>" id="logoVisitante" alt="Escudo Visitante" class="team-logo">
                                    <!-- Pasar datos de DIV a SERVLET -->
                                    <input type="hidden" name="logoVisitante" value="<%=api.getJsonArrayLogoAway().getString(i)%>">

                                    <div class="team-name" id="nombreVisitante"><%=api.getJsonArrayAwayName().getString(i)%></div>
                                    <!-- Pasar datos de DIV a SERVLET -->
                                    <input type="hidden" name="nombreVisitante" value="<%=api.getJsonArrayAwayName().getString(i)%>">
                                </div>

                            </div>


                            <!-- Columna derecha con marcadores y multiplicadores -->
                            <div class="team-scores">
                                <div class="score-row">
                                    <div class="team-score" id="golesLocal"><%=api.getJsonArrayHomeGoals().getString(i)%></div>
                                    <!-- Pasar datos de DIV a SERVLET -->
                                   <input type="hidden" name="golesLocal" value="<%=api.getJsonArrayHomeGoals().getString(i)%>">

                                    <button class="btn btn-outline multiplier-btn" type="submit">1.80</button>

                                </div>
                                <div class="score-row">
                                    <div class="team-score" id="GolesVisitante"><%= api.getJsonArrayAwayGoals().getString(i)%></div>
                                    <input type="hidden" name="golesVisitante" value="<%= api.getJsonArrayAwayGoals().getString(i)%>">

                                    <button class="btn btn-outline multiplier-btn">1.75</button>
                                </div>
                            </div>

                        </div>
                    </form>
                </div>

                <div class="card-footer text-body-secondary">

                </div>
            </div>

            <%
                }%>








        </div>

    </body>
</html>
