import java.util.Random;

public class NumerosRandom {

    public static void main(String[] args) {
        
        final int FILTRO = 11; //declarando constante de corte
        
        int x;
        
        Random randomize = new Random(); 
        
        //Scanner scanner = new Scanner(System.in);
        
        x = randomize.nextInt(100); //generar en el rango de 0 - 100
        
        while (x != FILTRO) {
            System.out.println("el numero generado es: " + x);
            x = randomize.nextInt(100);
        }
        
    }
}
