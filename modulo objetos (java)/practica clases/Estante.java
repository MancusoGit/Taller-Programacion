
package tema3;


public class Estante {
    
    private final int MAX_ALMACENAJE = 20;
    private Libro [] almacenaje;
    private int dimlEstante;
    
    public Estante() {
        this.almacenaje = new Libro [MAX_ALMACENAJE];
        this.dimlEstante = 0;
    }
    
    public int getDimlEstante() {
        return dimlEstante;
    }
    
    public void setDimlEstante(int newDiml) {
        this.dimlEstante = newDiml;
    }
    
    public boolean estanteLleno() {
        return (dimlEstante == (MAX_ALMACENAJE - 1));
    }
    
    public void agregarLibro(Libro libroIngreso) {
        if (!(estanteLleno())) {
            this.almacenaje[dimlEstante] = libroIngreso;
            this.dimlEstante += 1;
        }
        else {
            System.out.println("No se pueden agregar más libros al estante. (Capacidad Maxima alcanzada)");
        }
    }
    
    public Libro devolverLibro(String tituloBuscar) {
        int i = 0;
        boolean encontre = false;
        while ((i < dimlEstante) && (!encontre)) {
            if (almacenaje[i].getTitulo().equals(tituloBuscar)) {
                encontre = true;
            } 
            else {
                i++;
            }
        }
        
        if  (encontre) {
            return almacenaje[i];
        } 
        else {
            return null;
        }
        
    }
    
}
