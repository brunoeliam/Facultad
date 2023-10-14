/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Premiacion;

/**
 *
 * @author Usuario
 */
public abstract class Premiacion {
    private Alumno [] v;
    private int dimF;

    public Premiacion (int N) {
        dimF = N;
        this.v = new Alumno [N];
        for (int i = 0; i < N; i++)
            v[i] = null;
    }
    
    public void agregarPostulante (Alumno A){
        boolean aux = true;
        int i = 0;
        while (aux && i < this.dimF){
            if (this.v[i] == null) {
                this.v[i] = A;
                aux = false;
            }
            i++;
        }
    }
    
    public abstract String otorgarPremio (int dimF, Alumno [] v);
}
