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
import PaqueteLectura.Lector;
public class Hotel {
   private Habitacion [] vector;
   private int dimF;
   private int dimL = 0;

        public Hotel(int dimF) {
            this.dimF = dimF;
            this.vector = new Habitacion[dimF];
            for (int i = 0; i < dimF; i++)
                this.vector[i] = new Habitacion();
        }
        
        public void agregarHabitacion (Habitacion H) {
            this.vector[dimL] = H;
            dimL++;
        }
                
        public void ingresarCliente (Cliente unCliente, int pos) { 
            vector[pos].setCliente(unCliente);
            vector[pos].setOcupada(true);
        }
        
        public void aumentarPrecio (double unMonto){
            for (int i = 0; i < dimF; i++)
                vector[i].aumento(unMonto);
        }
   
        public String toString () {
            String aux = "";
            for (int i = 0; i < dimF; i++)
                aux += "Habitacion "+i+":"+ vector[i].toString();
            return aux;
        }
}

