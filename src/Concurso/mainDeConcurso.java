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

import PaqueteLectura.*;
public class mainDeConcurso {
    public static void main(String[] args) {
        Estudiante E; Cancion can;
        
        int dimCanciones = 5;
        int dimCategorias = 3;
        Concurso C = new Concurso (dimCanciones, dimCategorias);
        
        /* esto va con lector */
        can = new Cancion("ejercicio choto", "men at work", 123);
        C.agregarCancion(0, can);
        can = new Cancion("matute es gay", "michael", 598);
        C.agregarCancion(1, can);
        can = new Cancion("counter", "los pibes", 671);
        C.agregarCancion(2, can);
        can = new Cancion("gonza se la come", "cerati", 550);
        C.agregarCancion(1, can);
        can = new Cancion("que mierda escribo", "patricia sosa", 987);
        C.agregarCancion(1, can);
        /*                    */
        
        System.out.println("ingrese nombre, apellido y despues DNI del estudiante: ");
        E = new Estudiante (Lector.leerString(), Lector.leerString(), Lector.leerInt());
        System.out.println("ingrese identificador y puntaje otorgado: "); int identificador = Lector.leerInt(); double puntaje = Lector.leerDouble();
        C.interpretar(identificador, puntaje, E);
        while (identificador != 0){
            System.out.println("ingrese nombre, apellido y despues DNI del estudiante: ");
            E = new Estudiante (Lector.leerString(), Lector.leerString(), Lector.leerInt());
            System.out.println("ingrese identificador y puntaje otorgado: "); identificador = Lector.leerInt(); puntaje = Lector.leerDouble();
            C.interpretar(identificador, puntaje, E);
        }
        
        System.out.println("ingrese identificador para buscar ganador de esa cancion: ");
        int idenGanador = Lector.leerInt();
        if (C.ganador(idenGanador) == null)
            System.out.println("Nadie");
        else
            System.out.println("el ganador fue: "+C.ganador(idenGanador).getNombreEstudiante()+C.ganador(idenGanador).getApellido()+C.ganador(idenGanador).getDni());
        
        for (int k = 0; k < dimCategorias; k++)
            System.out.println("nombre de cancion y compositor de cancion mejor interpretada: "+C.mejorPuntaje(k).getNombreCancion()+C.mejorPuntaje(k).getCompositor());
    }
}
