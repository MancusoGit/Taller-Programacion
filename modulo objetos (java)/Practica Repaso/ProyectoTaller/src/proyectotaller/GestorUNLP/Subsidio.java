
package proyectotaller.GestorUNLP;

public class Subsidio {
    
    private double monto;
    private String motivo;
    private boolean estado;
    
    public Subsidio(double monto, String motivo) {
        this.monto = monto;
        this.motivo = motivo;
        this.estado = false;
    }

    public Subsidio() {
        
    }
    
    public double getMonto() {
        return monto;
    }
    
    public String getMotivo() {
        return motivo;
    }
    
    public boolean getEstado() {
        return estado;
    }
    
    public void setMonto(double nuevoMonto) {
        this.monto = nuevoMonto;
    }
    
    public void setMotivo(String nuevoMotivo) {
        this.motivo = nuevoMotivo;
    }
    
    public void setEstado(boolean nuevoEstado) {
        this.estado = nuevoEstado;
    }
    
    public String toString() {
        
        String aux = "Subsidio con monto = " + monto + ", motivo : " + motivo + ", Estado : ";
        if (estado) {
            aux += " Otorgado";
        }
        else {
            aux+= " NO Otorgado";
        }
        return aux;
    }
    
}
