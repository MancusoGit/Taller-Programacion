import java.util.Scanner;

public class AlturaJugadores {

    public static void main(String[] args) {
         
        final int MAX_JUGADORES = 5;
        
        double promedio = 0;
        
        int cantidadSobrePromedio = 0;
        
        Scanner leer = new Scanner(System.in);
        
        
        double[] alturas = new double[MAX_JUGADORES];
        
        
        System.out.println("Registro altura de jugadores");
        System.out.println("-------------------------------------------------");
        
        //leer jugadores
        
        for (int i = 0; i < alturas.length; i++) {
            
            System.out.print("ingrese una altura para el jugador " + i +" : ");
            double altura = leer.nextDouble();
            alturas[i] = altura;
            System.out.println(" ");
            
        }
        
        System.out.println("se han ingresado todos los valores."); 
        System.out.println("-------------------------------------------------");
        
        
        for (int i = 0; i < alturas.length; i++) {
            promedio += alturas[i];
        }
       
        promedio /= alturas.length;
        
        System.out.println("el promedio de altura en los jugadores es de: " + promedio);
        System.out.println(" ");
        
        for (int i = 0; i < alturas.length; i++) {
            if (promedio < alturas[i]) {
                cantidadSobrePromedio += 1;
            }
        }
        
        System.out.println("la cantidad de jugadores que estan por enciama del promedio de altura es de: " + cantidadSobrePromedio);
        
    }
}
