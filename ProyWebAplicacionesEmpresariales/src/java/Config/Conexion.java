
package Config;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;


public class Conexion {
    Connection con;
    public Conexion(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pedido","root","robin.NET2010");
            
            
        } catch (Exception e) {
            System.out.println("Error: " +e);
        }
    }
    public Connection getConnection(){
        return con;
    }
    
}
