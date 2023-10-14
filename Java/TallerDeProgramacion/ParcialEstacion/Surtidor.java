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
public class Surtidor {
    private String combustible;
    private double precioLitro;
    private Venta [] ven;
    private int dimVen;

    public Surtidor(String combustible, double precio, int V) {
        this.combustible = combustible;
        this.precioLitro = precio;
        this.dimVen = V;
        this.ven = new Venta [V];
        for (int i = 0; i < dimVen; i++)
            ven[i] = null;
    }
    
    public String getCombustible() {
        return combustible;
    }

    public void setCombustible(String combustible) {
        this.combustible = combustible;
    }

    public double getPrecio() {
        return precioLitro;
    }

    public void setPrecio(double precio) {
        this.precioLitro = precio;
    }
    
    public void nuevaVenta (int DNI, int cantLitros, double monto, String pago){
        boolean cond = true;
        Venta aux = new Venta(DNI, cantLitros, monto, pago);
        for (int i = 0; cond && i < dimVen; i++)
            if (ven[i] == null){
                ven[i] = aux;
                cond = false;
            }
    }
    
    public double montoEnEfectivo (){
        double aux = 0;
        for (int i = 0; i < dimVen; i++)
            if (ven[i] != null && ven[i].getMedioPago().equals("efectivo"))
                aux += ven[i].getMonto();
        
        return aux;
    }
    
    public String toStringVenta(){
        String aux = "";
        for (int i = 0; ven[i] != null && i < dimVen; i++)
            aux += "\n"+"dni: "+ven[i].getDni()+"; cantidad de litros: "+ven[i].getCantLitros()+"; monto: "+ven[i].getMonto()+"; medio de pago: "+ven[i].getMedioPago();
        return aux;
    }
}
