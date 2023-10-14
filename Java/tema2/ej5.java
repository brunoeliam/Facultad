/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

/* Se dispone de la clase Partido (en la carpeta tema2). Un objeto partido representa un
encuentro entre dos equipos (local y visitante). Un objeto partido puede crearse sin
valores iniciales o enviando en el mensaje de creación el nombre del equipo local, el
nombre del visitante, la cantidad de goles del local y del visitante (en ese orden). Un objeto
partido sabe responder a los siguientes mensajes:

    getLocal() retorna el nombre (String) del equipo local
    getVisitante() retorna el nombre (String) del equipo visitante
    getGolesLocal() retorna la cantidad de goles (int) del equipo local
    getGolesVisitante() retorna la cantidad de goles (int) del equipo visitante
    setLocal(X) modifica el nombre del equipo local al “String” X
    setVisitante(X) modifica el nombre del equipo visitante al “String” X
    setGolesLocal(X) modifica la cantidad de goles del equipo local al “int” X
    setGolesVisitante(X) modifica la cantidad de goles del equipo visitante al “int” X
    hayGanador() retorna un boolean que indica si hubo (true) o no hubo (false) ganador
    getGanador() retorna el nombre (String) del ganador del partido (si no hubo retorna
    un String vacío).
    hayEmpate() retorna un boolean que indica si hubo (true) o no hubo (false) empate

Implemente un programa que cargue un vector con a lo sumo 20 partidos disputados en
el campeonato. La información de cada partido se lee desde teclado hasta ingresar uno con
nombre de visitante “ZZZ” o alcanzar los 20 partidos. Luego de la carga:
- Para cada partido, armar e informar una representación String del estilo:
{EQUIPO-LOCAL golesLocal VS EQUIPO-VISITANTE golesVisitante}
- Calcular e informar la cantidad de partidos que ganó River.
- Calcular e informar el total de goles que realizó Boca jugando de local.
 */
import PaqueteLectura.Lector;

public class ej5 {
    public static void main(String[] args){
        int dimF = 3;
        Partido [] v = new Partido [dimF];
        
        System.out.println("local: "); String loc = Lector.leerString();
        System.out.println("visitante: "); String vis = Lector.leerString();
        System.out.println("goles local: "); int golesL = Lector.leerInt();
        System.out.println("goles visitante: "); int golesV = Lector.leerInt();
        
        int dimL = 0;
        int cantRiver = 0;
        int cantBoca = 0;
        while ((dimL < dimF) && (!vis.equals("ZZZ"))) {
            v[dimL] = new Partido(loc, vis, golesL, golesV);
            
            if (v[dimL].getGanador().equals("river"))
                cantRiver++;
            if (v[dimL].getLocal().equals("boca"))  
                cantBoca = cantBoca + v[dimL].getGolesLocal();
            
            System.out.println("local: "); loc = Lector.leerString();
            System.out.println("visitante: "); vis = Lector.leerString();
            System.out.println("goles local: "); golesL = Lector.leerInt();
            System.out.println("goles visitante: "); golesV = Lector.leerInt();
            dimL++;
        }
        
        int i;
        for (i = 0; i < dimL; i++) {
            System.out.println(v[i].toString());
        }
        System.out.println("cantidad river: "+cantRiver+" cantidad boca: "+cantBoca);
    }
}