
package tema1;

//Paso 1: Importar la funcionalidad para lectura de datos
import PaqueteLectura.GeneradorAleatorio;

public class Ej02Jugadores {
    
    
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int DimF = 15;
        double [] v = new double[DimF];
        int i;
        double total = 0;
        for (i = 0; i < DimF; i++) {
            v[i] = GeneradorAleatorio.generarDouble(230);
            total = total + v[i];
        }
        double promedio = total / DimF;
        int j;
        int cant = 0;
        for (j = 0; j < DimF; j++)
            if (v[j] > promedio) 
                cant = cant + 1;
        System.out.print("promedio: " + promedio + " cant: " + cant);
    }
}
