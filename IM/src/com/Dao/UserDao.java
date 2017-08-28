package com.Dao;

import java.util.ArrayList;
import java.util.List;

import com.entity.Detail;
import com.entity.Users;

public abstract class UserDao {
	
	public static UserDao newInstance(){
		return new UserDaoMysqlImpl();
	}
	
	public abstract Users getUsersByUserName(String userName,String passWord);
	
	public abstract void addUsers(Users user);
	
	public abstract void deleteUsers(String userName);
	
	public abstract void updateUsers(String userName,String onlineStatus);
	
	public abstract List<Users> getAllUsers();
	
	public abstract Users searchUsers(String userName);

	public abstract List<Users> getAllUsers(Users user);
	public abstract ArrayList<Detail> getDetail(String ownNumber,String friendNumber);
	public abstract void saveDetail(String ownNumber,String friendNumber,String date,String content);
	public abstract ArrayList<Detail> getMessage(String ownNumber,String time);
	//通过用户账号获取用户
		public abstract Users getUsersByAccountnumber(String accountnumber);
		//添加好友（使用好友账号和自己账号添加）
		public abstract int addFriend(String friendaccount,String ownaccount);
		//删除好友
		public abstract int deleteFriend(String friendaccount);
}
