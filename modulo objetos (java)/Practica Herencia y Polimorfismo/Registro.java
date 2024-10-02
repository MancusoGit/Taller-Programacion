
package tema4;

public class Registro extends Estacion {
    
    private final int MESES = 12;
    private String [] vectorMeses = new String[MESES];
    private int añoInicio;
    private int cantidadAnios;
    private double [][] temperaturas;
    
    public Registro(String nombre, double latitud, double longitud, int añoInicio, int cantidadAños) {
        super(nombre,latitud,longitud);
        this.añoInicio = añoInicio;
        this.cantidadAnios = cantidadAños;
        this.temperaturas = new double[MESES][cantidadAños];
        
        for (int i = 0; i < MESES; i++) {
            for (int j = 0; j < cantidadAños; j++) {
                temperaturas[i][j] = 99999999;
            }
        }
        
        //inicializando meses
        vectorMeses[0] = "Enero";
        vectorMeses[1] = "Febrero";
        vectorMeses[2] = "Marzo";
        vectorMeses[3] = "Abril";
        vectorMeses[4] = "Mayo";
        vectorMeses[5] = "Junio";
        vectorMeses[6] = "Julio";
        vectorMeses[7] = "Agosto";
        vectorMeses[8] = "Septiembre";
        vectorMeses[9] = "Octubre";
        vectorMeses[10] = "Noviembre";
        vectorMeses[11] = "Diciembre";
    }
    
    public int getAñoInicio() {
        return añoInicio;
    }
    
    public int getCantidadAños() {
        return cantidadAnios;
    }
    
    public double getTemperatura(int mes, int año) {
        return temperaturas[mes - 1][año - añoInicio];
    }
    
    public void setAñoInicio(int nuevoInicio) {
        this.añoInicio = nuevoInicio;
    }
    
    public void setCantidadAños(int nuevaCantidadAños) {
        this.cantidadAnios = nuevaCantidadAños;
    }
    
    public void setTemperatura(int mes, int año, double nuevaTemperatura) {
        this.temperaturas[mes - 1][año - añoInicio] = nuevaTemperatura;
    }
    
    public String getMayorTemperatura() {
        int mesMayorTemperatura = -1;
        int añoMayorTemperatura = -1;
        double mayorTemperatura = -99999;
        for (int i = 0; i < MESES; i++) {
            for (int j = 0; j < cantidadAnios; j++) {
                if ((!(temperaturas[i][j] == 99999999)) && (temperaturas[i][j] > mayorTemperatura)) {
                    mesMayorTemperatura = i;
                    añoMayorTemperatura = j;
                    mayorTemperatura = temperaturas[i][j];
                }
            }
        }
        return "La temperatura mas alta registrada fue : " + mayorTemperatura + ", en el mes : " + mesMayorTemperatura + ", en el año : " + añoMayorTemperatura;
    }
    
    public String toStringMeses() {
        String aux = super.toString();
        for (int i = 0; i < MESES; i++) {
            double promedio = 0;
            for (int j = 0; j < cantidadAnios; j++) {
                if ((!(temperaturas[i][j] == 99999999))) {
                    promedio += temperaturas[i][j];
                }
            }
            aux += "-" + vectorMeses[i] + " : " + (promedio/cantidadAnios) + "°C \n";
        }
        return aux;
    }
    
    public String toStringAños() {
        String aux = super.toString();
        for (int i = 0; i < cantidadAnios; i++) {
            double promedio = 0;
            for (int j = 0; j < MESES; j++) {
                if ((!(temperaturas[j][i] == 99999999))) {
                    promedio += temperaturas[j][i];
                }
            }
         aux += "-Año " + (añoInicio + i) + " : " + (promedio/MESES) + "°C \n";
        }
        return aux;
    }
    
}
