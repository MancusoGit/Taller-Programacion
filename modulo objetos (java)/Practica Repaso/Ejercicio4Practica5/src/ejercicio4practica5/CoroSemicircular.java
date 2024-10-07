/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ejercicio4practica5;

/**
 *
 * @author totom
 */
public class CoroSemicircular extends Coro {
    
    private Corista [] coristas;
    private final int CANTIDAD_CORISTAS;
    private int dimlCoristas;
    
    public CoroSemicircular(String coroNombre, Director coroDirector, int cantidadCoristas) {
        super(coroNombre, coroDirector);
        this.coristas = new Corista [cantidadCoristas];
        this.CANTIDAD_CORISTAS = cantidadCoristas;
        this.dimlCoristas = 0;
    }
    
    public void agregarCorista(Corista nuevoCorista) {
        if (dimlCoristas < CANTIDAD_CORISTAS) {
            coristas[dimlCoristas] = nuevoCorista;
            dimlCoristas++;
        }
        else {
            System.out.println("coro lleno!");
        }
    }
    
    @Override
    public boolean coroLleno() {
        return (dimlCoristas == CANTIDAD_CORISTAS);
    }
    
    @Override
    public boolean coroOrdenado() {
        int i = 1;
        boolean orden = true;
        if (this.coroLleno()) {
            while ((i < CANTIDAD_CORISTAS) && (orden)) {
                if (coristas[i-1].getTonoFundamental() > coristas[i].getTonoFundamental()) {
                    orden = false;
                }
                else {
                    i++;
                }
            }
        }
        return orden;
    }
    
    public String toString() {
        String aux = super.toString();
        for (int i = 0; i < dimlCoristas; i++) {
            aux += coristas[i].toString();
        }
        return aux;
    }
}
