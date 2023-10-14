/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;
/**
 *
 * @author Usuario
 */
import PaqueteLectura.GeneradorAleatorio;
public class Habitacion {
    private double costo;
    private boolean ocupada;
    private Cliente cli;

    public Habitacion(Cliente unCliente) {
        this.costo = GeneradorAleatorio.generarDouble(6000) + 2000;
        this.ocupada = false;
        this.cli = unCliente;
    }
    
    public Habitacion() {
        this.costo = GeneradorAleatorio.generarDouble(6000) + 2000;
        this.ocupada = false;
        this.cli = unCliente;
    }
    
    public double getCosto() {
        return costo;
    }

    public void setCosto(double unCosto) {
        this.costo = unCosto;
    }

    public boolean getOcupada() {
        return ocupada;
    }

    public void setOcupada(boolean ocupada) {
        this.ocupada = ocupada;
    }
    
    public void setCliente (Cliente unCliente) {
        this.cli = unCliente;
    }

    public void aumento (double unMonto) {
        this.costo += unMonto;
    }

    @Override
    public String toString() {
        String aux = "costo: " +costo+ ",";
        if (!ocupada)
            aux += " libre ";
        else
            aux += " ocupada "+", cli:" + cli.toString();
        return aux;
    }
}
