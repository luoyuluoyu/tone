package com.Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
/**
 * 调用查，和增的两种形式，多次使用
 * 改变预写语句，虚参就行
 * @author Administrator
 *
 */
public class StatementStart {
	
	public int adduser(String nickname, String password, String telephoneNumber, String birthday, String gender){
		ConnMysql cm = new ConnMysql();
		int num =0;
		try {
			cm.open();
			String sql="INSERT INTO users (password, nickName, telephoneNumber, gender, Birthday) VALUES ('"+password+"', '"+nickname+"', '"+telephoneNumber+"', '"+gender+"', '"+birthday+"')";
			 num =cm.executeUpdateAndincremid(sql);
			
			cm.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return num;
	}
 
	public String Counter(){
		ConnMysql cm = new ConnMysql();
		String cos ="";
		ResultSet co =null;
		try {
			cm.open();
			String sql="SELECT countercol FROM counter;";
			 co= cm.executeQuery(sql);
			if(co.next()){
			 cos =co.getString("countercol");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if( co!=null){
				try {
					co.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return cos;
		
	}
	
	public void AccountSave(int Accountnumber,int id){
			ConnMysql cm = new ConnMysql();
			try {
				cm.open();
				String sql="UPDATE users SET Accountnumber='"+Accountnumber+"' WHERE id ='"+id+"';";
				      
				cm.executeUpdate(sql);
				
				cm.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	
	public void Modifyaccount(int Accountnumbers){
		ConnMysql cm = new ConnMysql();
		try {
			cm.open();
			String sql="UPDATE counter SET Countercol = '"+Accountnumbers+"' WHERE idCounter= 1";
			cm.executeUpdate(sql);
			cm.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public boolean retrievalpassword(int num){
		ConnMysql cm = new ConnMysql();
		int cos =0;
		ResultSet co =null;
		boolean retrievals = false;
		try {
			cm.open();
			String sql="SELECT Accountnumber FROM users where Accountnumber ='"+num+"';";
			 co= cm.executeQuery(sql);
			if(co.next()){
			 cos =co.getInt("Accountnumber");
			}
			if( cos == num){
				retrievals = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			cm.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return retrievals;
		
	}
	
	public boolean Phonenumber(String num){
		ConnMysql cm = new ConnMysql();
		String cos ="";
		ResultSet co =null;
		boolean retrievals = false;
		try {
			cm.open();
			String sql="SELECT telephoneNumber FROM users where telephoneNumber ='"+num+"';";
			 co= cm.executeQuery(sql);
			if(co.next()){
			 cos =co.getString("telephoneNumber");
			}
			if( cos == num || cos.equals(num)){
				retrievals = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			cm.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return retrievals;
		
	}
//	UPDATE `qq`.`users` SET `password`='Q1' WHERE `id`='12';
	public void Modifypassword(String password,int Accountnumbers){
		ConnMysql cm = new ConnMysql();
		try {
			cm.open();
			String sql="UPDATE users SET password = '"+password+"' WHERE Accountnumber='"+Accountnumbers+"'";
			cm.executeUpdate(sql);
			cm.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
