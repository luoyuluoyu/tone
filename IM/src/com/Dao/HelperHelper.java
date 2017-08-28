package com.Dao;


import java.sql.Connection;
import java.sql.SQLException;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class HelperHelper {
	 Connection getConnection(String shiroC3p0) {
		 Connection result = null;
		 																																												Connection resul = null;
		try {
			resul = new ComboPooledDataSource(shiroC3p0).getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
}
