package in.mindcraft.utils;

import java.sql.*;

public class DBUtils {
	private static Connection cn;
	
	public static Connection openConnect() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		String url = "jdbc:mysql://localhost/online_db";
		return cn = DriverManager.getConnection(url,"root","root");
		
	}
	
	public static void closeConnect() throws SQLException {
		if(cn != null) {			
			cn.close();
		}
		
	}
}
