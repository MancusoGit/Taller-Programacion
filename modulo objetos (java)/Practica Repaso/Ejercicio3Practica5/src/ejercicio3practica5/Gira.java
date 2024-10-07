
package ejercicio3practica5;

public class Gira extends Recital {
    
    private String nombreGira;
    private Fecha [] vectorFechas;
    private int MAX_FECHAS;
    private int dimlFechas;
    private int fechaActual; 
    private int proximaFecha;
 
    public Gira(String banda, int cantidadTemas, String nombreGirafa, int cantidadFechas) {
        super(banda,cantidadTemas);
        this.setNombreGira(nombreGirafa);
        this.vectorFechas = new Fecha [cantidadFechas];
        this.MAX_FECHAS = cantidadFechas;
        this.dimlFechas = 0;
        this.fechaActual = 0;
        this.proximaFecha = 1;
    }
    
    public String getNombreGira() {
        return nombreGira;
    }
    
    private void setNombreGira(String nombre) {
        this.nombreGira = nombre;
    }
    
    public void agregarFecha(Fecha nuevaFecha) {
        if (dimlFechas < MAX_FECHAS) {
            vectorFechas[dimlFechas] = nuevaFecha;
            dimlFechas++;
        }
        else {
            System.out.println("Maximo de Fechas alcanzado.");
        }
    }
    
    @Override
    public String actuar() {
        String aux = "Buenas noches... " + vectorFechas[fechaActual].getCiudad() + "\n" + super.actuar();
        if (fechaActual < MAX_FECHAS-1) {
            fechaActual++;
            proximaFecha++;
        }
        else {
            aux += "este es el ultimo recital de nuestra gira... muchas gracias!";
        }
        return aux;
    }
    
    public double calcularCosto() {
        double monto = 0;
        for (int i = 0; i < MAX_FECHAS; i++) {
            monto += 30000;
        }
        return monto;
    }
    
}
