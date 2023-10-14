package tema1;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/*
 *
 * Un edificio de oficinas está conformado por 8 pisos (1..8) y 4 oficinas por piso
(1..4). Realice un programa que permita informar la cantidad de personas que
concurrieron a cada oficina de cada piso. Para esto, simule la llegada de personas al
edificio de la siguiente manera: a cada persona se le pide el nro. de piso y nro. de
oficina a la cual quiere concurrir. La llegada de personas finaliza al indicar un nro.
de piso 9. Al finalizar la llegada de personas, informe lo pedido.
 * @author Usuario
 */
import PaqueteLectura.GeneradorAleatorio;
public class ej4 {
    
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int dimF = 8; int dimC = 4;
        int [][] m = new int [dimF][dimC];
        int piso, ofi;
        
        System.out.println("numero de piso: "); piso = GeneradorAleatorio.generarInt(10);
        while (piso != 9) {
            System.out.println("numero de oficina: "); ofi = GeneradorAleatorio.generarInt(4);
            if (piso == 8)
                piso = piso - 1;
            m[piso][ofi] = m[piso][ofi] + 1;
            System.out.println("numero de piso: "); piso = GeneradorAleatorio.generarInt(10);
        }
        
        int i, j;
        for (i = 0; i < dimF; i++){
            System.out.println("");
            for (j = 0; j < dimC; j++)
                System.out.print("|" +m[i][j]);
        }
}           
}