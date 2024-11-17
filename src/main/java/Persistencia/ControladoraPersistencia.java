package Persistencia;

import Logica.Apuesta;
import Logica.Cliente;
import java.util.List;


public class ControladoraPersistencia {
    ApuestaJpaController apuestaJpa = new ApuestaJpaController();
    ClienteJpaController clienteJpa = new ClienteJpaController();
    

    
    //CLIENTE
    public void crearCliente(Cliente cliente) {
        clienteJpa.create(cliente);
    }

    public List<Cliente> mostrarClientes() {
        return clienteJpa.findClienteEntities();
    }

    public Cliente findClienteByEmail(String email) {
        return clienteJpa.findClienteByEmail(email);
    }

    public void crearApuesta(Apuesta apuesta) {
        apuestaJpa.create(apuesta);
    }

    public List<Apuesta> findApuestasByIdCliente(int id_cliente) {
        return apuestaJpa.findApuestasByIdCliente(id_cliente);
    }

    

}
