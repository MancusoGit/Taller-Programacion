package ejercicio4practica5;

public class CoroHileras extends Coro {
    
    private Corista [][] matrizCoristas;
    private final int cantidadCoristas; //por hilera
    private final int cantidadHileras;
    private int [] dimlCoristas;
    private int hilerasLlenas;
    
    public CoroHileras(String coroNombre, Director coroDirector, int cantidadHileras, int cantidadCoristas) {
        super(coroNombre,coroDirector);
        this.matrizCoristas = new Corista [cantidadHileras][cantidadCoristas];
        this.cantidadCoristas = cantidadCoristas;
        this.cantidadHileras = cantidadHileras;
        this.dimlCoristas = new int [cantidadHileras];
        this.hilerasLlenas = 0;
        
        for (int i = 0; i < cantidadHileras; i++) {
            dimlCoristas[i] = 0;
        }
    }
    
    public boolean coroLleno() {
        int i = 0;
        boolean lleno = true;
        while ((i < cantidadHileras) & (lleno)){
            int j = 0;
            while ((j < cantidadCoristas) & (lleno)) {
                if (matrizCoristas[i][j] == null) {
                    lleno = false;
                }
                else {
                    j++;
                }
            }
            if (lleno) {
                i++;
            }
        }
        return lleno;
    }
    
    public void agregarCorista(Corista nuevoCorista) {
        if (!(coroLleno())) {
            matrizCoristas[hilerasLlenas][dimlCoristas[hilerasLlenas]] = nuevoCorista;
            dimlCoristas[hilerasLlenas]++;
            if (dimlCoristas[hilerasLlenas] == cantidadCoristas) {
                hilerasLlenas++;
            }
        }
    }

    public boolean coroOrdenado() {
        if (coroLleno()) {
            int i = 1;
            boolean orden = true;
            while ((i < cantidadHileras) & (orden)){
                if (matrizCoristas[i-1][0].getTonoFundamental() > matrizCoristas[i][0].getTonoFundamental()) {
                    int j = 1;
                    while ((j < cantidadCoristas) & (orden)) {
                        if (matrizCoristas[i-1][j-1].getTonoFundamental() != matrizCoristas[i-1][j].getTonoFundamental()) {
                            orden = false;
                        }
                        else {
                            j++;
                        }
                    }
                }
                else {
                    orden = false;
                }
                if (orden) {
                    i++;
                }
            }
            return orden;
        }
        else {
            return false;
        }
    }
    
    @Override
    public String toString() {
        String aux = super.toString();
        for (int i = 0; i < cantidadHileras; i++) {
            for (int j = 0; j < cantidadCoristas; j++) {
                if (matrizCoristas[i][j] != null) {
                    aux += matrizCoristas[i][j].toString();
                }
            }
        }
        return aux;
    }
    
}
