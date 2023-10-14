/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Psicologo;

/**
 *
 * @author Usuario
 */
public class Sistema {
    private Paciente [][] m;
    private int dimTurnos;
    private int dimDias;
    
    public Sistema(int dimDias, int dimTurnos) {
        this.dimDias = dimDias;
        this.dimTurnos = dimTurnos;
        this.m = new Paciente[dimTurnos][dimDias];  
        for (int i = 0; i < dimDias; i++)
            for (int j = 0; j < dimTurnos; j++)
                this.m[j][i] = null;
    }
    
    public int agendarPaciente (Paciente P, int dia){
        int aux = 0; boolean cond = true; 
        int i = 0;
        while (cond && i < dimTurnos){
                if (m[i][dia] == null){
                    this.m[i][dia] = P;
                    cond = false;
                    aux = i;
                }
        i++;
        }
        return aux;          
    }
    
    public void liberarTurnos (String nombreABuscar){
        boolean cond = true;
        for (int i = 0; i < dimDias; i++)
            for (int j = 0; cond && j < dimTurnos; j++)
                if (m[j][i] != null && m[j][i].getNombre().equals(nombreABuscar))
                    m[j][i] = null;
                    cond = false;
    }
    
    public int calcularTurno (){
        int [] v = new int [6];
        for (int k = 0; k < 6; k++)
            v[k] = 0;
        
        for (int i = 0; i < this.dimDias; i++)
            for (int j = 0; j < this.dimTurnos; j++)
                if (m[j][i] != null)
                    v[j]++;
        
        int maxTurno = -1;
        int pos = 0;
        for (int l = 0; l < 6; l++)
            if (v[l] > maxTurno){
                pos = l;
                maxTurno = v[l];
            }
        return pos;
    }
}
