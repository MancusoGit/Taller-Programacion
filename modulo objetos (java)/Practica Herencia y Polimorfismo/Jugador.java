
package tema4;

public class Jugador extends Empleado {
    
    private double partidosJugados;
    private double golesAnotados;
    
    public Jugador(String nombre, double sueldo, int antiguedad, double partidosJugados, double golesAnotados) {
        super(nombre,sueldo,antiguedad);
        this.partidosJugados = partidosJugados;
        this.golesAnotados = golesAnotados;
    }
    
    public double getPartidosJugados() {
        return partidosJugados;
    }
    
    public double getGolesAnotados() {
        return golesAnotados;
    }
    
    public void setPartidosJugados(double nuevaCantidadPJ) {
        this.partidosJugados = nuevaCantidadPJ;
    }
    
    public void setGolesAnotados(double nuevosGoles) {
        this.golesAnotados = nuevosGoles;
    }
    
    @Override
    public double calcularEfectividad() {
        return (golesAnotados / partidosJugados); 
    }
    
    @Override
    public double calcularSueldoACobrar() {
        if (calcularEfectividad() > 0.5) {
            return super.calcularSueldoACobrar() + getSueldoBasico();
        }
        else {
            return super.calcularSueldoACobrar();
        }
    }
    
}
