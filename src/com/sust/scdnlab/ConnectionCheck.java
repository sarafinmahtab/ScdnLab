package com.sust.scdnlab;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionCheck {
	
	private Connection connection;
	
	private String serverUserName;
	private String serverPassword;
	
	public ConnectionCheck() {
		serverUserName = "root";
		serverPassword = "";
	}
	
	public Connection getConnection() {

		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			
			connection = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/scdn_lab",
					serverUserName, serverPassword);

		} catch(ClassNotFoundException | SQLException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}

		return connection;
	}
}
