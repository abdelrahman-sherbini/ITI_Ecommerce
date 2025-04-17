package gov.iti.Helper;

import jakarta.servlet.http.HttpServlet;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	private static Connection connection;

	public static Connection getConnection() {

		try {
			if (connection == null) {
				Class.forName("com.mysql.cj.jdbc.Driver");
				connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop", "root", "root");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return connection;
	}

}
