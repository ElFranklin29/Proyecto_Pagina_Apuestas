package Persistencia;

import Logica.Cliente;
import java.util.List;


public class ControladoraPersistencia {
    ApuestaJpaController apuestaJpa = new ApuestaJpaController();
    ClienteJpaController clienteJpa = new ClienteJpaController();
    PartidoJpaController partidoJpa = new PartidoJpaController();

    
    //CLIENTE
    public void crearCliente(Cliente cliente) {
        clienteJpa.create(cliente);
    }

    public List<Cliente> mostrarClientes() {
        return clienteJpa.findClienteEntities();
    }

}
