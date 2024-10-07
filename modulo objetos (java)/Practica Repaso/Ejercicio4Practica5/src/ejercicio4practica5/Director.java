
package ejercicio4practica5;

public class Director extends Persona {
    
    private int antiguedad;
    
    public Director(String nombre, int dni, int edad, int antiguedad) {
        super(nombre,dni,edad);
        this.setAntiguedad(antiguedad);
    }
    
    public int getAntiguedad() {
        return antiguedad;
    }
    
    private void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }

    @Override
    public String toString() {
        return "Director/a " + super.toString() + ", mi antiguedad es de : " + antiguedad;
    }
    
}
