/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

/**
 *
 * @author Usuario
 */
import PaqueteLectura.GeneradorAleatorio;
public class Ej2 {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        int DimF = 15;
        Persona [] v = new Persona [DimF];

        String n = GeneradorAleatorio.generarString(15); 
        int d = GeneradorAleatorio.generarInt(99999999);
        int e = GeneradorAleatorio.generarInt(100);
        int DimL = 0;

        
        while ((DimL < DimF) && (e!=0)) {
            Persona p1 = new Persona();
            p1.setDNI(d);
            p1.setEdad(e);
            p1.setNombre(n);

            v[DimL] = p1;
            DimL = DimL + 1;

            n = GeneradorAleatorio.generarString(15); 
            d = GeneradorAleatorio.generarInt(99999999);
            e = GeneradorAleatorio.generarInt(100);
        }
        int cant = 0;
        Persona min = new Persona();
        min.setDNI(999999999);
        
        for (int i = 0; i < DimL; i++) {
            if (v[i].getEdad() > 65) 
                cant = cant + 1;
            if (v[i].getDNI() < min.getDNI()) {
                min = v[i];
            }
            System.out.println(v[i].toString());

        }
        System.out.println(cant);
        System.out.println(min.toString());
    }
}

