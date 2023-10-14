/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

/*
 El dueño de un restaurante entrevista a cinco clientes y les pide que califiquen
(con puntaje de 1 a 10) los siguientes aspectos: (0) Atención al cliente (1) Calidad
de la comida (2) Precio (3) Ambiente.
Escriba un programa que lea desde teclado las calificaciones de los cinco clientes
para cada uno de los aspectos y almacene la información en una estructura. Luego
imprima la calificación promedio obtenida por cada aspecto.
 * @author Usuario
 */
import PaqueteLectura.Lector;
public class ej5 {
    
    public static void main(String[] args) {
        int dimCli = 5; int dimAspec = 4;
        int [][] m = new int [dimCli][dimAspec];
        
        int i, j;
        for (i = 0; i < dimCli; i++){
              System.out.print("cliente " +(i+1)+": ");
              for (j = 0; j < dimAspec; j++)
                  m[i][j] = Lector.leerInt();
        }
        
        int k, l;
        double total;
        for (k = 0; k < dimAspec; k++){
              total = 0;
              for (l = 0; l < dimCli; l++) {
                  total = total + m[l][k];
              }
              System.out.println("promedio aspecto "+k+": "+ (total / dimCli));
        }
    }
}