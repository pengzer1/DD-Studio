package com.ddstudio;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {

	private static Connection conn;

	public static Connection open() {

		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "jsp";
		String pw = "java1234";
		
//		String url = "jdbc:oracle:thin:@43.200.182.211:1521:xe";
//		String id = "JspProject";
//		String pw = "pass";
		//String url = "jdbc:oracle:thin:@localhost:1521:xe";
		//String id = "test";
		//String pw = "java1234";

		try {

			Class.forName("oracle.jdbc.driver.OracleDriver");

			if (conn == null) {
				conn = DriverManager.getConnection(url, id, pw);
				//System.out.println(conn.isClosed());
			} else if (conn.isClosed()) {
				conn = DriverManager.getConnection(url, id, pw);
			}

			return conn;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

}
