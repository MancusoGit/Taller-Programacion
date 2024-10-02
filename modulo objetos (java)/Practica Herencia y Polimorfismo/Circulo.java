
package tema4;


public class Circulo extends Figura {
    private double radio;
    
    public Circulo(String colorRelleno, String colorLinea, double radio) {
        super(colorRelleno, colorLinea);
        this.radio = radio;
    }
    
    public double getRadio() {
        return radio;
    }
    
    public void setRadio(double nuevoRadio) {
        this.radio = nuevoRadio;
    }
    
    @Override
    public double calcularPerimetro() {
        return (2*Math.PI*radio);
    }
    
    @Override
    public double calcularArea() {
        return ((radio*radio)*Math.PI);
    }
    
    @Override
    public String toString() {
        return "Circulo de radio = " + radio + super.toString();
    }
}
