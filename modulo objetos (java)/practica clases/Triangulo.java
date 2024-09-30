package tema3;


public class Triangulo {
    
    private double lado1;
    private double lado2;
    private double lado3;
    private String colorRelleno;
    private String colorBorde;
    
    
    public Triangulo(double lado1, double lado2, double lado3, String colorRelleno, String colorBorde) {
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
        this.colorRelleno = colorRelleno;
        this.colorBorde = colorBorde;
    }
    
    public double getLado1() {
        return lado1;
    }
    
    public void setLado1(double newLado) {
       this.lado1 = newLado; 
    }
    
    public double getLado2() {
        return lado2;
    }
    
    public void setLado2(double newLado) {
       this.lado2 = newLado; 
    }
    
    public double getLado3() {
        return lado3;
    }
    
    public void setLado3(double newLado) {
       this.lado3 = newLado; 
    }
    
    public String getColorRelleno(){
        return colorRelleno;
    }
    
    public void setColorRelleno(String newColor) {
        this.colorRelleno = newColor;
    }
    
    public String getColorBorde(){
        return colorBorde;
    }
    
    public void setColorBorde(String newColor) {
        this.colorBorde = newColor;
    }
    
    public double calcularPerimetro() {
        return lado1 + lado2 + lado3;
    }
    
    
    //para que esta funcion funcione se tiene que cumplir :
    //(lado1 + lado2 > lado3) && (lado1 + lado3 > lado2) && (lado2 + lado3 > lado1)
   
    public double calcularArea() {
        double aux = (lado1 + lado2 + lado3) / 2;
        return Math.sqrt((aux * (aux - lado1) * (aux - lado2) * (aux - lado3)));
    }
    
}
