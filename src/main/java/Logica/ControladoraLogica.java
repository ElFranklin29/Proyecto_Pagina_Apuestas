
package Logica;

import Persistencia.ControladoraPersistencia;
import java.util.List;


public class ControladoraLogica {
    ControladoraPersistencia controlPersis = new ControladoraPersistencia();
    
    //CLIENTE
    public void crearCliente(Cliente cliente){
        controlPersis.crearCliente(cliente);
    }
    
    public List<Cliente> mostrarClientes(){
        return controlPersis.mostrarClientes();
    }
    
    public Cliente findClienteByEmail (String email){
        return controlPersis.findClienteByEmail(email);
    }
    
    public void crearApuesta(Apuesta apuesta){
        controlPersis.crearApuesta(apuesta);
    }
    
    public List<Apuesta> findApuestasByIdCliente(int id_cliente){
        return controlPersis.findApuestasByIdCliente(id_cliente);
    }
   
}
