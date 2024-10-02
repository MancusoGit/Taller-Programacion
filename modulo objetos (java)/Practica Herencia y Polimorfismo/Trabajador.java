
package tema4;

public class Trabajador extends Persona {
    
    private String trabajo;
    
    public Trabajador(String unNombre, int unDNI, int unaEdad, String trabajo) {
        super(unNombre,unDNI,unaEdad);
        this.trabajo = trabajo;
    }
    
    public String getTrabajo() {
        return trabajo;
    }
    
    public void setTrabajo(String nuevoTrabajo) {
        this.trabajo = nuevoTrabajo;
    }
    
    @Override
    public String toString() {
        return super.toString() + " soy " + trabajo;
    }
    
}
