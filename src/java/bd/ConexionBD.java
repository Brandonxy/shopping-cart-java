package bd;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionBD {
    
    private static Connection connection;
    
    public ConexionBD() {
        connection = null;
    }
    
    public static Connection getConexion() {
        
        try {
            connection = DriverManager.getConnection("jdbc:derby://localhost:1527/inacap", "inacap", "inacap");           
        } catch(SQLException e) {
            System.out.println("Error de conexión de base de datos");
        }
        
        return null;
    }
}
