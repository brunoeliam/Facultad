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
public class Concurso {
    private Cancion [][] m;
    private int dimCan;
    private int dimCat;

    public Concurso(int dimCanciones, int dimCategorias) {
        this.dimCan = dimCanciones;
        this.dimCat = dimCategorias;
        m = new Cancion [dimCanciones][dimCategorias];
        for (int i = 0; i < dimCan; i++)
            for (int j = 0; j < dimCat; j++)
                m[i][j] = null;
    }
    
    public void agregarCancion (int categoria, Cancion C){
        boolean aux = true; int i = 0;
        while (aux && i < dimCat) {
            if (m[i][categoria] == null){
                m[i][categoria] = C;
                aux = false;
            }
        i++;
        }   
    }
    
    public void interpretar (int ident, double puntajeN, Estudiante E){
        boolean cond = true;
        for (int i = 0; cond && i < dimCan; i++)
            for (int j = 0; cond && j < dimCat; j++)
                if ((m[i][j] != null) &&  m[i][j].getIdentificador() == ident){
                    cond = false;
                    if (puntajeN > m[i][j].getPuntaje()){
                        m[i][j].setPuntaje(puntajeN);
                        m[i][j].setGanador(E);
                    }
        }
    }
    
    public Estudiante ganador (int ident){
        Estudiante aux = null; boolean cond = true;
        for (int i = 0; cond && i < dimCan; i++)
            for (int j = 0; cond && j < dimCat; j++)
                if ((m[i][j] != null) && this.m[i][j].getIdentificador() == ident){
                    aux = this.m[i][j].getGanador();
                    cond = false;
                }
        return aux;
    }
    
    public Cancion mejorPuntaje (int categoria){
        double maxPuntaje = -1; Cancion can = null;
        for (int i = 0; i < dimCat; i++)
            if ((m[i][categoria] != null) && m[i][categoria].getPuntaje() > maxPuntaje){
                maxPuntaje = m[i][categoria].getPuntaje();
                can = m[i][categoria];
            }   
        return can; 
    }
}
