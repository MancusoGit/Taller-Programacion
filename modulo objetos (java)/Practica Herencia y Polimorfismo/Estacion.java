
package tema4;

public abstract class Estacion {
    
    private String nombre;
    private double latitud;
    private double longitud;
    
    public Estacion(String nombre, double latitud, double longitud) {
        this.nombre = nombre;
        this.latitud = latitud;
        this.longitud = longitud;
    }
    
    public String getNombre() {
        return nombre;
    }
    
    public double getLatitud() {
        return latitud;
    }
    
    public double getLongitud() {
        return longitud;
    }
    
    public void setNombre(String nuevoNombre) {
        this.nombre = nuevoNombre;
    }
    
    public void setLatitud(double nuevaLatitud) {
        this.latitud = nuevaLatitud;
    }
    
    public void setLongitud(double nuevaLongitud) {
        this.longitud = nuevaLongitud;
    }
    
    @Override
    public String toString(){
        return "Estacion " + nombre + " (" + latitud + " S - " + longitud + " O) \n";
    }
           
}
