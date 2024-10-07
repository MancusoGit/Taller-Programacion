
package ejercicio3practica5;


public class Ejercicio3Practica5 {

    
    public static void main(String[] args) {
        
        // demo gira
        Gira gira1 = new Gira("Deep Purple",3,"Machine Head",2);
        Fecha fecha1 = new Fecha("Buenos Aires",20);
        Fecha fecha2 = new Fecha("Rio de Janeiro",7);
        Fecha fecha3 = new Fecha("Santiago",19);
        gira1.agregarTema("Smoke on the Water");
        gira1.agregarTema("Space Truckin");
        gira1.agregarTema("Highway Star");
        gira1.agregarTema("Lazy");
        gira1.agregarFecha(fecha1);
        gira1.agregarFecha(fecha2);
        gira1.agregarFecha(fecha3);
        
        System.out.println(gira1.actuar());
        System.out.println();
        System.out.println(gira1.actuar());
        System.out.println();
        System.out.println("Costo de la gira = $" + gira1.calcularCosto());
        System.out.println();
        
        System.out.println("----------------------------------------------------------------------");
        // demo evento ocasional
        
        EventoOcasional evento1 = new EventoOcasional("The Police",3,"show privado","Marcelo",24);
        
        evento1.agregarTema("Message in a Bottle");
        evento1.agregarTema("Bed to big without you");
        evento1.agregarTema("Roxanne");
        
        System.out.println(evento1.actuar());
        System.out.println("Costo del evento = $" + evento1.calcularCosto());
        System.out.println();
        
    }
    
}
