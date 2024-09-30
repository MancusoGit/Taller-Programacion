
package tema3;

public class Ejercicio2Practica3 {

    public static void main(String[] args) {
        
        Triangulo triangulo1 = new Triangulo(10,7,8,"azul","rojo");
        
        System.out.println("el lado 1 mide " + triangulo1.getLado1());
        System.out.println("");
        
        System.out.println("el area del triangulo es : ");
        System.out.println(triangulo1.calcularArea());
        System.out.println("");
        
        System.out.println("el perimetro del triangulo es : ");
        System.out.println(triangulo1.calcularPerimetro());
        System.out.println("");
        
    }
    
}
