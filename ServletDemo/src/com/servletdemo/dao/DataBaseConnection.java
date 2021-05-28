package com.servletdemo.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DataBaseConnection {
	Connection con = null;
	private String url = "jdbc:mysql://127.0.0.1:3306/mydb";
	private String user = "root";
	private String password = "mysql";
	
	public Connection getConnectionNew() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		
		con = DriverManager.getConnection(url, user, password);
		
		return con;
	}

}
