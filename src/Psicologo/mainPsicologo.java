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
import PaqueteLectura.*;
public class mainPsicologo {
    public static void main(String[] args) {
        int dimDias = 5;
        int dimTurnos = 6;
        Sistema S = new Sistema(dimDias,dimTurnos);
        
        
        Paciente P1 = new Paciente("juan",true,1000);
        Paciente P2 = new Paciente("pedro",false,1500);
        Paciente P3 = new Paciente("tebi",true,998);
        Paciente P4 = new Paciente("ttttaera",true,1200);
        Paciente P5 = new Paciente("nombre",false,2000);
        Paciente P6 = new Paciente("agweg",false,2245);
        S.agendarPaciente(P1, 0);
        S.agendarPaciente(P2, 1);
        S.agendarPaciente(P3, 1);
        S.agendarPaciente(P4, 2);
        S.agendarPaciente(P5, 2);
        S.agendarPaciente(P6, 3);
        
        
        S.liberarTurnos("pedro");
        
        System.out.println(S.calcularTurno());
        
    }
}
