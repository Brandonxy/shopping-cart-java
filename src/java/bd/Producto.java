package bd;

import java.sql.SQLException;
import java.sql.Statement;

public class Producto extends Conexion {

    private static String table = "productos";
        
    private int id;
    private String foto;
    private String nombre;
    private String descripcion;
    private int precio;
    private int stock;
    
    public Producto(int id, String foto, String nombre, String descripcion, int precio, int stock) {

        this.id          = id;
        this.foto        = foto;
        this.nombre      = nombre;
        this.descripcion = descripcion;
        this.precio      = precio;
        this.stock       = stock;
    }
    
    public Producto() {
        this.foto        = null;
        this.nombre      = null;
        this.descripcion = null;
        this.precio      = 0;
        this.stock       = 0;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }
    
    public static boolean updateStock(int newStock, Long productId) {
        try {
            Statement st = conn.createStatement();
            String sql = "update " + table + " set stock=" + newStock + " where id=" + productId;
            
            if(st.execute(sql)) return true;
            
            
        } catch(SQLException e) {
            System.out.println(e);
        }
        
        return false;
    }
}