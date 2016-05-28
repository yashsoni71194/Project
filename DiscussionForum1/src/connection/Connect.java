package connection;
import java.sql.*;
public class Connect {

       
    static Connection con; 
        public static Connection getConnection() {
            try {
        	         
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3307/forum1", "root", "root");
                
            } catch (Exception e) {
                System.out.println(e);
            }
            return con;
        }
    }

