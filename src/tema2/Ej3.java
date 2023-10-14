/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;
/*
Se realizará un casting para un programa de TV. El casting durará a lo sumo 5 días y en
cada día se entrevistarán a 8 personas en distinto turno.

a) Simular el proceso de inscripción de personas al casting. A cada persona se le pide
nombre, DNI y edad y se la debe asignar en un día y turno de la siguiente manera: las
personas primero completan el primer día en turnos sucesivos, luego el segundo día y así
siguiendo. La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los
40 cupos de casting.
Una vez finalizada la inscripción:

b) Informar para cada día y turno asignado, el nombre de la persona a entrevistar.
NOTA: utilizar la clase Persona. Pensar en la estructura de datos a utilizar. Para comparar
Strings use el método equals.
 */
import PaqueteLectura.Lector;
public class Ej3 {
  public static void main(String[] args){
    int dimF = 2;   // turnos
    int dimC = 1;   // dias
    Persona [][] m = new Persona [dimF][dimC];
    
    // leo persona
    System.out.println("nombre: "); String nom = Lector.leerString();
    System.out.println("dni: "); int dni = Lector.leerInt();
    System.out.println("edad: "); int edad = Lector.leerInt();
    //
    
    int i = 0; int j = 0;
    while ((j < dimC) && !(nom.equals("ZZZ"))) {
        i = 0;
        while ((i < dimF) && !(nom.equals("ZZZ"))) {
            m[i][j] = new Persona(nom, dni, edad);
            System.out.println("nombre: "); nom = Lector.leerString();
            System.out.println("dni: "); dni = Lector.leerInt();
            System.out.println("edad: "); edad = Lector.leerInt();
            i++;
            }
        j++;
    }
    
    // prueba de impresion
    int f, c;
        for (c = 0; (c < dimC); c++) {
            System.out.println("");
            for (f = 0; (f < dimF); f++)
                System.out.print("|" + m[f][c].getNombre());
        }
  }
  }
// && !(nom.equals("ZZZ")