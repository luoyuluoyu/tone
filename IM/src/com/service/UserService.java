package com.service;

import java.util.ArrayList;
import java.util.List;

import com.Dao.UserDao;
import com.entity.Detail;
import com.entity.Users;

public class UserService {

	public List<Users> getpaging(int num) {
		UserDao userDao = UserDao.newInstance();
		return userDao.getpaging(num);
	}

	public int pagingnum() {
		UserDao userDao = UserDao.newInstance();
		return userDao.pagingnum();
	}
	public List<Users> queryusers(String userName){
		UserDao userDao = UserDao.newInstance();
		return userDao.getUserByUsersName(userName);
}
	public boolean Login(String userName, String passWord) {
		UserDao userDao = UserDao.newInstance();
		return userDao.getUsersByUserName(userName, passWord) != null;
	}

	public void addUsers(Users user) {
		UserDao userDao = UserDao.newInstance();
		userDao.addUsers(user);
	}

	public void deleteUsers(String userName) {
		UserDao userDao = UserDao.newInstance();
		userDao.deleteUsers(userName);
	}

	public void updateUsers(String userName, String onlineStatus) {
		UserDao userDao = UserDao.newInstance();
		userDao.updateUsers(userName, onlineStatus);
	}
	public  boolean updateUsers(int id,int linestatus,String num,String nickname,String number,String gender,String br){
		UserDao userDao = UserDao.newInstance();
		return userDao.updateUsers( id, linestatus,num, nickname, number, gender, br);
	}
	public List<Users> getAllUsers() {
		UserDao userDao = UserDao.newInstance();
		return userDao.getAllUsers();
	}

	public Users searchUsers(String userName) {
		UserDao userDao = UserDao.newInstance();
		return userDao.searchUsers(userName);
	}

	public List<Users> getAllUsers(Users user) {
		UserDao userDao = UserDao.newInstance();
		return userDao.getAllUsers(user);
	}

	public ArrayList<Detail> getDetail(String ownNumber, String friendNumber) {
		UserDao userDao = UserDao.newInstance();
		return userDao.getDetail(ownNumber, friendNumber);
	}

	public void saveDetail(String ownNumber, String friendNumber, String date, String content) {
		UserDao userDao = UserDao.newInstance();
		userDao.saveDetail(ownNumber, friendNumber, date, content);
	}

	public ArrayList<Detail> getMessage(String ownNumber, String time) {
		UserDao userDao = UserDao.newInstance();
		return userDao.getMessage(ownNumber, time);
	}
	public List<Users> getfriends(Users user){
		UserDao userDao = UserDao.newInstance();
		return userDao.getfriends(user);
	}
	public Users getUserByusername(Users us){
		UserDao userDao = UserDao.newInstance();
		return userDao.getUserByusername(us);
	}
	public Users getUsersByAccoutnumber(String accountnumber) {
		UserDao userDao = UserDao.newInstance();
		return userDao.getUsersByAccountnumber(accountnumber);
	}

	public int addFriend(String friendaccount, String ownaccount) {
		UserDao userDao = UserDao.newInstance();
		return userDao.addFriend(friendaccount, ownaccount);
	}

	public int deleteFriend(String friendaccount) {
		UserDao userDao = UserDao.newInstance();
		return userDao.deleteFriend(friendaccount);
	}

	public boolean getFriendByAccount(String friendaccount, String ownaccount) {
		UserDao userDao = UserDao.newInstance();
		return userDao.getFriendByAccount(friendaccount, ownaccount);
	}

	public List<Users> getAllFriends(String accountnumber) {
		UserDao userDao = UserDao.newInstance();
		return userDao.getAllFriends(accountnumber);
	}

	public int updatesendValid(String sender, String getter) {
		UserDao userDao = UserDao.newInstance();
		return userDao.updatesendValid(sender, getter);
	}

	public int updategetValid(String sender, String getter) {
		UserDao userDao = UserDao.newInstance();
		return userDao.updategetValid(sender, getter);
	}

	public List<Detail> getAllDetail(String username, String friendAccount) {
		UserDao userDao = UserDao.newInstance();
		return userDao.getAllDetail(username, friendAccount);
	}
	public Users getUserById(int userId)
	{
		UserDao userDao = UserDao.newInstance();
		return userDao.getUserById(userId);
	}
	
	public boolean updatePassWord(String userName,String pwd){
		UserDao userDao = UserDao.newInstance();
		return userDao.updatePassWord(userName, pwd);
	}
}
