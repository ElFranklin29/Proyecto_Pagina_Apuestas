/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

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


@WebServlet(name = "SvIniciarSesion", urlPatterns = {"/SvIniciarSesion"})
public class SvIniciarSesion extends HttpServlet {
        ControladoraLogica controlLogica = new ControladoraLogica();

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
      
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        String email = request.getParameter("email");
        
        String password = request.getParameter("password");
        
        Cliente currentCliente = new Cliente();
        
        
        
        if (controlLogica.findClienteByEmail(email)!=null) {
            currentCliente = controlLogica.findClienteByEmail(email);
            if (currentCliente.getContraseña().equals(password)) {              
                System.out.println("Inicio Sesion CORRECTO");
                response.sendRedirect("pagina_inicio.jsp");
                
                HttpSession miSession = request.getSession();
                miSession.setAttribute("currentCliente", currentCliente);
            }else{
                 response.sendRedirect("iniciar_sesion.jsp");
                 System.out.println("Contraseña incorrecta");
            }
        }else{
            response.sendRedirect("iniciar_sesion.jsp");
            System.out.println("no se encontro correo");
        }
  
        
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
