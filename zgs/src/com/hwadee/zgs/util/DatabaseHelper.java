package com.hwadee.zgs.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import sun.jdbc.rowset.CachedRowSet;
public class DatabaseHelper {
    
	static {
		try {
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public static Connection getConnection() {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/zigong?useOldAliasMetadataBehavior=true&characterEncoding=utf-8","root","123456");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public static void execute(String sql) {
		Connection conn = getConnection();
		try {
			Statement stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static ResultSet query(String sql) {
		Connection conn =  getConnection();
		Statement stmt = null;
		CachedRowSet crs=null;
		try {
			crs = new CachedRowSet();
			stmt = conn.createStatement();
			ResultSet rs  = stmt.executeQuery(sql);
			crs.populate(rs);
			
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return crs;
	}
	
	public static void main(String[] args) {
		System.out.println(getConnection());
	}
	
}