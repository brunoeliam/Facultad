/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Recital;

/**
 *
 * @author Usuario
 */
public class Gira extends Recital {
    private String nombreGira;
    private Fecha [] vFechas;
    private int actual = 0;
    private int dimFechas;

    public Gira (String nombreBanda, int dimF, String nombreGira, int dimFechas){
        super(nombreBanda, dimF);
        this.nombreGira = nombreGira;
        this.dimFechas = dimFechas;
        
        vFechas = new Fecha[dimFechas];
        for (int i = 0; i < dimFechas; i++)
            vFechas[i] = null;
    }

    public void agregarFecha(Fecha F) {
        int i = 0; boolean aux = true;
        while (aux && i < dimFechas){
            if (vFechas[i] == null) {
                vFechas[i] = F;
                aux = false;
            }
        i++;
        }
    }
    
    public String getNombreGira() {
        return nombreGira;
    }

    public void setNombreGira(String nombreGira) {
        this.nombreGira = nombreGira;
    }

    public int getActual() {
        return actual;
    }

    public void setActual(int actual) {
        this.actual = actual;
    }
    
    @Override
    public String actuar (){
        actual++;
        return ("Buenas noches " +vFechas[actual-1].getCiudad()+ super.actuar());
    }
    
    @Override
    public double calcularCosto(){
        return dimFechas * 30000;
    }
}
