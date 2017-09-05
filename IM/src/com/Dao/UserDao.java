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
	//通过自己账号，查询用户账号获取是否存在
	public abstract boolean getFriendByAccount(String friendaccount,String ownaccount);
	//通过用户账号查询用户所有好友信息
	public abstract List<Users> getAllFriends(String accountnumber);
	//通过更改发送者消息状态为0删除发送的消息，通过修改聊天时接受者的状态为0删除接收消息
	public abstract int updatesendValid(String sender,String getter);
	
	public abstract int updategetValid(String sender,String getter);
	public abstract List<Detail> getAllDetail(String username, String friendAccount);	
	
	public abstract List<Users> getpaging(int num);
	
	public abstract int pagingnum();
	
	public  abstract Users getUserByusername(Users us);
		
	public abstract ArrayList<Users> getfriends(Users user) ;
	
	public abstract  List<Users> getUserByUsersName(String userName);
	
	public abstract Users getUserById(int userId);
		
	public abstract boolean updateUsers(int id,int linestatus,String num,String nickname,String number,String gender,String br);
	public abstract boolean updatePassWord(String userName,String pwd);
}
