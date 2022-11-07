/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phone.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author User
 */
public class DBUtils {
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Connection conn = null;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver") ;
        String sql = "jdbc:sqlserver://localhost:1433;databaseName=PhoneShoppingWeb";
        conn = DriverManager.getConnection(sql, "sa", "123456");
        return conn;
    }
}
