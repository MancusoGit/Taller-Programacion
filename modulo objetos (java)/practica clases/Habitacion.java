
package tema3;


public class Habitacion {
    
    private boolean disponible;
    private double costo;
    private Persona huesped;

    public Habitacion(double costo) {
        this.disponible = true;
        this.costo = costo;
        this.huesped = null;
    }
    
    public boolean getDisponibilidad() {
        return disponible;
    }
    
    public double getCosto() {
        return costo;
    }
    
    public Persona getCliente() {
        return huesped;
    }
    
    public void setDisponibilidad(boolean estado) {
        this.disponible = estado;
    }
    
    public void setCosto(double nuevoCosto) {
        this.costo = nuevoCosto;
    }
    
    public void setHuesped(Persona nuevoCliente) {
        this.huesped = nuevoCliente;
        this.disponible = false;
    } 
    
}
