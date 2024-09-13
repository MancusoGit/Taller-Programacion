import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector; 

public class Matriz {

    public static void main(String[] args) {
        
        final int filas = 5;
        
        final int columnas = 5;
        
        int[][] matriz = new int[filas][columnas];
        
        
        //inicializando matriz
        
        for (int i = 0; i < filas; i++) {
            
            for (int j = 0; j < columnas; j++) {
                
                matriz[i][j] = GeneradorAleatorio.generarInt(30);
                
            }
        }
        
        //mostrar matriz
           
        for (int i = 0; i < filas; i++) {
            
            for (int j = 0; j < columnas; j++) {
                
                System.out.println("el numero guardado en la fila "+ i + " y en la columna "+ j + " es: " + matriz[i][j]);
                System.out.println(" ");
                
            }
            
            System.out.println("-------------------------------------------------------------------------------------");
        }
        
        
        
        //informar suma de elementos de la fila 1
        
        int fila = 1;
        int resultado = 0;
        
        for (int i = 0; i < columnas; i++) {
            resultado += matriz[fila][i];
        }
        
        System.out.println("la suma de los elementos de la fila " + fila + " es : " + resultado);
        System.out.println(" ");
        System.out.println("-------------------------------------------------------------------------------------");
        
        
        //generar vector de columnas y mostrandolo
        
        int[] vector = new int[columnas];
        
        for (int j = 0; j < columnas; j++) {
            int totalColumna = 0;
            for (int i = 0; i < filas; i++) {
                totalColumna += matriz[i][j];
            }
            vector[j] = totalColumna;
        }
        
        
        for (int i = 0; i < vector.length; i++)  {
            System.out.println("el valor guardado en la posicion " + i + " del vector es : " + vector[i]);
        }
        
        
        System.out.println("-------------------------------------------------------------------------------------");
        
        
        //informar si un elemento se encuentra en la matriz
        
        boolean esta = false;
        
       
        System.out.print("ingrese un numero para corroborar que se encuentra en la matriz : ");
        int valor = Lector.leerInt();
        
        int i, j, filaOk, columnaOk;
        
        columnaOk = 0;
        
        filaOk = 0;
        
        i = 0;
        
        j = 0;
        
        while (!esta)  {
            
            if (matriz[i][j] == valor) {
                esta = true;
                filaOk = i;
                columnaOk = j;
            }
            else if (j < columnas-1){
                j++;
            } else if (i < filas-1){
                i++;
                j = 0;
            } else {
                break;
            }
        }
        
        if (esta) {
            System.out.println("el numero " + valor + " SI se encuentra en la matriz.");
            System.out.println("esta en la posicion: fila -> " + filaOk + " y columna -> " + columnaOk);
           
        } else {
            System.out.println("el numero " + valor + " NO se encuentra en la matriz.");
        }
        
    }
    
