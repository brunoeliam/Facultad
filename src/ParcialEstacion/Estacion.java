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
public class Estacion {
    private String direccion;
    private Surtidor [] v;
    private int dimSurt = 0;

    public Estacion(String direccion) {
        this.direccion = direccion;
        this.v = new Surtidor [6];
        for (int i = 0; i < 6; i++)
            v[i] = null;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    
    public void agregarSurtidor(Surtidor S){
        boolean cond = true; int i = dimSurt;
        while (cond && i < 6)
            if (v[i] == null){
                v[i] = S;
                cond = false;
                this.dimSurt++;
            }
        i++;   
    }
    
    public void agregarVenta(int N, int DNI, int cantLitros, String pago){
        if (v[N] != null)
            v[N].nuevaVenta(DNI, cantLitros, (v[N].getPrecio()*cantLitros), pago);
    }
    
    public int mayorMontoCash(){
        double max = -1; int aux = 0;
        for (int i = 0; i < dimSurt; i++)
            if (v[i] != null && v[i].montoEnEfectivo() > max){
                max = v[i].montoEnEfectivo();
                aux = i;
            }    
        return aux;
    }
    
    public String toString(){
        String aux = "";
        for (int i = 0; i < dimSurt; i++)
            aux += "\n Surtidor "+i+"; combustible: "+v[i].getCombustible()+"; precio por litro: "+v[i].getPrecio()+v[i].toStringVenta();
        return "Estacion de Servicio: Direccion: "+this.direccion+"; Cantidad de surtidores: "+dimSurt+"; Ventas: "+dimSurt+aux;
    }
}