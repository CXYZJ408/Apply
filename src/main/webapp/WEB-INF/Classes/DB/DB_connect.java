package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Created with IntelliJ IDEA.
 *
 * @author wanyu
 * @Date: 2018-03-11
 * @Time: 21:43
 * To change this template use File | Settings | File Templates.
 * @desc 数据库连接
 */
public class DB_connect {

    private static final String URL = "jdbc:mysql://localhost/club";
    private static final String ROOT = "root";
    private static final String PASSWORD = "15250823423wyX,";
    private static Connection connection;

    public static Connection getConnection() {
        return connection;
    }

    static {
        //连接数据库
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(URL, ROOT, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

    }
}
