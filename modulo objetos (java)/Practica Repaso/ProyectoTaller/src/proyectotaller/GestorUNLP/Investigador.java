
package proyectotaller.GestorUNLP;

public class Investigador {
    
    private String nombre;
    private int categoria;
    private String especialidad;
    private Subsidio [] subsidios;
    private final int MAX_SUBSIDIOS = 5;
    private int dimlSubsidios;
    
    public Investigador(String unNombre, int unaCategoria, String unaEspecialidad) {
        this.nombre = unNombre;
        this.categoria = unaCategoria;
        this.especialidad = unaEspecialidad;
        this.subsidios = new Subsidio [MAX_SUBSIDIOS];
        this.dimlSubsidios = 0;
    }
    
    public Investigador() {
        
    }
    
    public String getNombre() {
        return nombre;
    }
    
    public int getCategoria() {
        return categoria;
    }
    
    public String getEspecialidad() {
        return especialidad;
    }
    
    public Subsidio getSubsidio(int numeroSubsidio) {
        return subsidios[numeroSubsidio];
    }
    
    public int getCantidadSubsidios() {
        return dimlSubsidios;
    }
    
    public void setNombre(String nuevoNombre) {
        this.nombre = nuevoNombre;
    }
    
    public void setCategoria(int nuevaCategoria) {
        this.categoria = nuevaCategoria;
    }
    
    public void setEspecialidad(String nuevaEspecialidad) {
        this.especialidad = nuevaEspecialidad;
    }
    
    public void agregarSubsidio(Subsidio unSubsidio) {
        if (dimlSubsidios < MAX_SUBSIDIOS) {
            this.subsidios[dimlSubsidios] = unSubsidio;
            dimlSubsidios++;
        }
        else {
            System.out.println("El investigador no puede solicitar mas subsidios. (Maximo alcanzado)");
        }
    }
    
    public String toString() {
        double aux = 0;
        for (int i = 0; i < dimlSubsidios; i++) {
            aux += subsidios[i].getMonto();
        }
        return "Investigador " + nombre + ", categoria " + categoria + ", especilidad " + especialidad + ", monto total en subsidios = $" + aux; 
    }
    
}
