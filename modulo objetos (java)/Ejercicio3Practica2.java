package tema2;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ejercicio3Practica2 {

    public static void main(String[] args) {
        
        final String NOMBRE_FIN = "ZZZ";
        final int MAX_DIAS = 5;
        final int MAX_TURNOS = 8;
        
        Persona[][] matrizDias = new Persona[MAX_DIAS][MAX_TURNOS];
        
        int [] vectorLogico = new int[MAX_DIAS];
        
        
        int dimlD = 0; //dimension logica de los dias
        int dimlT = 0; //dimension logica de los turnos
        
        String nombre = leerNombre();
        
        for (int i = 0; i < MAX_DIAS && !nombre.equals(NOMBRE_FIN); i++) {
            for (int j = 0; j < MAX_TURNOS && !nombre.equals(NOMBRE_FIN); j++) {
                int edad = GeneradorAleatorio.generarInt(100);
                int dni = GeneradorAleatorio.generarInt(10000000);
                matrizDias[i][j] = new Persona(nombre,dni,edad);
                vectorLogico[i] = j + 1;
                nombre = leerNombre();
            }
            dimlD += 1; 
        }
        
        System.out.println(dimlD);
        
        for (int i = 0; i < dimlD; i++) {
            for (int j = 0; j < vectorLogico[i]; j++) {
                System.out.println(matrizDias[i][j].toString());
                System.out.println("Tengo el casting el dia " + i + " en el turno " + j);
                System.out.println(" ");
            }
        }
        
    }
    
        public static String leerNombre(){
            System.out.print("ingrese el nombre de la persona : ");
            String aux = Lector.leerString();
            return aux;
        }
    
}
