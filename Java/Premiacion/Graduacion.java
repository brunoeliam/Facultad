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
public class Graduacion extends Premiacion {
    
    public Graduacion(int N) {
        super(N);
    }
    
    public String otorgarPremio(int dimF, Alumno [] v){
        int min1 = 99; int min2 = 99; String alumnoMin1 = ""; String alumnoMin2 = "";
        for (int i = 0; i < dimF && v[i] != null; i++) {
            if (v[i].getAnios() < min1){
                min2 = min1;
                alumnoMin2 = alumnoMin1;
                min1 = v[i].getAnios();
                alumnoMin1 = v[i].getNombre();
            }
            else if (v[i].getAnios() < min2){
                min2 = v[i].getAnios();
                alumnoMin2 = v[i].getNombre();
            }
        }
        return alumnoMin1 + alumnoMin2;
    }
}
