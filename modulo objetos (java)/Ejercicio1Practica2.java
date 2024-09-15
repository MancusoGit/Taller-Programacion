package tema2;

import PaqueteLectura.Lector;

public class Ejercicio1Practica2 {

    public static void main(String[] args) {
        
        System.out.print("ingrese el nombre de la persona : ");
        String nombre = Lector.leerString();
        System.out.println(" ");
        
        System.out.print("ingrese el dni de la persona : ");
        int dni = Lector.leerInt();
        System.out.println(" ");
        
        System.out.print("ingrese la edad de la persona : ");
        int edad = Lector.leerInt();
        System.out.println(" ");
        
        Persona persona1 = new Persona(nombre,dni,edad);
        
        System.out.println("-------------------------------------------------------------");
        
        System.out.println(persona1.toString());
        
        
        persona1.setNombre("Iara");
        persona1.setDNI(46628796);
        persona1.setEdad(19);
        
        System.out.println("-------------------------------------------------------------");
        
        System.out.println(persona1.toString());
        
        System.out.println("-------------------------------------------------------------");
        
    }
    
}
