
package Logica;


import java.io.Serializable;
import java.util.Date;


import javax.persistence.Entity;

import java.util.List;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Cliente implements Serializable {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id_cliente;
    
    private int creditos;
    private String tipo_documento;
    private String nombre;
    private String apellido;
    private String correo;
    private String contraseña;
    
    @Temporal(TemporalType.DATE)
    private Date fecha_nac;
    
 
    public Cliente() {
    }
    
   



    public Cliente(int id_cliente, int creditos, String tipo_documento, String nombre, String apellido, String correo, String contraseña, Date fecha_nac) {
        this.id_cliente = id_cliente;
        this.creditos = creditos;
        this.tipo_documento = tipo_documento;
        this.nombre = nombre;
        this.apellido = apellido;
        this.correo = correo;
        this.contraseña = contraseña;
        this.fecha_nac = fecha_nac;
    }
    
    

    public Date getFecha_nac() {
        return fecha_nac;
    }

    public void setFecha_nac(Date fecha_nac) {
        this.fecha_nac = fecha_nac;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getContraseña() {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    public int getCreditos() {
        return creditos;
    }

    public void setCreditos(int creditos) {
        this.creditos = creditos;
    }
    
  

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    public String getTipo_documento() {
        return tipo_documento;
    }

    public void setTipo_documento(String tipo_documento) {
        this.tipo_documento = tipo_documento;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

  

  
   
}
