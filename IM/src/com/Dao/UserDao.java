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
	//ͨ���û��˺Ż�ȡ�û�
	public abstract Users getUsersByAccountnumber(String accountnumber);
	//��Ӻ��ѣ�ʹ�ú����˺ź��Լ��˺���ӣ�
	public abstract int addFriend(String friendaccount,String ownaccount);
	//ɾ������
	public abstract int deleteFriend(String friendaccount);
	//ͨ���Լ��˺ţ���ѯ�û��˺Ż�ȡ�Ƿ����
	public abstract boolean getFriendByAccount(String friendaccount,String ownaccount);
	//ͨ���û��˺Ų�ѯ�û����к�����Ϣ
	public abstract List<Users> getAllFriends(String accountnumber);
	//ͨ�����ķ�������Ϣ״̬Ϊ0ɾ�����͵���Ϣ��ͨ���޸�����ʱ�����ߵ�״̬Ϊ0ɾ��������Ϣ
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
