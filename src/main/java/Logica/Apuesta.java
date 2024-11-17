package Logica;

import java.io.Serializable;
import java.time.LocalDateTime;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Apuesta implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id_apuesta;
    private float cuota_apuesta;
    private String resultado_apuesta;
    private String equipo_local;
    private String equipo_visitante;
    private float pago_apuesta;
    private int id_cliente;
    private String resultado_apostado;
    private int cantidad_apostar;
   

    public Apuesta() {
    }

    public Apuesta(int id_apuesta, float cuota_apuesta, String resultado_apuesta, String equipo_local, String equipo_visitante, float pago_apuesta, int id_cliente, String resultado_apostado, int cantidad_apostar) {
        this.id_apuesta = id_apuesta;
        this.cuota_apuesta = cuota_apuesta;
        this.resultado_apuesta = resultado_apuesta;
        this.equipo_local = equipo_local;
        this.equipo_visitante = equipo_visitante;
        this.pago_apuesta = pago_apuesta;
        this.id_cliente = id_cliente;
        this.resultado_apostado = resultado_apostado;
        this.cantidad_apostar = cantidad_apostar;
    }
    
    
    
    public String getEquipo_local() {
        return equipo_local;
    }

    public void setEquipo_local(String equipo_local) {
        this.equipo_local = equipo_local;
    }

    public float getCuota_apuesta() {
        return cuota_apuesta;
    }

    public void setCuota_apuesta(float cuota_apuesta) {
        this.cuota_apuesta = cuota_apuesta;
    }

    public String getEquipo_visitante() {
        return equipo_visitante;
    }

    public void setEquipo_visitante(String equipo_visitante) {
        this.equipo_visitante = equipo_visitante;
    }

    public String getResultado_apostado() {
        return resultado_apostado;
    }

    public void setResultado_apostado(String resultado_apostado) {
        this.resultado_apostado = resultado_apostado;
    }

    public int getCantidad_apostar() {
        return cantidad_apostar;
    }

    public void setCantidad_apostar(int cantidad_apostar) {
        this.cantidad_apostar = cantidad_apostar;
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    public void setCuota_apuesta(int cuota_apuesta) {
        this.cuota_apuesta = cuota_apuesta;
    }

    public int getId_apuesta() {
        return id_apuesta;
    }

    public void setId_apuesta(int id_apuesta) {
        this.id_apuesta = id_apuesta;
    }

    public String getResultado_apuesta() {
        return resultado_apuesta;
    }

    public void setResultado_apuesta(String resultado_apuesta) {
        this.resultado_apuesta = resultado_apuesta;
    }

    public float getPago_apuesta() {
        return pago_apuesta;
    }

    public void setPago_apuesta(float pago_apuesta) {
        this.pago_apuesta = pago_apuesta;
    }

}
