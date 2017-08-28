package com.Dao;
/**
 * 实现了链接，和增，查的基本模型
 * @author Administrator
 *
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ConnMysql {
	private final String STRING = "jdbc:mysql://localhost/qq?useSSL=false&useUnicode=true&characterEncoding=utf-8";
	private Connection conn;
	private PreparedStatement pr;
	private ResultSet re;

	public ConnMysql() {
		conn = null;
		pr = null;
		re = null;
	}

	public void open() throws SQLException{
		
		conn = DriverManager.getConnection(STRING, "root", "123456");
		
	}

	public void close() throws SQLException {
		closeResultSet();

		if (conn != null) {
			conn.close();
			conn = null;
		}
	}

	public void closeResultSet() throws SQLException {
		if (re != null) {
			if (!re.isClosed()) {
				re.close();
			}

			re = null;
		}

		if (pr != null) {
			pr.close();
			pr = null;
		}
	}

	public void executeUpdate(String sql) throws SQLException
	{
		pr = conn.prepareStatement(sql);
		pr.executeUpdate();
		pr.close();
	}
	
	public ResultSet executeQuery(String sql) throws SQLException
	{
		pr = conn.prepareStatement(sql);
		return  pr.executeQuery();
		
	}
	
	public int executeUpdateAndincremid(String sql) throws SQLException
	{
		int num =0;
		pr = conn.prepareStatement(sql , PreparedStatement.RETURN_GENERATED_KEYS);
		pr.executeUpdate();
		re = pr.getGeneratedKeys();
       
		// 输出该数据对应的自增长列的值
        if (re.next()) {
             num = re.getInt(1);
        }
     
		pr.close();
		return num;
	}
	


}
