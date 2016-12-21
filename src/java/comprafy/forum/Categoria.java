package comprafy.forum;

import bd.Conexion;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class Categoria extends Conexion {
    
    private static final String table = "categorias";
    
    private Long id;
    private String alias;
    private String nombre;

    public Categoria(Long id, String alias, String nombre) {
        this.id = id;
        this.alias = alias;
        this.nombre = nombre;
    }
    
    public Categoria() {
        this.id = null;
        this.alias = null;
        this.nombre = null;
    }
    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAlias() {
        return alias;
    }

    public void setAlias(String alias) {
        this.alias = alias;
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public static ArrayList<Categoria> all(String orderBy)
    {
        try {
            
            Statement st = conn.createStatement();
            
            String Query = "select id, nombre, alias from " + table;
            
            ResultSet rs = st.executeQuery(Query);
            
            ArrayList<Categoria> categorias = new ArrayList<>();
            
            while(rs.next()) {
                Categoria categoria = new Categoria();
                categoria.setId(rs.getLong("id"));
                categoria.setAlias(rs.getString("alias"));
                categoria.setNombre(rs.getString("nombre"));
                
                categorias.add(categoria);
            }
            
            return categorias;
            
        } catch(SQLException e) {
            e.printStackTrace();
        }
        
        return null;
    }
}
