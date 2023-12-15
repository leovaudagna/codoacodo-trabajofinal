package com.proyectofinaloradores.dto;

import com.proyectofinaloradores.herencia.Persona;
import java.sql.Timestamp;

/**
 *
 * @author leo_v
 */
public class Orador extends Persona {
    
    private String mail;
    private String tema;
    private Timestamp fechaAlta;

    public Orador() {
    }
    
    public Orador(String n, String a, String m, String t){
        super(n, a);
        this.mail = m;
        this.tema = t;
    }

    public Orador(String tema, Timestamp fechaAlta, long id, String nombre, String apellido) {
        super(id, nombre, apellido);
        this.tema = tema;
        this.fechaAlta = fechaAlta;
    }
    
    public Orador(int id, String nombre, String apellido, String mail, String tema, Timestamp fechaAlta) {
        super(id, nombre, apellido);
        this.mail = mail;
        this.tema = tema;
        this.fechaAlta = fechaAlta;
    }
    
    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }
    
    public String getTema() {
        return tema;
    }

    public void setTema(String tema) {
        this.tema = tema;
    }

    public Timestamp getFechaAlta() {
        return fechaAlta;
    }

    public void setFechaAlta(Timestamp fechaAlta) {
        this.fechaAlta = fechaAlta;
    }
    
    public void exponerCharla(){
        System.out.println("Hola soy " + this.nombre + " " + this.apellido + " y voy a hablar de: " + this.tema);
    }

    @Override
    public String toString() {
        return super.toString() + "Orador{" + "tema=" + tema + ", fechaAlta=" + fechaAlta + '}';
    }
    
    
    
    
    
}
