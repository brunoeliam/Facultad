/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Psicologo;

/**
 *
 * @author Usuario
 */
public class Paciente {
    private String nombre;
    private boolean ObraSocial;
    private double costo;

    public Paciente(String nombre, boolean ObraSocial, double costo) {
        this.nombre = nombre;
        this.ObraSocial = ObraSocial;
        this.costo = costo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public boolean isObraSocial() {
        return ObraSocial;
    }

    public void setObraSocial(boolean ObraSocial) {
        this.ObraSocial = ObraSocial;
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }
}
