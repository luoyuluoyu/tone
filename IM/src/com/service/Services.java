package com.service;

import com.Dao.StatementStart;

public class Services {
	StatementStart st = new StatementStart();
	
	public int mysqlServices(String nickname, String password, String telephoneNumber, String birthday, String gender) {
		int num =st.adduser(nickname, password, telephoneNumber, birthday, gender);
		return num;
	}
	
	public String CounterServlet(){
		String co =st.Counter();
		return co;
	}
	
	public void Accountnumbers(int Accountnumber,int id){
		st.AccountSave(Accountnumber,id);
	}
	
	public void Modifyaccounts(int Accountnumbers){
		st.Modifyaccount(Accountnumbers);
	}
	
	public boolean Retrievalpassword(int num){
		boolean as =st.retrievalpassword(num);
		return as;
	}
	
	public boolean PhoneNumber(String num){
		boolean as =st.Phonenumber(num);
		return as;
	}
	
	public void Modifypassword(String pw,int num){
		st.Modifypassword(pw,num);
		
	}
	
}
