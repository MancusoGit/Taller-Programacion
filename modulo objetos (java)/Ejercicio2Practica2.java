
package tema2;

import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;


public class Ejercicio2Practica2 {

    public static void main(String[] args) {
        
        String nombre = "null";
        int edad = 0;
        int dni = 0;
        int diml = 0;
        Persona[] vector = new Persona[15];
        
        edad = GeneradorAleatorio.generarInt(100);
        
        while ((edad != 0) && (diml < 15)) {
            nombre = leerNombre();
            dni = GeneradorAleatorio.generarInt(10000000);
            vector[diml] = new Persona(nombre,dni,edad);
            diml++;
            edad = GeneradorAleatorio.generarInt(100);
        }
        
        System.out.println(" ");
        
        for (int i = 0; i < diml; i++) {
            System.out.println(vector[i].toString());
            System.out.println(" ");
        }
        
        int cantidadMayores65 = 0;
        
        int dniMin = 9999999;
        
        Persona menorDni = null;   
        
        for (int i = 0; i < diml; i++) {
            if (vector[i].getEdad() > 65) {
                cantidadMayores65 += 1;
            }
            if (vector[i].getDNI() < dniMin) {
                dniMin = vector[i].getDNI();
                menorDni = vector[i];
            }
        }
        
        System.out.println("la cantidad de personas mayores a 65 es : " + cantidadMayores65);
        System.out.println(" ");
        System.out.println(menorDni.toString());
        System.out.println(" ");
            
    }
    
    public static String leerNombre(){
        String aux;
        System.out.print("ingrese el nombre de la persona : ");
        aux = Lector.leerString();
        return aux;
    }
    
}

