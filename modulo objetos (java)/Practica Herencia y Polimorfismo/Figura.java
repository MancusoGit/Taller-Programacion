
package tema4;


public abstract class Figura {
    
    private String colorRelleno;
    private String colorLinea;
   
    public Figura(String unCR, String unCL){
        setColorRelleno(unCR);
        setColorLinea(unCL);
    }
    
    public String toString(){
        String aux = " Area: " + this.calcularArea() +
                     " CR: "  + getColorRelleno() + 
                      " CL: " + getColorLinea() + 
                    " Perimetro: " + this.calcularPerimetro();             
             return aux;
       }

    
    public String getColorRelleno(){
        return colorRelleno;       
    }
    
    public void setColorRelleno(String unColor){
        colorRelleno = unColor;       
    }
    
    public String getColorLinea(){
        return colorLinea;       
    }
    
    public void setColorLinea(String unColor){
        colorLinea = unColor;       
    }
    
    public void despintarFigura() {
        this.colorLinea = "negra";
        this.colorRelleno = "blanco";
    }
    
    public abstract double calcularArea();
    
    public abstract double calcularPerimetro();
     
}
