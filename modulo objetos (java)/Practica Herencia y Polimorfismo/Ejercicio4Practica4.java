
package tema4;

public class Ejercicio4Practica4 {

    public static void main(String[] args) {
        
        Registro registroCiudad = new Registro("La Plata",-38.002,-57.556,2020,4);
        
        registroCiudad.setTemperatura(12, 2020, 24.01);
        
        registroCiudad.setTemperatura(8, 2020, -3.4);
        
        System.out.println(registroCiudad.toStringAños());
        System.out.println();
        System.out.println(registroCiudad.toStringMeses());
        System.out.println();
        
    }
        
}
