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
public class Tesis extends Premiacion {
    
    public Tesis(int N) {
        super(N);
    }
    
    public String otorgarPremio(int dimF, Alumno [] v){
        int max1 = -1; int max2 = -1; String alumnoMax1 = ""; String alumnoMax2 = "";
        for (int i = 0; i < dimF && v[i] != null; i++) {
            if (v[i].getNota() > max1){
                max2 = max1;
                alumnoMax2 = alumnoMax1;
                max1 = v[i].getNota();
                alumnoMax1 = v[i].getNombre();
            }
            else if (v[i].getNota() > max2){
                max2 = v[i].getNota();
                alumnoMax2 = v[i].getNombre();
            }
        }
        return alumnoMax1 + alumnoMax2;
    }
}