/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParcialEstacion;

/**
 *
 * @author Usuario
 */
public class mainEstacion {
    public static void main(String[] args) {
        Estacion E = new Estacion("calle 32");
        Surtidor S1; Surtidor S2; Surtidor S3;
        int cantVentas = 3;
        
        S1 = new Surtidor("infinia", 10, cantVentas);
        E.agregarSurtidor(S1);
        S2 = new Surtidor("v power", 9, cantVentas);
        E.agregarSurtidor(S2);
        S3 = new Surtidor("super", 7, cantVentas);
        E.agregarSurtidor(S3);
        
        E.agregarVenta(1, 43223455, 10, "efectivo");
        E.agregarVenta(1, 23456676, 8, "efectivo");
        
        E.agregarVenta(0, 78686867, 17, "efectivo");
        E.agregarVenta(0, 54323235, 15, "efectivo");
        
        E.agregarVenta(2, 12445692, 9, "efectivo");
        E.agregarVenta(3, 12356048, 13, "efectivo");
        
        System.out.println(E.toString());
        
        System.out.println("----------");
        
        System.out.println("mayor monto en efectivo: "+E.mayorMontoCash());
    }
}
