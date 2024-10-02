
package tema4;

/**
 *
 * @author totom
 */
public abstract class Empleado {
    private String nombre;
    private double sueldoBasico;
    private int antiguedad;
    
    
    public Empleado(String nombre, double sueldo, int antiguedad) {
        this.nombre = nombre;
        this.sueldoBasico = sueldo;
        this.antiguedad = antiguedad;
    }
    
    public String getNombre() {
        return nombre;
    }
    
    public double getSueldoBasico() {
        return sueldoBasico;
    }
    
    public int getAntiguedad() {
        return antiguedad;
    }
    
    public void setNombre(String nuevoNombre) {
        this.nombre = nuevoNombre;
    }
    
    public void setSueldoBasico(double nuevoSB) {
        this.sueldoBasico = nuevoSB;
    }
    
    public void setAntiguedad(int nuevaAntiguedad) {
        this.antiguedad = nuevaAntiguedad;
    }
    
    public double calcularSueldoACobrar() {
        return (sueldoBasico + ((sueldoBasico * 0.10)*antiguedad));
    } 
    
    public abstract double calcularEfectividad();
    
}
