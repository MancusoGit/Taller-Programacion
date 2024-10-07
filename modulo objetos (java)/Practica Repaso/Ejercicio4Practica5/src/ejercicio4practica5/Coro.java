/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ejercicio4practica5;

/**
 *
 * @author totom
 */
public abstract class Coro {
    
    private String nombreCoro;
    private Director directorCoro;
    
    public Coro(String coroNombre, Director coroDirector) {
        this.setNombreCoro(coroNombre);
        this.setDirectorCoro(coroDirector);
    }
    
    public String getNombreCoro() {
        return nombreCoro;
    }
    
    private void setNombreCoro(String nameCoro) {
        this.nombreCoro = nameCoro;
    }
    
    public Director getDirector() {
        return directorCoro;
    }
            
    private void setDirectorCoro(Director direct) {
        this.directorCoro = direct;
    } 
    
    public abstract void agregarCorista();
    
    public abstract boolean coroLleno();
    
    public abstract boolean coroOrdenado();
    
    @Override
    public String toString() {
        return "Coro = " + nombreCoro + "\n" + directorCoro.toString() + "\n";
    }
}
