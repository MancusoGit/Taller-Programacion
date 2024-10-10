
package ejercicio4practica5;

public class Ejercicio4Practica5 {

    public static void main(String[] args) {
        
        Director dCoroS = new Director("Tito",12324,68,9);
        CoroSemicircular coroS = new CoroSemicircular("coro semicirculizar",dCoroS,4);
        Corista coristaCoroS = new Corista("Coty",87390,21,3);
        coroS.agregarCorista(coristaCoroS);
        
        System.out.println("Coro lleno? : " + coroS.coroLleno());
        
        System.out.println("Coro Ordenado? : " + coroS.coroOrdenado());
        
        System.out.println(coroS.toString());
        
        System.out.println();
        
        
        Director dCoroH = new Director("Tito",12324,68,9);
        CoroHileras coroH = new CoroHileras("coro semicirculizar",dCoroH,3,3);
        
        Corista coristaCoroH0 = new Corista("Coty",87390,21,7);
        Corista coristaCoroH1 = new Corista("Coty",87390,21,7);
        Corista coristaCoroH2 = new Corista("Coty",87390,21,7);
        Corista coristaCoroH3 = new Corista("Coty",87390,21,8);
        Corista coristaCoroH4 = new Corista("Coty",87390,21,10);
        Corista coristaCoroH5 = new Corista("Coty",87390,21,8);
        Corista coristaCoroH6 = new Corista("Coty",87390,21,9);
        Corista coristaCoroH7 = new Corista("Coty",87390,21,9);
        Corista coristaCoroH8 = new Corista("Coty",87390,21,9);
        
        coroH.agregarCorista(coristaCoroH8);
        coroH.agregarCorista(coristaCoroH7);
        coroH.agregarCorista(coristaCoroH6);
        coroH.agregarCorista(coristaCoroH5);
        coroH.agregarCorista(coristaCoroH4);
        coroH.agregarCorista(coristaCoroH3);
        coroH.agregarCorista(coristaCoroH2);
        coroH.agregarCorista(coristaCoroH1);
        coroH.agregarCorista(coristaCoroH0);
        
        
        System.out.println("Coro lleno? : " + coroH.coroLleno());
        
        System.out.println("Coro Ordenado? : " + coroH.coroOrdenado());
        
        System.out.println(coroH.toString());
        
        System.out.println();
        
    }
    
}

