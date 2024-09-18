
package tema2;

import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;

public class Ejercicio5Practica2 {

    public static void main(String[] args) {
        
        final int MAX_PARTIDOS = 20;
        
        Partido [] vectorPartidos = new Partido[MAX_PARTIDOS];
        
        String visitante = cargarEquipo();
        
        int diml = 0;
        
        while ((diml < MAX_PARTIDOS - 1) && !(visitante.equals("ZZZ"))) {
            String local = cargarEquipo();
            int golesLocal = GeneradorAleatorio.generarInt(10);
            int golesVisitante = GeneradorAleatorio.generarInt(10);
            vectorPartidos[diml] = new Partido(local,visitante,golesLocal,golesVisitante);
            visitante = cargarEquipo();
            diml++;
        }
        
        System.out.println();
        
        int cantidadGolesBocaLocal = 0;
        int cantidadPartidosGanoRiver = 0;
        
        for (int i = 0; i < diml; i++) {
            System.out.println("Partido " + i);
            System.out.println(vectorPartidos[i].getLocal() + " ["+vectorPartidos[i].getGolesLocal()+"] VS " + vectorPartidos[i].getVisitante() + " ["+vectorPartidos[i].getGolesVisitante()+"]");
            System.out.println(" ");
            System.out.println("---------------------------------------------------------------------------------------------------");
            
            if (vectorPartidos[i].getLocal().equals("Boca")) {
                cantidadGolesBocaLocal += vectorPartidos[i].getGolesLocal();
            }
            
            if ((vectorPartidos[i].getLocal().equals("River")) || (vectorPartidos[i].getVisitante().equals("River"))) {
                if ((vectorPartidos[i].getLocal().equals("River")) && (vectorPartidos[i].getGolesLocal() > vectorPartidos[i].getGolesVisitante())) {
                    cantidadPartidosGanoRiver += 1;
                }
                else if ((vectorPartidos[i].getVisitante().equals("River")) && (vectorPartidos[i].getGolesLocal() < vectorPartidos[i].getGolesVisitante())) {
                    cantidadPartidosGanoRiver += 1;
                }
            }
        }
    
        System.out.println();
        System.out.println("cantidad total de goles de boca de local : " + cantidadGolesBocaLocal);
        System.out.println();
        System.out.println("cantidad total de partidos ganados de river : " + cantidadPartidosGanoRiver);
        System.out.println();
        System.out.println("Program by MancuSoftware.(C)");
        System.out.println();
    }
    
    static String cargarEquipo() {
        System.out.print("ingrese el nombre del equipo : ");
        String aux = Lector.leerString();
        return aux;
    }
    
}
