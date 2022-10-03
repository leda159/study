package mvc.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		
		Connection conn = null;
		
		String url = "jdbc:mysql://localhost:3306/webmarketdb?serverTimezone=Asia/Seoul";
		String user = "koreashop";
		String password = "koreashop1234";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		conn = DriverManager.getConnection(url,user,password);
		
		return conn;

	}
}
