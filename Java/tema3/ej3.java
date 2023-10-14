/*
    3-A- Defina una clase para representar estantes. Un estante almacena a lo sumo 20 libros. 
    Implemente un constructor que permita iniciar el estante sin libros. Provea métodos para:

    (i) devolver la cantidad de libros que almacenados (ii) devolver si el estante está lleno 
    (iii) agregar un libro al estante (iv) devolver el libro con un título particular que se recibe.

    B- Realice un programa que instancie un estante. Cargue varios libros. A partir del estante, 
    busque e informe el autor del libro “Mujercitas”.

    C- Piense: ¿Qué modificaría en la clase definida para ahora permitir estantes que 
    almacenen como máximo N libros? ¿Cómo instanciaría el estante?

 */
package tema3;
public class ej3 {
    public static void main(String[] args) {
        int dimF = 3;
        Estante estan = new Estante();

        estan.Estante(dimF);

        Autor A1 = new Autor("Juan","adafag","entino");
        Libro L1 = new Libro("wgwgeweg","Trop",A1,"asd");

        estan.agregarLibro(L1); // (iii)

        Autor A2 = new Autor("Pedro","Ssss","Argno");
        Libro L2 = new Libro("aefa","afaf",A2,"asdasdd");

        estan.agregarLibro(L2);

        System.out.println(estan.getDimL()); // (i)

        estan.estaLleno();     // (ii)

        System.out.println(estan.getLibroPorTitulo("prueba")); // B (iv)
     
    }
}    
