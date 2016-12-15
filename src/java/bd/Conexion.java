package bd;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Conexion {
    
    protected static Connection conn = ConexionBD.getConexion();
    
    private static Statement st;
    private static String query;
    
    public Conexion() {
    }
    
    public void close() {
        try {
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException ex) {
            System.out.println("No se pudo cerrar la conexión");
        }
    }
    
    public static ResultSet all(String tableName, String orderBy) { 
        
        try {
            
            st = conn.createStatement();
            
            query = "select * from " + tableName + " order by id "  + orderBy;
            
            ResultSet rs = st.executeQuery(query);
            
            return rs;
            
        } catch(SQLException e) {
            System.out.println(e);
        }
        
        return null;
    }
    
    public static ResultSet find(String tableName, Long id) {
        ResultSet rs = null;
        try {
            
            st = conn.createStatement();
            
            query = "select * from "  + tableName + " where id=" + id;
            
            rs = st.executeQuery(query);
            
            if(!rs.first()) {
                return null;
            }
            
            
        } catch(SQLException e) {
            System.out.println(e);
        }
        
        return rs;
    }
}
