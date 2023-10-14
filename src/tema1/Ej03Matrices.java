/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

//Paso 1. importar la funcionalidad para generar datos aleatorios
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
public class Ej03Matrices {

    public static void main(String[] args) {
	GeneradorAleatorio.iniciar();
        // crear matriz
        int dimF = 5;
        int dimC = 5;
        int [][] m = new int [dimF] [dimC];
        int i, k;
        for (i = 0; i < dimF; i++) {
            for (k = 0; k < dimC; k++) {
                m[i][k] = GeneradorAleatorio.generarInt(31);
        }
        } 
        // 
        //
        
        for (i = 0; i < dimF; i++) {
            System.out.println("");
            for (k = 0; k < dimC; k++) {
                System.out.print("("+i+","+k+") "+ m[i][k]+ " | ");
        }
        }
        
        ////
        //// 
        
         double suma = 0;
         for (k = 0; k < dimC; k++) 
             suma = suma + m[0][k];
         System.out.println("la suma de los elementos de la fila 1 es: " + suma);
         
         //
         //
         //
         
         int j, l; // j: COLUMNA   l: FILA
         int [] vector = new int [dimC];
         
         for (j = 0; j < dimC; j++) {
             vector[j] = 0;
             for (l = 0; l < dimF; l++)
                vector[j] = vector[j] + m[l][j];
         }
         int n;
         for (n = 0; n < dimC; n++)
            System.out.println("columna " +n+ " suma: " + vector[n]);
         
         //
         //
         //
         
         System.out.println("ingrese num entero a buscar: ");
         int num = Lector.leerInt();
         boolean encontre = false;
         int f;
         int c = 0;
         
         for (f = 0; f < 5 && !encontre; f++)
             for (c = 0; c < 5 && !encontre; c++)
                 if (m[f][c] == num)
                    encontre = true;  
         
         if (encontre)
            System.out.println("el num se encuentra en la posicion (" +(f-1)+"," +(c-1)+ ")");
         else
            System.out.println("No se encontro el elemento");
         
         //
    }
}