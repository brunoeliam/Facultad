package tema3;
public class Estante {
    
    private Libro [] vector;
    private int dimL = 0;
    private int a;
    
    public Estante(int x){
        this.vector = new Libro[x];
        a = x;
    }
    
    public void agregarLibro (Libro L){
        this.vector[dimL]=L;   
        dimL++;
    }
    
    public String getLibroPorTitulo(String unTitulo){
       String aux = "No se encontro titulo";
       for (int i = 0; i < dimL; i++){
            if(this.vector[i].getTitulo().equals(unTitulo))
                aux = this.vector[i].toString(); 
        }
       return aux;
    }
    
    public boolean estaLleno(){
        return (dimL == a);
    }
    
    public String toString(){
        String aux = "";
        for (int i = 0; i < dimL; i++){
            aux += this.vector[i].getTitulo();
        }
        return aux;
    }

    public int getDimL() {
        return dimL;
    }
}
