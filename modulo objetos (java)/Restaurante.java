import java.util.Random;

public class Mavenproject1 {

    public static void main(String[] args) {
        
        Random randomize = new Random();
        
        final int MAX_CLIENTES = 5;
        
        final int ASPECTOS = 4;
        
        int[][] valoraciones = new int[MAX_CLIENTES][ASPECTOS];
        
        double [] promiedos = new double[ASPECTOS];
        
        //cargando valores
        
        for (int i = 0; i < MAX_CLIENTES; i++){
            
            for (int j = 0; j < ASPECTOS; j++) {
                
                int x = randomize.nextInt(10);
                System.out.print("el cliente "+ i +" dio para la  "+ j +" una valoracion de : " + x);
                valoraciones[i][j] = x;
                System.out.println(" ");
                
            }
            
            System.out.println("------------------------------------------------------------------------------------------------");
           
        }
        
        for (int i = 0; i < ASPECTOS; i++) {
            double promedio = 0;
            for (int j = 0; j < MAX_CLIENTES; j++) {
                promedio += valoraciones[j][i];
            }
            promiedos[i] = promedio /= MAX_CLIENTES;
            System.out.println("el promedio de valoracion del aspecto " + i +" es de : " + promedio);
        }
        
        System.out.println("------------------------------------------------------------------------------------------------");                             
        
    }
}
