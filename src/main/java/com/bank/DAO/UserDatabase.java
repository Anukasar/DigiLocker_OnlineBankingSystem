
package com.bank.DAO;

import java.util.Date;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.bank.Model.LoginUser;

import com.bank.Model.User;

public class UserDatabase {

	private static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	private static final String USER = "system";
	private static final String PASSWORD = "user123";

	public static Connection myconnection() {
		Connection con = null;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			if (con != null) {

				System.out.println("Connection establish....");
			}
		} catch (ClassNotFoundException e) {
			System.err.println("Oracle JDBC Driver not found.");
			e.printStackTrace();
		} catch (SQLException e) {
			System.err.println("Failed to connect to the database.");
			e.printStackTrace();
		}
		return con;
	}
	

}
