
package tema3;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ejercicio4Practica3 {

    public static void main(String[] args) {
        
        System.out.print("ingrese la cantidad de habitaciones del hotel : ");
        final int TOTAL_HABITACIONES = Lector.leerInt(); 
        System.out.println();
        
        Hotel grandPrime = new Hotel(TOTAL_HABITACIONES);
        
        //cargando clientes de las habitaciones
        Persona cliente = leerCliente();
        
        while (!(cliente.getNombre().equals("ZZZ"))) {
            System.out.print("ingrese la habitacion deseada : ");
            int habitacionDeseada = Lector.leerInt();
            System.out.println();
            if (grandPrime.getHabitacion(habitacionDeseada - 1).getDisponibilidad()) {
                grandPrime.getHabitacion(habitacionDeseada - 1).setHuesped(cliente);
            }
            else {
                System.out.println("mala suerte, la habitacion esta ocupada");
                System.out.println();
            }
            cliente = leerCliente();
        }
        
        System.out.println("");
        System.out.println("Hotel antes del aumento : ");
        System.out.println("");
        System.out.println(grandPrime.toString());
        System.out.println("");
        
        grandPrime.aumentarCostoHabitaciones(1200);
        
        System.out.println("Hotel despues del aumento : ");
        System.out.println("");
        System.out.println(grandPrime.toString());
        System.out.println("");
        
    }
    
    static Persona leerCliente() {
        System.out.print("ingrese el nombre del cliente : ");
        String name = Lector.leerString();
        int dni = GeneradorAleatorio.generarInt(100000);
        int edad = GeneradorAleatorio.generarInt(100);
        return new Persona(name,dni,edad);
    }
    
}
