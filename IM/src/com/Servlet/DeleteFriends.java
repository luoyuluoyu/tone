package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONStringer;

import com.entity.Users;
import com.service.UserService;

/**
 * Servlet implementation class DeleteFriends
 */
@WebServlet("/DeleteFriends")
public class DeleteFriends extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteFriends() {
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
		PrintWriter out = null;
		JSONArray json=null;
		String accountnumber = request.getParameter("accountnumber");
		String nickName = request.getParameter("nickName");
		int rows = new UserService().deleteFriend(accountnumber);
		//request.getRequestDispatcher("friendList.jsp").forward(request, response);

		List<Users> list =new UserService().getAllFriends(nickName);
		json = new JSONArray(list);
		out = response.getWriter();
		out.print(json.toString());
		out.flush();
		out.close();
	}

}
