/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Concurso;

/**
 *
 * @author Usuario
 */
public class Estudiante {
    private String nombreE;
    private String apellido;
    private int dni;

    public Estudiante(String nombreE, String apellido, int dni) {
        this.nombreE = nombreE;
        this.apellido = apellido;
        this.dni = dni;
    }

    public String getNombreEstudiante() {
        return nombreE;
    }

    public void setNombreEstudiante(String nombre) {
        this.nombreE = nombreE;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }
}
