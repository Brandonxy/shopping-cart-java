package bd;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ConexionBD {
    
    private static Connection connection;
    
    public ConexionBD() {
        connection = null;
    }
    
    public static Connection getConexion() {
        
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            connection = DriverManager.getConnection("jdbc:derby://localhost:1527/inacap", "inacap", "inacap");   
            return connection;
        } catch(SQLException e) {
            System.out.println("Error de conexión de base de datos");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConexionBD.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return null;
    }
}
