
package ejercicio4practica5;

public class Corista extends Persona {
    
    private int tonoFundamental;
    
    public Corista(String nombre, int dni, int edad, int tono) {
        super(nombre,dni,edad);
        this.setTonoFundamental(tono);
    }
    
    public int getTonoFundamental() {
        return tonoFundamental;
    }
    
    private void setTonoFundamental(int tono) {
        this.tonoFundamental = tono;
    }
    
}
