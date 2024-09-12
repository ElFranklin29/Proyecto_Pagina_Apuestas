/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import Logica.Cliente;
import Logica.ControladoraLogica;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.format.DateTimeFormatter;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
 

public class SvCliente extends HttpServlet {
    ControladoraLogica controlLogica = new ControladoraLogica();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
       
        List<Cliente> listaClientes = new ArrayList<>();
        listaClientes = controlLogica.mostrarClientes();
        
        
        HttpSession misesion = request.getSession();
        misesion.setAttribute("listaClientes", listaClientes);

        
        response.sendRedirect("ver_clientes.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        Cliente cliente = new Cliente();

        int id = Integer.parseInt(request.getParameter("numero_doc"));
        String tipo_doc = request.getParameter("tipo_doc");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String correo = request.getParameter("correo");
        String contraseña = request.getParameter("contraseña");       
      
        String fechaNacString = request.getParameter("fecha_nac");
        
        // Definir el formato esperado
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        
        try {
            // Convertir String a java.util.Date
            java.util.Date date = formatter.parse(fechaNacString);
            cliente.setFecha_nac(date);
            
            
        } catch (ParseException e) {
            e.printStackTrace(); // Manejar la excepción en caso de formato incorrecto
        }
        System.out.println("////////////////////////////////////");
        System.out.println("fecha: "+cliente.getFecha_nac());
        

        cliente.setId_cliente(id);
        cliente.setTipo_documento(tipo_doc);
        cliente.setNombre(nombre);
        cliente.setApellido(apellido);
        cliente.setCorreo(correo);
        cliente.setContraseña(contraseña);
        cliente.setCreditos(100);
                
        controlLogica.crearCliente(cliente);
        

        response.sendRedirect("iniciar_sesion.jsp");

        
        //   System.out.println(id+", "+tipo_doc+", "+nombre+", "+apellido+", "+cliente.getFecha_nac()+", "+
 //              correo+", "+contraseña);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
