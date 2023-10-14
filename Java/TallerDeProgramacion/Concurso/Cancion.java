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
public class Cancion {
    private String nombreC;
    private String compositor;
    private int identificador;
    private Estudiante ganador;
    private double puntaje;

    public Cancion(String nombreC, String compositor, int identificador) {
        this.nombreC = nombreC;
        this.compositor = compositor;
        this.identificador = identificador;
        this.ganador = null;
        this.puntaje = 0;
    }

    public String getNombreCancion() {
        return nombreC;
    }

    public void setNombreCancion(String nombreC) {
        this.nombreC = nombreC;
    }

    public String getCompositor() {
        return compositor;
    }

    public void setCompositor(String compositor) {
        this.compositor = compositor;
    }

    public int getIdentificador() {
        return identificador;
    }

    public void setIdentificador(int identificador) {
        this.identificador = identificador;
    }

    public Estudiante getGanador() {
        return ganador;
    }

    public void setGanador(Estudiante ganador) {
        this.ganador = ganador;
    }

    public double getPuntaje() {
        return puntaje;
    }

    public void setPuntaje(double puntaje) {
        this.puntaje = puntaje;
    }
}
