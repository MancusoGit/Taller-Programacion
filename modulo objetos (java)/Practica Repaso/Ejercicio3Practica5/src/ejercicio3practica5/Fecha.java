
package ejercicio3practica5;

public class Fecha {
    
    private String ciudad;
    private int dia;
    
    public Fecha(String city, int dia) {
        this.setCiudad(city);
        this.setDia(dia);
    }
    
    public Fecha() {
        
    }
    
    public String getCiudad() {
        return ciudad;
    }
    
    public int getDia() {
        return dia;
    }
    
    private void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }
    
    private void setDia(int dia) {
        this.dia = dia;
    }
    
}
