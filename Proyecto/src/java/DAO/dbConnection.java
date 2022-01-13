
package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class dbConnection {
    
    String bd = "musica";
    String parametros = "?zeroDateTimeBehavior=convertToNull";
    String user = "root";
    String password = "";
    String url = "jdbc:mysql://localhost:3306/" + bd + parametros;
    Connection conn = null;

    public dbConnection() {
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            
            conn = DriverManager.getConnection(url, user, password);
            
            if (!(conn == null)) {
                
                System.out.println("Connected database " + bd + " Succesfully");
            }
            
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println(e.getMessage());
            // TODO: handle exception
        }
        
    }
    
    public Connection getConnection() {
        
        return conn;
    }
    
    public void Disconect() {
        
        try {
            if (conn != null) {
                
                conn.close();
            }
            
        } catch (SQLException e) {
            // TODO: handle exception
            System.err.println(e.getMessage());
            
        }
        
    }
}
