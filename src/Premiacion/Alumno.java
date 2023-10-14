/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Premiacion;

/**
 *
 * @author Usuario
 */
public class Alumno {
    private String nombre;
    private int nota;
    private int anios;

    public Alumno(String nombre, int nota, int anios) {
        this.nombre = nombre;
        this.nota = nota;
        this.anios = anios;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getNota() {
        return nota;
    }

    public void setNota(int nota) {
        this.nota = nota;
    }

    public int getAnios() {
        return anios;
    }

    public void setAnios(int anios) {
        this.anios = anios;
    }
}
