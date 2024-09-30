
package tema3;

public class Circulo {
    private double radio;
    private String colorBorde;
    private String colorRelleno;
    
    public Circulo(double radio, String colorBorde, String colorRelleno) {
        this.radio = radio;
        this.colorBorde = colorBorde;
        this.colorRelleno = colorRelleno;
    }
    
    public double getRadio() {
        return radio;
    }
    
    public void setRadio(double nuevoRadio) {
        this.radio = nuevoRadio;
    }
    
    public String getColorBorde() {
        return colorBorde;
    }
    
    public void setColorBorde(String nuevoColorBorde) {
        this.colorBorde = nuevoColorBorde;
    }
    
    public String getColorRelleno() {
        return colorRelleno;
    }
    
    public void setColorRelleno(String nuevoColorRelleno) {
        this.colorRelleno = nuevoColorRelleno;
    }
    
    public double calcularPerimetro() {
        return (2*Math.PI*radio);
    }
    
    public double calcularArea() {
        return ((radio*radio)*Math.PI);
    }
    
    @Override
    
    public String toString() {
        return "Circulo de radio = " + radio + ", de color " + colorBorde + " y " + colorRelleno;
    }
}
