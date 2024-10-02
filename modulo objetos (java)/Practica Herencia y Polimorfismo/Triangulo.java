
package tema4;

public class Triangulo extends Figura {
    
    private double lado1;
    private double lado2;
    private double lado3;
    
    
    public Triangulo(double ladoUno, double ladoDos, double ladoTres, String colorRelleno, String colorLinea) {
        super(colorRelleno, colorLinea);
        this.lado1 = ladoUno;
        this.lado2 = ladoDos;
        this.lado3 = ladoTres;    
    }
    
    public double getLado1() {
        return lado1;
    }
    
    public double getLado2() {
        return lado2;
    }
    
    public double getLado3() {
        return lado3;
    }
    
    public void setLado1(double nuevoLado) {
        this.lado1 = nuevoLado;
    }
    
    public void setLado2(double nuevoLado) {
        this.lado2 = nuevoLado;
    }
    
    public void setLado3(double nuevoLado) {
        this.lado3 = nuevoLado;
    }
    
    @Override
    public double calcularPerimetro() {
        return lado1 + lado2 + lado3;
    }
    
    //para que esta funcion funcione se tiene que cumplir :
    //(lado1 + lado2 > lado3) && (lado1 + lado3 > lado2) && (lado2 + lado3 > lado1)
   
    @Override
    public double calcularArea() {
        double aux = (lado1 + lado2 + lado3) / 2;
        return Math.sqrt((aux * (aux - lado1) * (aux - lado2) * (aux - lado3)));
    }
    
    @Override
    public String toString() {
        return "Triangulo de lado 1 = " + lado1 + ", de lado 2 = " + lado2 + ", de lado 3 = " + lado3 + super.toString();
    }
    
}
