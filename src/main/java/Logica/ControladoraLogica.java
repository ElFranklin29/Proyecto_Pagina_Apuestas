
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
}
