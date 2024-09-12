
package Logica;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Partido implements Serializable {
    @Id
    @GeneratedValue (strategy=GenerationType.AUTO)
    private int id_partido;
    private int equipo_local;
    private int equipo_visitante;
    
    @Temporal(TemporalType.TIMESTAMP)
    private Date fecha_partido;

    public Partido() {
    }

    public Partido(int id_partido, int equipo_local, int equipo_visitante, Date fecha_partido) {
        this.id_partido = id_partido;
        this.equipo_local = equipo_local;
        this.equipo_visitante = equipo_visitante;
        this.fecha_partido = fecha_partido;
    }

    public int getId_partido() {
        return id_partido;
    }

    public void setId_partido(int id_partido) {
        this.id_partido = id_partido;
    }

    public int getEquipo_local() {
        return equipo_local;
    }

    public void setEquipo_local(int equipo_local) {
        this.equipo_local = equipo_local;
    }

    public int getEquipo_visitante() {
        return equipo_visitante;
    }

    public void setEquipo_visitante(int equipo_visitante) {
        this.equipo_visitante = equipo_visitante;
    }

    public Date getFecha_partido() {
        return fecha_partido;
    }

    public void setFecha_partido(Date fecha_partido) {
        this.fecha_partido = fecha_partido;
    }
    
    
}
