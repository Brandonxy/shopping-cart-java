package cart;

import bd.Conexion;

public class CartItem extends Conexion {
    
    private int id;
    private String foto;
    private String nombre;
    private String descripcion;
    private int precio;
    private int cantidad;
    private int stock;
    private int subtotal;
    
    public CartItem(int id, String foto,String nombre, String descripcion, int precio, int cantidad) {

        this.id          = id;
        this.foto        = foto;
        this.nombre      = nombre;
        this.descripcion = descripcion;
        this.precio      = precio;
        this.cantidad    = cantidad;
        this.subtotal    = this.precio * this.cantidad;
    }
    
    public CartItem() {
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

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(int subtotal) {
        this.subtotal = subtotal;
    }
    
    
    
}
