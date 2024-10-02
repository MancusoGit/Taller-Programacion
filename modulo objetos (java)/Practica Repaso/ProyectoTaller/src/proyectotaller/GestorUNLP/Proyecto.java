
package proyectotaller.GestorUNLP;

public class Proyecto {
    
    private String nombreProyecto;
    private int codigoProyecto;
    private Investigador[] investigadores;
    private String nombreDirector;
    private final int MAX_INVESTIGADORES = 50;
    private int cantidadInvestigadores; //diml
    
    public Proyecto(String nombreProyecto, int codigoProyecto, String nombreDirector) {
        this.nombreProyecto = nombreProyecto;
        this.codigoProyecto = codigoProyecto;
        this.nombreDirector = nombreDirector;
        this.investigadores = new Investigador[MAX_INVESTIGADORES];
        this.cantidadInvestigadores = 0;
    }
    
    
    
    
    
    
}
