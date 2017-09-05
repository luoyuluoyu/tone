package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import com.entity.Detail;
import com.entity.Users;

public class UserDaoMysqlImpl extends UserDao {

	
	@Override
	public List<Users> getpaging(int num) {
		Users user = null;
		ArrayList<Users> users = new ArrayList<Users>();
		MySqlHelper msh = new MySqlHelper();
		msh.open();
		try {
			ResultSet rs = msh.exec("select * from users LIMIT  "+num+",5");
			while(rs.next()){
				user = new Users(rs.getString(7), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6));
				users.add(user);
			}
		} catch (SQLException e) {
	
			e.printStackTrace();
		}
		msh.close();
		return users;
	}
	
	public int pagingnum() {
		int num=0;
		int num2=0;
		MySqlHelper msh = new MySqlHelper();
		msh.open();
		try {
			ResultSet rs = msh.executeQuery("select count(*) from users;");
			if(rs.next()){
				 num=rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		msh.close();
		num2 = num%5==0?num/5:num/5+1;
		return num2;
	}
	@Override
	public Users getUsersByUserName(String userName, String passWord) {
		Users user = null;
		MySqlHelper msh = new MySqlHelper();
		msh.open();
		try {
			ResultSet rs = msh.executeQuery(
					"select * from users where Accountnumber = '" + userName + "' and password = '" + passWord + "'");
			if (rs.next()) {
				user = new Users(rs.getString(7), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6));
			}
			msh.close();
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return user;
	}

	@Override
	public void addUsers(Users user) {
		MySqlHelper msh = new MySqlHelper();
		msh.open();
		try {
			msh.executeQuery(
					"insert into users(userName,passWord,nickName,telephoneNumber,birthday,gender)values(?,?,?,?,?,?)",
					user.getUserName(), user.getPassWord(), user.getNickName(), user.getTelephoneNumber(),
					user.getBirthday(), user.getGender());
			msh.close();
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}

	}

	@Override
	public void deleteUsers(String userName) {
		MySqlHelper msh = new MySqlHelper();

		msh.open();
		try {
			msh.executeUpdate("delete from users where Accountnumber = '" + userName + "'");
			msh.close();
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}

	}

	@Override
	public void updateUsers(String userName, String onlineStatus) {
		MySqlHelper msh = new MySqlHelper();
		msh.open();
		String sql = "update users set onlinestatus=? where Accountnumber=?";
		try {
			msh.executeUpdate(sql, onlineStatus, userName);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("修改失败!");
		}
	}

	@Override
	public List<Users> getAllUsers() {
		Users user = null;
		ArrayList<Users> users = new ArrayList<Users>();
		MySqlHelper msh = new MySqlHelper();
		msh.open();
		try {
			ResultSet rs = msh.executeQuery("select * from users");
			if (rs.next()) {
				user = new Users(rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6),
						rs.getString(7));
				users.add(user);
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return users;
	}

	@Override
	public Users searchUsers(String userName) {
		MySqlHelper msh = new MySqlHelper();
		Users user = null;
		msh.open();
		try {
			ResultSet rs = msh.executeQuery("select * from users where Accountnumber = ?", userName);
			while (rs.next()) {
				user = new Users(rs.getString(7), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(6),
						rs.getString(5), rs.getString(8),rs.getInt(9));
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return user;
	}

	@Override
	public ArrayList<Users> getAllUsers(Users user) {
		// TODO Auto-generated method stub
		String userName = "";
		Users us = null;
		String number = user.getUserName();
		ArrayList<Users> users = new ArrayList<Users>();
		MySqlHelper msh = new MySqlHelper();
		msh.open();
		try {
			ResultSet rs = msh.executeQuery("select friendAccount from friends where ownAccount=?", number);

			while (rs.next()) {
				userName = rs.getString(1);
				us = searchUsers(userName);
				users.add(us);
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return users;
	}

	public ArrayList<Detail> getDetail(String ownNumber, String friendNumber) {

		ArrayList<Detail> array = new ArrayList<Detail>();
		MySqlHelper msh = new MySqlHelper();
		msh.open();
		String sql = "select * from detail where (sender = ? and getter = ? and getVaild = 1) or (sender = ? and getter = ? and sendVaild = 1) order by id DESC";
		ResultSet rs = null;
		Detail dt = null;

		try {
			rs = msh.executeQuery(sql, friendNumber, ownNumber, ownNumber, friendNumber);
			while (rs.next()) {
				dt = new Detail(searchUsers(rs.getString(2)).getNickName(), searchUsers(rs.getString(3)).getNickName(),
						rs.getString(4), rs.getString(5));
				array.add(dt);
				if (array.size() == 10) {
					break;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Collections.reverse(array);
		return array;
	}
	public ArrayList<Detail> getAllDetail(String ownNumber, String friendNumber) {

		ArrayList<Detail> array = new ArrayList<Detail>();
		MySqlHelper msh = new MySqlHelper();
		msh.open();
		String sql = "select * from detail where sender =? and getter=? or sender=? and getter=? order by id DESC";
		ResultSet rs = null;
		Detail dt = null;

		try {
			rs = msh.executeQuery(sql, ownNumber, friendNumber, friendNumber, ownNumber);
			while (rs.next()) {
				dt = new Detail(searchUsers(rs.getString(2)).getNickName(), searchUsers(rs.getString(3)).getNickName(),
						rs.getString(4), rs.getString(5));
				array.add(dt);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Collections.reverse(array);
		return array;
	}
	@Override
	public void saveDetail(String ownNumber, String friendNumber, String date, String content) {
		// TODO Auto-generated method stub
		MySqlHelper msh = new MySqlHelper();
		msh.open();
		String sql = "insert into detail(sender,getter,sendTime,content) values(?,?,?,?)";
		try {
			msh.executeUpdate(sql, ownNumber, friendNumber, date, content);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("聊天记录保存失败！");
		} finally {
			if (msh != null) {
				msh.close();
			}
		}

	}

	@Override
	public ArrayList<Detail> getMessage(String ownNumber, String time) {
		// TODO Auto-generated method stub
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		ArrayList<Detail> array = new ArrayList<Detail>();
		MySqlHelper msh = new MySqlHelper();
		msh.open();
		String sql = "select * from detail where getter=?  order by sendTime DESC";
		ResultSet rs = null;
		Detail dt = null;
		try {
			rs = msh.executeQuery(sql, ownNumber);
			while (rs.next()) {
				Date date1 = df.parse(rs.getString(4));
				Date date2 = df.parse(time);
				if (date1.getTime() > date2.getTime()) {
					dt = new Detail(searchUsers(rs.getString(2)).getNickName(),
							searchUsers(rs.getString(3)).getNickName(), rs.getString(4), rs.getString(5));
					array.add(dt);
				}
			}
		} catch (SQLException | ParseException e) {
			// TODO Auto-generated catch block
			System.out.println("查询失败！");
		} finally {

			if (msh != null) {
				msh.close();
			}
		}
		return array;
	}

	@Override
	public Users getUsersByAccountnumber(String accountnumber) {
		// TODO 自动生成的方法存根
		Users user = null;
		MySqlHelper msh = new MySqlHelper();
		msh.open();
		try {
			ResultSet rs = msh.executeQuery("select * from users where Accountnumber = '" + accountnumber + "' ");
			if (rs.next()) {
				user = new Users(rs.getString(7), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6));
			}
			msh.close();
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return user;
	}

	@Override
	public int addFriend(String friendaccount, String ownaccount) {
		// TODO 自动生成的方法存根
		int rows = 0;
		MySqlHelper msh = new MySqlHelper();
		Connection conn = null;
		conn = msh.open();
		try {
			PreparedStatement statement = conn
					.prepareStatement("insert into friends (friendAccount,ownAccount) values (?,?)");
			statement.setString(1, friendaccount);
			statement.setString(2, ownaccount);
			rows = statement.executeUpdate();
			msh.close();
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return rows;
	}

	@Override
	public int deleteFriend(String friendaccount) {
		// TODO 自动生成的方法存根
		int rows = 0;
		MySqlHelper msh = new MySqlHelper();
		Connection conn = null;
		conn = msh.open();
		try {
			PreparedStatement statement = conn.prepareStatement("delete from friends where friendAccount = ?");
			statement.setString(1, friendaccount);
			rows = statement.executeUpdate();
			msh.close();
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return rows;
	}

	@Override
	public boolean getFriendByAccount(String friendaccount, String ownaccount) {
		// TODO 自动生成的方法存根
		boolean flag = false;
		MySqlHelper msh = new MySqlHelper();
		Connection conn = null;
		conn = msh.open();
		try {
			PreparedStatement statement = conn.prepareStatement("select * from friends where friendAccount = ? and ownAccount = ?");
			statement.setString(1, friendaccount);
			statement.setString(2, ownaccount);
			ResultSet rs  = statement.executeQuery();
			while(rs.next()){
				flag = true;
			}
			msh.close();
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public List<Users> getAllFriends(String accountnumber) {
		// TODO 自动生成的方法存根
		String userName = null;
		Users user = null;
		List<Users> users = new ArrayList<Users>();
		MySqlHelper msh = new MySqlHelper();
		Connection conn = null;
		conn = msh.open();
		try {
			PreparedStatement statement = conn.prepareStatement("select friendAccount from friends where ownAccount = ?");
			statement.setString(1, accountnumber);
			ResultSet rs  = statement.executeQuery();
			while(rs.next()){
				userName = rs.getString(1);
				user = searchUsers(userName);
				users.add(user);
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return users;
	}
	//修改发送状态0.用于表示将我单方发送的消息删除
	@Override
	public int updatesendValid(String sender,String getter) {
		// TODO 自动生成的方法存根
		MySqlHelper msh = new MySqlHelper();
		int rows = 0; 
		msh.open();
		String sql = "update detail set sendVaild = 0 where sender = ? and getter = ?";
		try {
			rows = msh.executeUpdate(sql, sender,getter);
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			System.out.println("删除聊天记录失败！");
		}
		return rows;
	}

	@Override
	//修改接收状态为0用于删除好友发送给自己的单方信息
	public int updategetValid(String sender, String getter) {
		// TODO Auto-generated method stub
		MySqlHelper msh = new MySqlHelper();
		int rows = 0; 
		msh.open();
		String sql = "update detail set getVaild = 0 where sender = ? and getter = ?";
		try {
			rows = msh.executeUpdate(sql, getter,sender);
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			System.out.println("删除聊天记录失败！");
		}
		return rows;
	}
	
	public Users getUserByusername(Users us) {
		// TODO Auto-generated method stub 
		Users user = null;
		
		MySqlHelper mysqlHelper = new MySqlHelper();
		try {
			mysqlHelper.open();
			ResultSet rs = mysqlHelper.exec("select * from users where Accountnumber ='"+us.getUserName()+"'");
			while (rs.next())
			{
				user = new Users(rs.getString(7), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6));
			}
			mysqlHelper.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return user;
	}
	public ArrayList<Users> getfriends(Users user) {
		// TODO Auto-generated method stub
		String userName = "";
		Users us = null;
		String number = user.getUserName();
		ArrayList<Users> users = new ArrayList<Users>();
		MySqlHelper msh = new MySqlHelper();
		msh.open();
		try {
			ResultSet rs = msh.exec("select friendAccount from friends where ownAccount='"+number+"'" );

			while (rs.next()) {
				userName = rs.getString(1);
				us = searchUsers(userName);
				users.add(us);
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return users;
	}
	
	/*
	 * 后台查询方法
	 * (non-Javadoc)
	 * @see com.dao.UserDao#getUserByUsersName(java.lang.String)
	 */
		@Override
		public List<Users> getUserByUsersName(String userName) {
			Users user = null;
			MySqlHelper msh = new MySqlHelper();
			Connection conn = msh.open();
			List<Users> list = new ArrayList<Users>();
			try {
				//ResultSet rs = msh.executeQuery("select * from users where id like '%"+userName+"%' or nickName like '%"+userName+"%' or telephoneNumber like '%"+userName+"%' or gender like '%"+userName+"%' or Birthday like '%"+userName+"%' or Accountnumber like '%"+userName+"%' ");
				PreparedStatement statement = conn.prepareStatement("select * from users where id like ? or nickName like ? or telephoneNumber like ? or gender like ? or Birthday like ? or Accountnumber like ?");
				statement.setString(1, "%"+userName+"%");
				statement.setString(2, "%"+userName+"%");
				statement.setString(3, "%"+userName+"%");
				statement.setString(4, "%"+userName+"%");
				statement.setString(5, "%"+userName+"%");
				statement.setString(6, "%"+userName+"%");
				ResultSet rs = statement.executeQuery();
				//ResultSet rs = msh.executeQuery("select * from users where id like ? or nickName like ? or telephoneNumber like ? or gender like ? or Birthday like ? or Accountnumber like ?", "%"+userName+"%","%"+userName+"%","%"+userName+"%","%"+userName+"%","%"+userName+"%","%"+userName+"%");
				while(rs.next()){
					user = new Users(rs.getString(7), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
							rs.getString(6));
					list.add(user);
				}
			} catch (SQLException e) {
				// TODO �Զ����ɵ� catch ��s
				
				e.printStackTrace();
			}
			msh.close();
			return list;
		}
	
		
		public Users getUserById(int id) {
			// TODO Auto-generated method stub 
			Users user = null;
			
			MySqlHelper mysqlHelper = new MySqlHelper();
			try {
				mysqlHelper.open();
				ResultSet rs = mysqlHelper.executeQuery("select * from users where id = ?",
						Integer.valueOf(id).toString());
				while (rs.next())
				{
					user = new Users(rs.getString(7), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
							rs.getString(6));
				}
				mysqlHelper.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return user;
		}

		@Override

		public boolean updateUsers(int id,int linestatus,String num,String nickname,String number,String gender,String br) {
			
	 		MySqlHelper msh = new MySqlHelper();
	 		boolean a = false;
			msh.open();
			try {
				a = msh.executeUpdate("update users set nickName='"+nickname+"',telephoneNumber='"+number+"',gender='"+gender+"',Birthday='"+br+"',Accountnumber='"+num+"',onlineStatus='"+linestatus+"' where id='"+id+"'");		
			} catch (SQLException e) {
				// TODO �Զ����ɵ� catch ��
				e.printStackTrace();
			}
			msh.close();
			return a;
		}

}

