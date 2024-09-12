
package Logica;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
public class Apuesta implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id_apuesta;
    private int cuota_local;
    private int cuota_visitante;
    private int resultado_apuesta;
    private int estado_apuesta;
    private int pago_apuesta;
    
    @OneToOne
    private Partido partido;
    
    @ManyToOne
    @JoinColumn(name="id_cliente")
    private Cliente client;

    public Apuesta() {
    }

    public Apuesta(int id_apuesta, int cuota_local, int cuota_visitante, int resultado_apuesta, int estado_apuesta, int pago_apuesta, Partido partido, Cliente client) {
        this.id_apuesta = id_apuesta;
        this.cuota_local = cuota_local;
        this.cuota_visitante = cuota_visitante;
        this.resultado_apuesta = resultado_apuesta;
        this.estado_apuesta = estado_apuesta;
        this.pago_apuesta = pago_apuesta;
        this.partido = partido;
        this.client = client;
    }

    public Cliente getClient() {
        return client;
    }

    public void setClient(Cliente client) {
        this.client = client;
    }

    

    public Partido getPartido() {
        return partido;
    }

    public void setPartido(Partido partido) {
        this.partido = partido;
    }

    
    
    public int getId_apuesta() {
        return id_apuesta;
    }

    public void setId_apuesta(int id_apuesta) {
        this.id_apuesta = id_apuesta;
    }

    public int getCuota_local() {
        return cuota_local;
    }

    public void setCuota_local(int cuota_local) {
        this.cuota_local = cuota_local;
    }

    public int getCuota_visitante() {
        return cuota_visitante;
    }

    public void setCuota_visitante(int cuota_visitante) {
        this.cuota_visitante = cuota_visitante;
    }

    public int getResultado_apuesta() {
        return resultado_apuesta;
    }

    public void setResultado_apuesta(int resultado_apuesta) {
        this.resultado_apuesta = resultado_apuesta;
    }

    public int getEstado_apuesta() {
        return estado_apuesta;
    }

    public void setEstado_apuesta(int estado_apuesta) {
        this.estado_apuesta = estado_apuesta;
    }

    public int getPago_apuesta() {
        return pago_apuesta;
    }

    public void setPago_apuesta(int pago_apuesta) {
        this.pago_apuesta = pago_apuesta;
    }
    
    
    
}
