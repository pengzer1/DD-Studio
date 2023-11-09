package com.ddstudio;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {

	private static Connection conn; // DAO 객체 생성할떄마다

	public static Connection open() {

		String url = "jdbc:oracle:thin:@43.200.182.211:1521:xe";
		String id = "JspProject";
		String pw = "pass";

		try {

			Class.forName("oracle.jdbc.driver.OracleDriver");

			if (conn == null) {
				conn = DriverManager.getConnection(url, id, pw);
			}

			return conn;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

}
