/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import Logica.Apuesta;
import Logica.Cliente;
import Logica.ControladoraLogica;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "SvDescripcionApuesta", urlPatterns = {"/SvDescripcionApuesta"})
public class SvDescripcionApuesta extends HttpServlet {
    
    ControladoraLogica controlLogica = new ControladoraLogica();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
      

        String nombreLocal = request.getParameter("nombreLocal");
        String logoLocal = request.getParameter("logoLocal");
        String golesLocal = request.getParameter("golesLocal");

        String nombreVisitante = request.getParameter("nombreVisitante");
        String logoVisitante = request.getParameter("logoVisitante");
        String golesVisitante = request.getParameter("golesVisitante");

        HttpSession miSession = request.getSession();
        miSession.setAttribute("nombreLocal", nombreLocal);
        miSession.setAttribute("logoLocal", logoLocal);
        miSession.setAttribute("golesLocal", golesLocal);
        miSession.setAttribute("nombreVisitante", nombreVisitante);
        miSession.setAttribute("logoVisitante", logoVisitante);
        miSession.setAttribute("golesVisitante", golesVisitante);

        response.sendRedirect("descripcion_apuesta.jsp");

      /*  
        System.out.println("NOMBRE EQU LOCAL: "+nombreLocal);
        System.out.println("LOGO EQU LOCAL: "+logoLocal);
        System.out.println("GOLES LOCAL: "+golesLocal);
        System.out.println("");
        System.out.println("NOMBRE EQU VISIT: "+nombreVisitante);
        System.out.println("LOGO EQU VISIT: "+logoVisitante);
        System.out.println("GOLES VISITANTE: "+golesVisitante);
         */
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        
        String nombreLocal = request.getParameter("nombreLocal");
        String nombreVisitante = request.getParameter("nombreVisitante");
        String resultadoApostado =  request.getParameter("resultadoApostado");
        String cantidadApostar = request.getParameter("cantidadApostar");
        String cuota = request.getParameter("cuota");
        
        Cliente currentCliente = (Cliente) request.getSession().getAttribute("currentCliente");
        
        Apuesta apuesta = new Apuesta();
        
        apuesta.setEquipo_local(nombreLocal);
        apuesta.setEquipo_visitante(nombreVisitante);
        apuesta.setResultado_apostado(resultadoApostado);
        apuesta.setCantidad_apostar(Integer.parseInt(cantidadApostar));
        apuesta.setCuota_apuesta(Float.parseFloat(cuota));
        apuesta.setPago_apuesta(apuesta.getCantidad_apostar() * apuesta.getCuota_apuesta());
        apuesta.setId_cliente(currentCliente.getId_cliente());
        apuesta.setResultado_apuesta("En juego");
        
        controlLogica.crearApuesta(apuesta);
        
        System.out.println("");
        System.out.println("");
        System.out.println("INFORMACION CONFIRMAR APUESTA");
        System.out.println("NombreLocal " + nombreLocal);
        System.out.println("NombreVisitante " + nombreVisitante);
        /*
        System.out.println("ResltadoApostado " + resultadoApostado);
        System.out.println("cantidadApostar " + cantidadApostar);
        System.out.println("cuota " + cuota);
        */
        
        System.out.println("");
        System.out.println("INFO APUESTA");
        System.out.println("resultadoApostado "+ apuesta.getResultado_apostado());
        System.out.println("pagoApuesta "+ apuesta.getPago_apuesta());
        System.out.println("idCliente " + apuesta.getId_cliente());
    }

    @Override
    public String getServletInfo() {
        return "Short description";

    }

}
