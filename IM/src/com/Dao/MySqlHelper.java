package com.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MySqlHelper {
	private final String CONN = "jdbc:mysql://localhost/qq?useUnicode=true&characterSet=utf-8&useSSL=false";
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	public MySqlHelper(){
		conn = null;
		ps = null;
		rs = null;
	}
	
	public Connection  open(){
		try {
			conn = DriverManager.getConnection(CONN,"root","123456");
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			System.out.println("创建数据库失败！");
		}
		return conn;
	}
	public void close(){
		try {
			if(rs != null){
				rs.close();
			}
			if(ps != null){
				ps.close();
			}
			if(conn != null){
				conn.close();		
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			System.out.println("数据库释放资源失败！");
		}
		
	}
	public ResultSet executeQuery(String sql,String...params) throws SQLException{
		try {
			ps = conn.prepareStatement(sql);
			
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			System.out.println("创建数据语句有误！");
		}
		int parameterIndex=1;
		for(String param : params){
			ps.setString(parameterIndex, param);
			parameterIndex++;
			
		}
		rs = ps.executeQuery();
		return rs;
	}
	public int executeUpdate(String sql, String... params) throws SQLException
	{
		int result = 0;
		ps = conn.prepareStatement(sql);
		int paramIndex = 1;
		for (String param : params)
		{
			ps.setString(paramIndex, param);
			paramIndex++;
		}
		
		result = ps.executeUpdate();
		ps.close();
		
		return result;
	}
}
