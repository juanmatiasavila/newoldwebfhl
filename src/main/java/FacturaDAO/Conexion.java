
package FacturaDAO;

import java.sql.Connection;
import java.sql.DriverManager;


public class Conexion {

    Connection con;
//    String url = "jdbc:mysql://localhost/bd_institucion";
//    String user = "root";
//    String pass = "";
    String url = "jdbc:mysql://p11-eu106.activaserver.com:3306/cuentasfhl?serverTimezone=UTC";
    String user = "fhombrelibre";
    String pass = "Sk7bdr77!";
    
    public Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, user, pass);
        } catch (Exception e) {
        }
        return con;
    }
}
