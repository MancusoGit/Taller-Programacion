
package tema2;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ejercicio4Practica2 {

    public static void main(String[] args) {
        
        final String NOMBRE_FIN = "ZZZ";
        final int MAX_DIAS = 5;
        final int LIM_PARTICIPANTES = 40;
        final int MAX_TURNOS = 8;
        
        Persona[][] matrizDias = new Persona[MAX_DIAS][MAX_TURNOS];
        
        //inicializar matriz
        for (int i = 0; i < MAX_DIAS; i++){
            for (int j = 0; j < MAX_TURNOS; j++) {
                matrizDias[i][j] = null;
            }
        }
        
        //contador de participantes
        int participantes = 0;
        
        String nombre = leerNombre();
        
        while (!(nombre.equals(NOMBRE_FIN)) && (participantes < LIM_PARTICIPANTES)) {
            
            int edad = GeneradorAleatorio.generarInt(100);
            int dni = GeneradorAleatorio.generarInt(10000000);
            int dia = leerDia();
            System.out.println(" ");
            
            while (dia >= 5) {
                System.out.println("dia no valido!");
                dia = leerDia();
                System.out.println(" ");
            }
            
            //corroborando turno
            int turno = -1;
            boolean ok = false;
            
            for (int j = 0; j < MAX_TURNOS && !ok; j++) {   
                if (matrizDias[dia][j] == null) {
                    turno = j;
                    ok = true;
                    break;
                }
            }
            
            if (ok) {
                matrizDias[dia][turno] = new Persona(nombre,dni,edad);
                participantes++;
            }
            else {
                System.out.println("el dia que se solicita no tiene mas cupos.");
            }
            
            nombre = leerNombre();
            
        }
        
        System.out.println(" ");
        
        
        
        for (int i = 0; i < matrizDias.length; i++) {
            int cantDias = 0;
            for (int j = 0; j < matrizDias[i].length; j++) {
                if (matrizDias[i][j] != null) {
                    System.out.println(matrizDias[i][j].toString());
                    System.out.println("Tengo el casting el dia " + i + " en el turno " + j);
                    System.out.println(" ");
                    cantDias += 1;
                }
            }
            System.out.println("la cantidad de participantes inscriptos en el dia " + i + " es : " + cantDias);
            System.out.println("----------------------------------------------------------------------------");
            System.out.println(" ");
        }
        
        
           
    }
    
    public static String leerNombre(){
        System.out.print("ingrese el nombre de la persona : ");
        String aux = Lector.leerString();
        return aux;
    }
    
    public static int leerDia(){
        System.out.print("ingrese el dia que quiere acudir al casting : ");
        int aux = Lector.leerInt();
        return aux;
    }
}
