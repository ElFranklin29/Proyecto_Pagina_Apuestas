<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="components/navbar_user_log.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Detalles de Apuesta</title>
        <style>
            /* Contenedor principal */
            .card {
                border: 1px solid;
                border-radius: 8px;
                width: 90%;
                max-width: 950px;
                margin: 20px auto;
                padding: 35px;
            }

            /* Encabezado con equipos y multiplicadores */
            .team-info {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 20px;
                margin-top: 65px;
            }

            .team-info-item {
                display: flex;
                align-items: center;
                flex-direction: column;
                text-align: center;
                max-width: 150px;
            }

            .team-logo {
                width: 40px;
                height: 40px;
                margin-bottom: 10px;
            }

            /* Ajuste para que el nombre del equipo se adapte y se escriba en múltiples líneas */
            .team-name {
                font-size: 1.5rem;
                font-weight: 700;
                word-wrap: break-word;
                white-space: normal;
            }

            .multiplier-btn {
                font-size: 1.3rem;
                border-radius: 4px;
                padding: 5px 15px;
                background-color: #4A235A;
                border-color: #4A235A;
                color: white;
            }

            .multiplier-btn:hover {
                background-color: white;
                color: #4A235A;
                border-color: #4A235A;
            }

            /* Sección de marcador */
            .score-section {
                text-align: center;
                margin-top: 40px;
                word-wrap: break-word;
            }

            .score-title {
                font-size: 1.8rem;
                font-weight: 700;
                margin-bottom: 10px;
            }

            .team-scores {
                display: flex;
                justify-content: center;
                align-items: center;
                flex-wrap: wrap;
            }

            .team-score {
                font-size: 2rem;
                font-weight: 600;
                margin: 0 15px;
            }

            .vs-time {
                font-size: 1.5rem;
                font-weight: 600;
                margin-top: 10px;
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
        <!-- Contenedor principal -->
        <div class="card">
            <!-- Sección de equipos y multiplicadores -->
            <div class="team-info">
                <%
                    String nombreLocal = (String) request.getSession().getAttribute("nombreLocal");
                    String logoLocal = (String) request.getSession().getAttribute("logoLocal");
                    String golesLocal = (String) request.getSession().getAttribute("golesLocal");

                    String nombreVisitante = (String) request.getSession().getAttribute("nombreVisitante");
                    String logoVisitante = (String) request.getSession().getAttribute("logoVisitante");
                    String golesVisitante = (String) request.getSession().getAttribute("golesVisitante");
                %>
                <div class="team-info-item">
                    <img src="<%=logoLocal%>" alt="Escudo Local" class="team-logo">
                    <div class="team-name"><%=nombreLocal%></div>
                    <button class="btn multiplier-btn" id="multiplicadorLocal">1.80</button>
                </div>

                <!-- Empate -->
                <div class="team-info-item">

                    <div class="team-name">Empate</div>
                    <button class="btn multiplier-btn" id="multiplicadorEmpate">1.80</button>
                </div>

                <!-- Equipo Visitante -->
                <div class="team-info-item">
                    <img src="<%=logoVisitante%>" alt="Escudo Visitante" class="team-logo">
                    <div class="team-name"><%=nombreVisitante%></div>
                    <button class="btn multiplier-btn" id="multiplicadorVisitante">1.75</button>
                </div>
            </div>

            <!-- Sección de marcador y tiempo -->
            <div class="score-section">
                <div class="score-title">Marcador</div>
                <div class="team-scores">
                    <div class="team-score"><%=golesLocal%></div>
                    <span>-</span>
                    <div class="team-score"><%=golesVisitante%></div>
                </div>
                <div class="vs-time">45'</div>
            </div>
        </div>



        <!--ventanaLocal-->    
        
        <form action="SvDescripcionApuesta" method="POST">
        <div class="modal fade" id="vtnLocal" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                    </div>
                    <div class="modal-body text-center d-flex flex-column align-items-center justify-content-center">
                        <h2 class="mb-4">Confirmar apuesta</h2>
                        <!-- Información de la apuesta centrada -->
                        <div class="mb-3">
                            <label class="form-label fw-bold">Partido: </label>
                            <p id="nombreLocal"><%=nombreLocal%> </p> <p>vs</p> <p id="nombreVisitante"><%=nombreVisitante%></p>
                            <input type="hidden" name="nombreLocal" value="<%=nombreLocal%>">
                            <input type="hidden" name="nombreVisitante" value="<%=nombreVisitante%>">
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold">Ganador:</label>
                            <p id="resultadoApostado"><%=nombreLocal%></p>
                            <input type="hidden" name="resultadoApostado" value="<%=nombreLocal%>">
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold">Cuota:</label>
                            <p id="cuota">1.75</p>
                            <input type="hidden" name="cuota" value="1.75">
                        </div>

                        <!-- Input para ingresar valor a apostar -->
                        <div class="mb-4 w-70">
                            <label class="form-label fw-bold">Ingrese valor a apostar (Creditos):</label>
                            <input type="number" name="cantidadApostar" class="form-control text-center" placeholder="Ejemplo: 100" min="1">
                        </div>
                    </div>

                    <!-- Footer del modal con el botón centrado -->
                    <div class="modal-footer d-flex justify-content-center">
                        <button type="submit" class="btn btn-custom" >Apostar</button>
                    </div>
                </div>
            </div>
        </div>
        </form>                


        <!--ventanaVisitante-->     
         <form action="SvDescripcionApuesta" method="POST">
        <div class="modal fade" id="vtnVisitante" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                    </div>
                    <div class="modal-body text-center d-flex flex-column align-items-center justify-content-center">
                        <h2 class="mb-4">Confirmar apuesta</h2>
                        <!-- Información de la apuesta centrada -->
                        <div class="mb-3">
                            <label class="form-label fw-bold">Partido: </label>
                            <p id="nombreLocal"><%=nombreLocal%> </p> <p>vs</p> <p id="nombreVisitante"><%=nombreVisitante%></p>
                            <input type="hidden" name="nombreLocal" value="<%=nombreLocal%>">
                            <input type="hidden" name="nombreVisitante" value="<%=nombreVisitante%>">
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold">Ganador:</label>
                            <p id="resultadoApostado"><%=nombreVisitante%></p>
                            <input type="hidden" name="resultadoApostado" value="<%=nombreVisitante%>">
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold">Cuota:</label>
                            <p id="cuota">1.75</p>
                            <input type="hidden" name="cuota" value="1.75">
                        </div>

                        <!-- Input para ingresar valor a apostar -->
                        <div class="mb-4 w-70">
                            <label class="form-label fw-bold">Ingrese valor a apostar (Creditos):</label>
                            <input type="number" name="cantidadApostar" class="form-control text-center" placeholder="Ejemplo: 100" min="1">
                        </div>
                    </div>

                    <!-- Footer del modal con el botón centrado -->
                    <div class="modal-footer d-flex justify-content-center">
                        <button type="submit" class="btn btn-custom" >Apostar</button>
                    </div>
                </div>
            </div>
        </div>
        </form>            


        <!--ventanaEmpate-->     
          <form action="SvDescripcionApuesta" method="POST">
        <div class="modal fade" id="vtnEmpate" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                    </div>
                    <div class="modal-body text-center d-flex flex-column align-items-center justify-content-center">
                        <h2 class="mb-4">Confirmar apuesta</h2>
                        <!-- Información de la apuesta centrada -->
                        <div class="mb-3">
                            <label class="form-label fw-bold">Partido: </label>
                            <p id="nombreLocal"><%=nombreLocal%> </p> <p>vs</p> <p id="nombreVisitante"><%=nombreVisitante%></p>
                            <input type="hidden" name="nombreLocal" value="<%=nombreLocal%>">
                            <input type="hidden" name="nombreVisitante" value="<%=nombreVisitante%>">
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold">Ganador:</label>
                            <p id="resultadoApostado">empate</p>
                            <input type="hidden" name="resultadoApostado" value="EMmpate">
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold">Cuota:</label>
                            <p id="cuota">1.75</p>
                            <input type="hidden" name="cuota" value="1.75">
                        </div>

                        <!-- Input para ingresar valor a apostar -->
                        <div class="mb-4 w-70">
                            <label class="form-label fw-bold">Ingrese valor a apostar (Creditos):</label>
                            <input type="number" name="cantidadApostar" class="form-control text-center" placeholder="Ejemplo: 100" min="1">
                        </div>
                    </div>

                    <!-- Footer del modal con el botón centrado -->
                    <div class="modal-footer d-flex justify-content-center">
                        <button type="submit" class="btn btn-custom" >Apostar</button>
                    </div>
                </div>
            </div>
        </div>
        </form>            



        <!-- JavaScript directamente en el archivo HTML -->
        <script>
            // Obtener el botón y el modal
            const openModalBtnL = document.getElementById('multiplicadorLocal');
            const myModalLocal = new bootstrap.Modal(document.getElementById('vtnLocal'));

            openModalBtnL.addEventListener('click', () => {
                myModalLocal.show();
            });

            const openModalBtnV = document.getElementById('multiplicadorVisitante');
            const myModalVisitante = new bootstrap.Modal(document.getElementById('vtnVisitante'));

            openModalBtnV.addEventListener('click', () => {
                myModalVisitante.show();
            });

            const openModalBtnE = document.getElementById('multiplicadorEmpate');
            const myModalEmpate = new bootstrap.Modal(document.getElementById('vtnEmpate'));

            openModalBtnE.addEventListener('click', () => {
                myModalEmpate.show();
            });
            // Abrir el modal al hacer clic en el botón
        </script>


    </body>
</html>