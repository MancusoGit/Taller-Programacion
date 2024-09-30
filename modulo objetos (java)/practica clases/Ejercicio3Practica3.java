package tema3;

public class Ejercicio3Practica3 {

    public static void main(String[] args) {
        
        Estante primerEstante = new Estante();
        Autor autorLibro1 = new Autor("Jeremy","X","Mapuche");
        Libro libro1 = new Libro("Mujercitas","FF.ES",1999,autorLibro1,"534534",19999);
        Autor autorLibro2 = new Autor("Peter","X","Bulgaro");
        Libro libro2 = new Libro("Harry Potter","GG.EZ",2001,autorLibro2,"865889",13555);
        
        primerEstante.agregarLibro(libro2);
        
        primerEstante.agregarLibro(libro1);
        
        System.out.println(primerEstante.getDimlEstante());
        
        Libro libroBuscar = primerEstante.devolverLibro("Mujercitas");
        
        if (libroBuscar != null) {
            System.out.println(libroBuscar.toString());
        }
        else {
            System.out.println("No se encontro el libro");
        }
        
    
    }
    
    
}
