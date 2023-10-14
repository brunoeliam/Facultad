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
public class Evento extends Recital {
    private int motivo;
    private String nombreContratante;
    private int dia;

    public Evento(int motivo, String nombreContratante, int dia, String unNombre, int dimF) {
        super(unNombre, dimF);
        this.motivo = motivo;
        this.nombreContratante = nombreContratante;
        this.dia = dia;
    }
    
    public int getMotivo() {
        return motivo;
    }

    public void setMotivo(int motivo) {
        this.motivo = motivo;
    }

    public String getNombreContratante() {
        return nombreContratante;
    }

    public void setNombreContratante(String nombreContratante) {
        this.nombreContratante = nombreContratante;
    }

    public int getDia() {
        return dia;
    }

    public void setDia(int dia) {
        this.dia = dia;
    }
    
    @Override
    public String actuar (){
        String aux;
        if (motivo == 1) 
            aux = "Recuerden colaborar con " + nombreContratante;
        else if (motivo == 2) 
            aux = "Saludos amigos televidentes";
        else
            aux = "Un feliz cumpleaños para " + nombreContratante;
        return (aux + super.actuar());
    }
    
    @Override
    public double calcularCosto(){
        double costo;
        if (motivo == 1)
            costo = 0;
        else if (motivo == 2)
            costo = 50000;
        else 
            costo = 150000;
        return costo;
    }
}
