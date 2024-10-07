
package ejercicio3practica5;

public abstract class Recital {
    
    private String nombreBanda;
    private String [] listaTemas;
    private int dimfListaTemas;
    private int dimlTemas;
    
    public Recital(String banda, int cantidadTemas) {
        this.setNombreBanda(banda);
        this.setCantidadTemas(cantidadTemas);
        this.listaTemas = new String [cantidadTemas];
        this.dimlTemas = 0;
    }
    
    public Recital() {
        
    }
    
    public String getNombreBanda() {
        return nombreBanda;
    }
    
    public int getCantidadTemas() {
        return dimfListaTemas;
    }
    
    private void setNombreBanda(String unaBanda) {
        this.nombreBanda = unaBanda;
    }
    
    private void setCantidadTemas(int cantidadTemas) {
        this.dimfListaTemas = cantidadTemas;
    }
    
    public void agregarTema(String tema) {
        if (dimlTemas < dimfListaTemas) {
            listaTemas[dimlTemas] = tema;
            dimlTemas++;
        }
        else {
            System.out.println("Se ha alcanzado el maximo de temas para agregar.");
        }
    }
    
    public String actuar() {
        String presentacion = "y ahora tocaremos... ";
        String aux = "";
        for (int i = 0; i < dimlTemas; i++) {
            aux += presentacion + listaTemas[i] + "\n";
        }
        return aux;
    }
    
    public abstract double calcularCosto();
    
}
