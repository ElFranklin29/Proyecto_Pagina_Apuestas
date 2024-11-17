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
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "SvHistorialApuestas", urlPatterns = {"/SvHistorialApuestas"})
public class SvHistorialApuestas extends HttpServlet {

    ControladoraLogica controlLogica = new ControladoraLogica();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        Cliente currentCliente = (Cliente) request.getSession().getAttribute("currentCliente");

        List<Apuesta> listaApuestas = new ArrayList<>();
        listaApuestas = controlLogica.findApuestasByIdCliente(currentCliente.getId_cliente());
    
        HttpSession misesion = request.getSession();
        misesion.setAttribute("listaApuestas", listaApuestas);
        
        response.sendRedirect("historial_apuestas.jsp");
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
