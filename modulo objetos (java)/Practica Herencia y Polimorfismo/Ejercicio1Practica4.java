
package tema4;

public class Ejercicio1Practica4 {

    public static void main(String[] args) {
        
        Triangulo triangulo1 = new Triangulo(6,4,3,"azul","amarillo");
        
        Circulo circulo1 = new Circulo("rojo","blanca",3);
        
        System.out.println(triangulo1.toString());
        System.out.println();
        System.out.println(circulo1.toString());
        System.out.println();
        
        triangulo1.despintarFigura();
        
        circulo1.despintarFigura();
        
        System.out.println(triangulo1.toString());
        System.out.println();
        System.out.println(circulo1.toString());
        System.out.println();
        
    }
    
}
