/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/* 5 B- Realizar un programa que instancie un círculo, le cargue información leída de teclado e
informe en consola el perímetro y el área.
 */
import PaqueteLectura.Lector;
public class ej5 {
    public static void main(String[] args) {
        System.out.println("ingrese radio, color de relleno y luego color de linea del circulo: ");
        double radio = Lector.leerDouble(); String colorR = Lector.leerString(); String colorL = Lector.leerString();
        Circulo c1 = new Circulo(radio, colorR, colorL);
        
        System.out.println("perimetro: "+c1.calcularPerimetro()+", area: "+ c1.calcularArea());
    }
}
