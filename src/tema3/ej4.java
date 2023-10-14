/*
 A- Un hotel posee N habitaciones. De cada habitación conoce costo por noche, si está
ocupada y, en caso de estarlo, guarda el cliente que la reservó (nombre, DNI y edad).
(i) Genere las clases necesarias. Para cada una provea métodos getters/setters adecuados.

(ii) Implemente los constructores necesarios para iniciar: los clientes a partir de nombre,
DNI, edad; el hotel para N habitaciones, cada una desocupada y con costo aleatorio e/
2000 y 8000.

(iii) Implemente en las clases que corresponda todos los métodos necesarios para:
- Ingresar un cliente C en la habitación número X. Asuma que X es válido (es decir, está
en el rango 1..N) y que la habitación está libre.
- Aumentar el precio de todas las habitaciones en un monto recibido.

- Obtener la representación String del hotel, siguiendo el formato:
{Habitación 1: costo, libre u ocupada, información del cliente si está ocupada}
…
{Habitación N: costo, libre u ocupada, información del cliente si está ocupada}


B- Realice un programa que instancie un hotel, ingrese clientes en distintas habitaciones,
muestre el hotel, aumente el precio de las habitaciones y vuelva a mostrar el hotel.

 */
package tema3;
import PaqueteLectura.*;
/**
 *
 * @author Usuario
 */
public class ej4 {
  public static void main(String[] args) {
    GeneradorAleatorio.iniciar();
        System.out.println("ingrese la cantidad de habitaciones del hotel: "); int dimF = Lector.leerInt();
        Hotel hotel = new Hotel(dimF);
        
        /* cliente C */
        System.out.println("ingrese datos de cliente: "); Cliente C = new Cliente(Lector.leerString(), Lector.leerInt(), Lector.leerInt());
        /* habitacion X */
        System.out.println("habitacion en donde ingresarlo: "); int X = Lector.leerInt();
        hotel.ingresarCliente(C, X);
        /*           */
        
        System.out.println("sin aumentar");
        System.out.println(hotel.toString());
        
        /* monto */
        System.out.println("monto para aumentar: "); double monto = Lector.leerDouble();
        hotel.aumentarPrecio(monto);
        /*           */
        
        
    }
}
