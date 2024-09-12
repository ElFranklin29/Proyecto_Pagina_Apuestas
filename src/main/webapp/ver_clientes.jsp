<%@page import="java.util.List"%>
<%@page import="Logica.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="components/navbar_user_log.jsp"%>
<!DOCTYPE html>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ver Clientes</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="Style/ver_clientes.css" rel="stylesheet" type="text/css"/>
        <style>
            
        </style>
    </head>
    <body>
        <div class="container-fluid d-flex justify-content-center align-items-start" style="height: 100%;">
            <div class="container-gray">
                <div class="container-title">
                    Ver Clientes
                </div>
                <div class="table-container">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Tipo Documento</th>
                                <th scope="col">Numero Documento</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Apellido</th>
                                <th scope="col">Fecha Nacimiento</th>
                                <th scope="col">Correo</th>
                            </tr>
                        </thead>
                        <tbody>

                            <%
                                List<Cliente> listaCliente = (List) request.getSession().getAttribute("listaClientes");
                                int cont = 0;
                                for (Cliente client : listaCliente) {
                            %>
                            <tr>
                                <th scope="row"><%=cont%></th>
                                <td><%=client.getTipo_documento()%></td>
                                <td><%=client.getId_cliente()%></td>
                                <td><%=client.getNombre()%></td>
                                <td><%=client.getApellido()%></td>
                                <td><%=client.getFecha_nac()%></td>
                                <td><%=client.getCorreo()%></td>
                            </tr>
                            <%
                                    cont++;
                                }
                            %>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>


