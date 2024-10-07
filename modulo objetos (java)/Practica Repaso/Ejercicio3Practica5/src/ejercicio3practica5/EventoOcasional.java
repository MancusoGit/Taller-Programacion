
package ejercicio3practica5;

public class EventoOcasional extends Recital {
    
    private String motivo;
    private String nombreContratante;
    private int diaEvento;
    
    public EventoOcasional(String banda, int cantidadTemas, String motivo, String nombreContratante, int diaEvento) {
        super(banda,cantidadTemas);
        this.setMotivo(motivo);
        this.setNombreContratante(nombreContratante);
        this.setDiaEvento(diaEvento);
    }
    
    public String getMotivo() {
        return motivo;
    }
    
    private void setMotivo(String nuevoMotivo) {
        this.motivo = nuevoMotivo;
    }
    
    public String getNombreContratante() {
        return nombreContratante;
    }
    
    private void setNombreContratante(String nuevoNombre) {
        this.nombreContratante = nuevoNombre;
    }
    
    public int getDiaEvento() {
        return diaEvento;
    }
    
    private void setDiaEvento(int nuevoDia) {
        this.diaEvento = nuevoDia;
    }
    
    public String actuar() {
        String aux = "";
        switch(motivo) {
            case "show de beneficiencia" : {
                aux += "Recuerden colaborar con... " + nombreContratante + "\n";
            }
            case "show de TV" : {
                aux += "Saludos amigos televidentes \n";
            }
            case "show privado" : {
                aux += "Un Feliz cumpleaños para... " + nombreContratante + "\n";
            }
        }
        aux += super.actuar();
        return aux;
    }
    
    public double calcularCosto() {
        double monto = 0;
        switch(motivo) {
            case "show de beneficiencia" : {
                monto += 0;
            }
            case "show de TV" : {
                monto += 50000;
            }
            case "show privado" : {
                monto += 150000;
            }
        }
        return monto;
    }
    
}
