
package com.ieseljust.ad.cepa3_exercice_frankcarreres.Model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author frank
 */

@Entity
@Table(name = "Persona")
public class Persona {
    
   static final long serialVersionUID = 137L;
    
   @Id
   @GeneratedValue(strategy=GenerationType.IDENTITY)
   private int idPersona;
   
   @Column
   private String nombre;
   
   @Column
   private String apellidos;
   
   @Column
   private int edad;

    public Persona() {
    }

    public Persona(String nombre, String apellidos, int edad) {
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.edad = edad;
    }

    public int getIdPersona() {
        return idPersona;
    }

    public void setIdPersona(int idPersona) {
        this.idPersona = idPersona;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    @Override
    public String toString() {
        return "(" + this.idPersona + ") " + this.nombre + " " + this.apellidos + " --> " + this.edad;
    }
    
    

}
