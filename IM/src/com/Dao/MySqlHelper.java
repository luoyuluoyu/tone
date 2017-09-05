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
			// TODO �Զ����ɵ� catch ��
			System.out.println("�������ݿ�ʧ�ܣ�");
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
			// TODO �Զ����ɵ� catch ��
			System.out.println("���ݿ��ͷ���Դʧ�ܣ�");
		}
		
	}
	public ResultSet executeQuery(String sql,String...params) throws SQLException{
		try {
			ps = conn.prepareStatement(sql);
			
		} catch (SQLException e) {
			// TODO �Զ����ɵ� catch ��
			System.out.println("���������������");
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
	
	public ResultSet exec(String sql) {
		try {
			ps = conn.prepareStatement(sql);
		} catch (SQLException e) {
			System.out.println("ִ�����ݿ�ʧ�ܣ�");
		}
		try {
			rs = ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public boolean executeUpdate(String sql) throws SQLException
	{
		boolean result;
		ps = conn.prepareStatement(sql);
		ps.executeUpdate();
		result=true;
		return result;
	}
}
