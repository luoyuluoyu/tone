package com.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.Dao.UserDaoMysqlImpl;
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

		String action = request.getParameter("act");
		String nickName = request.getParameter("userName");

		switch (action)
		{
		case "add":
			request.getRequestDispatcher("").forward(request, response);
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
		}
	}
}
