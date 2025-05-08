package com.taskify.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class TaskifyDBconfig {
	private static final String NAME_DB = "taskifydb";
    private static final String URL = "jdbc:mysql://localhost:3306/" + NAME_DB;
    private static final String USERNAME = "root";
    private static final String PASSWORD = "";
    
	public static Connection getDbConnection() throws SQLException, ClassNotFoundException {

		 Class.forName("com.mysql.cj.jdbc.Driver");
	     
	     // Try to establish a connection to the database
	     Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
	   
	     return connection;
	}
	
}
