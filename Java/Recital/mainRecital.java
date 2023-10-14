/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Recital;

/**
 *
 * @author Usuario
 */
import PaqueteLectura.*;
public class mainRecital {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int cantidadTemas = 2;
        System.out.println("EVENTO: ");
        System.out.println("ingrese motivo del evento (1,2,3); nombre del contratante, dia y nombre de la banda");
        Evento E = new Evento(Lector.leerInt(), Lector.leerString(), Lector.leerInt(), Lector.leerString(), cantidadTemas);
        E.agregarTema("love yourz");
        E.agregarTema("over now");
        System.out.println("-------------------------------------");
        
        System.out.println("GIRA: ");
        System.out.println("ingrese nombre de la banda y nombre de la gira");
        int dimFechas = 2; /* ESTO ES CANT DE FECHAS; cambiar por generador desp */
        Gira G = new Gira(Lector.leerString(), cantidadTemas, Lector.leerString(), dimFechas);
        G.agregarTema("trust issues");
        G.agregarTema("hotline bling");
        Fecha F;
        Fecha T;
        
        System.out.println("ingresa ciudad y despues dia: ");
        F = new Fecha(Lector.leerString(), Lector.leerInt());
        G.agregarFecha(F);
        System.out.println("ingresa ciudad y despues dia: ");
        T = new Fecha(Lector.leerString(), Lector.leerInt());
        G.agregarFecha(T);
        

        System.out.println("costo evento: " +E.calcularCosto());
        System.out.println("costo gira: " +G.calcularCosto());
        
        System.out.println(E.actuar());
        System.out.println(G.actuar());
    }
}
