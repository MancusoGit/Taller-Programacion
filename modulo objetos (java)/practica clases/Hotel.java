
package tema3;

import PaqueteLectura.GeneradorAleatorio;

public class Hotel {
    
    private final Habitacion [] habitaciones;
    private int maxHabitaciones;
    
    
    public Hotel(int n_habitaciones) {
        this.maxHabitaciones = n_habitaciones;
        this.habitaciones = new Habitacion [n_habitaciones];
        
        for (int i = 0; i < maxHabitaciones; i++) {
            this.habitaciones[i] = new Habitacion(GeneradorAleatorio.generarDouble(6000)+2000);
        }
    }
    
    public Habitacion getHabitacion(int numeroHabitacion) {
        return habitaciones[numeroHabitacion];
    }
    
    public int getMaxHabitaciones() {
        return maxHabitaciones;
    }
    
    public void setHabitacion(Habitacion nuevaHabitacion, int numeroHabitacion) {
        this.habitaciones[numeroHabitacion] = nuevaHabitacion;
    }
    
    public void setMaxHabitaciones(int nuevoMaxHabitaciones) {
        this.maxHabitaciones = nuevoMaxHabitaciones;
    }
    
    public void aumentarCostoHabitaciones(double aumento) {
        for (int i = 0; i < maxHabitaciones; i++) {
            habitaciones[i].setCosto(habitaciones[i].getCosto()+aumento);
        }
    }
    
    

    
    @Override
    public String toString() {
        for (int i = 0; i < maxHabitaciones; i++) {
            System.out.println("Habitacion " + (i + 1));
            System.out.println("Costo : " + habitaciones[i].getCosto());
            if (habitaciones[i].getDisponibilidad()) {
                System.out.println("Estado : disponible");
            }
            else {
                System.out.println("Estado : ocupado");
                System.out.println("Datos cliente -> " + habitaciones[i].getCliente().toString());
            }
            System.out.println();
        }
        return "";
    }
    
}
