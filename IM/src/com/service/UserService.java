package com.service;

import java.util.ArrayList;
import java.util.List;

import com.Dao.UserDao;
import com.entity.Detail;
import com.entity.Users;

public class UserService {
	
public boolean Login(String userName,String passWord){
		UserDao userDao = UserDao.newInstance();
		return userDao.getUsersByUserName(userName,passWord)!= null;
}
	public  void addUsers(Users user){
		UserDao userDao = UserDao.newInstance();
		userDao.addUsers(user);
	}
	public  void deleteUsers(String userName){
		UserDao userDao = UserDao.newInstance();
		userDao.deleteUsers(userName);
	}
	public  void updateUsers(String userName,String onlineStatus){
		UserDao userDao = UserDao.newInstance();
		userDao.updateUsers(userName,onlineStatus);
	}
	public  List<Users> getAllUsers(){
		UserDao userDao = UserDao.newInstance();
		return userDao.getAllUsers();
	}
	public  Users searchUsers(String userName){
		UserDao userDao = UserDao.newInstance();
		return userDao.searchUsers(userName);		
	}
	
	public List<Users> getAllUsers(Users user){
		UserDao userDao = UserDao.newInstance();
		return userDao.getAllUsers(user);
	}
	public ArrayList<Detail> getDetail(String ownNumber,String friendNumber){
		UserDao userDao = UserDao.newInstance();
		return userDao.getDetail(ownNumber,friendNumber);
	}
	
	public void saveDetail(String ownNumber,String friendNumber,String date,String content){
		UserDao userDao = UserDao.newInstance();
		userDao.saveDetail(ownNumber,friendNumber,date,content);
	}
	
	public ArrayList<Detail> getMessage(String ownNumber,String time){
		UserDao userDao = UserDao.newInstance();
		return userDao.getMessage(ownNumber,time);
	}
	
	public Users getUsersByAccoutnumber(String accountnumber){
		UserDao userDao = UserDao.newInstance();
		return userDao.getUsersByAccountnumber(accountnumber);
	}
	
	public int addFriend(String friendaccount,String ownaccount){
		UserDao userDao = UserDao.newInstance();
		return userDao.addFriend(friendaccount, ownaccount);
	}
	
	public int deleteFriend(String friendaccount){
		UserDao userDao = UserDao.newInstance();
		return userDao.deleteFriend(friendaccount);
	}
}
