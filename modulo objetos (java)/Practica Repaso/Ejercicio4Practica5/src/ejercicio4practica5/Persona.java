
package ejercicio4practica5;

public abstract class Persona {
    
    private String nombre;
    private int DNI;
    private int edad;
    
    public Persona(String nombre, int dni, int edad) {
        this.setNombre(nombre);
        this.setDNI(dni);
        this.setEdad(edad);
    }
    
    public String getNombre() {
        return nombre;
    }
    
    private void setNombre(String nombre) {
        this.nombre = nombre;
    } 
    
    public int getDNI() {
        return DNI;
    }
    
    private void setDNI(int dni) {
        this.DNI = dni;
    }
    
    public int getEdad() {
        return edad;
    }
    
    private void setEdad(int edad) {
        this.edad = edad;
    }
    
}
