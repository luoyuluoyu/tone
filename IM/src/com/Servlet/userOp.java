package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.User;
import org.json.JSONArray;
import org.json.JSONObject;

import com.Dao.UserDaoMysqlImpl;
import com.entity.Users;
import com.service.UserService;

/**
 * Servlet implementation class deleteFriend
 */
@WebServlet("/friendManage")
public class userOp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public userOp() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8"); 
		response.setContentType("text/html;charset=utf-8");
		String action = request.getParameter("act");
		String nickName = request.getParameter("userName");
		String accountnumber = request.getParameter("accountnumber");
		String ownnumber = request.getParameter("username");

		switch (action)
		{
		case "add":
			String targetUrl = null;
			PrintWriter outWriter = null;
			int rows = new UserService().addFriend(accountnumber,ownnumber );
			break;
		case "update":
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			String username = request.getParameter("username");
			
			request.getRequestDispatcher("friendList.jsp").forward(request, response);
			break;
		case "del":
			new UserService().deleteUsers(nickName);
			request.getRequestDispatcher("friendList.jsp").forward(request, response);
			break;
		case "select":
			PrintWriter out = null;
			boolean flag = false;
			String isFriend = null;
			Users user = new UserService().getUsersByAccoutnumber(accountnumber);
			if(user != null){
			flag = new UserService().getFriendByAccount(accountnumber, ownnumber);
			if(flag == true){
				isFriend = "他已经是您的好友，无法再添加！请返回主界面！";
				}else{
				isFriend = "请确认是否添加!";
			}
			out = response.getWriter();
			out.print("你查找的用户为：" + user.getNickName()+"!"+"\n"+isFriend);
	        out.flush();
	        out.close();
			}else{
				out = response.getWriter();
				out.print("您查找的用户不存在！");
		        out.flush();
		        out.close();
			}
	        break;
		case "selects":  
			int yes = new UserService().addFriend(accountnumber,ownnumber );
	       
	       List<Users> list =new UserService().getAllFriends(ownnumber);
	       JSONArray json = new JSONArray(list);
	       out = response.getWriter();
	       out.print(json.toString());
	       out.close();
	       break;
		
		}
	}
}
