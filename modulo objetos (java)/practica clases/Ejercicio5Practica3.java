
package tema3;

public class Ejercicio5Practica3 {

    public static void main(String[] args) {
        
        Circulo circulito = new Circulo(3,"Rojo","Blanco");
        
        System.out.println(circulito.toString());
        System.out.println("");
        
        System.out.print("Circulo con un perimetro = ");
        System.out.println(circulito.calcularPerimetro());
        System.out.println("");
        
        System.out.print("Circulo con un area = ");
        System.out.println(circulito.calcularArea());
        System.out.println("");
        
    }
    
}
