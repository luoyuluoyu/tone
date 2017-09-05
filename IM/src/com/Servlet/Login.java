package com.Servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.Users;
import com.service.UserService;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//存储在线的客户
	public static Map<String, String> customerMap = null;
	//存储对应客服正在连接的客户数
	public static Map<String, Integer> customerService = null;
	//存储对应客服正在联系的客户
	public static Map<String,List<Users>>  customers = null;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userName = req.getParameter("userName");
		new UserService().updateUsers(userName, "0");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		UserService us = new UserService();

		String userName = request.getParameter("userName");
		String passWord = request.getParameter("passWord");
		String login = "CustomerServiceLogin.jsp";
		if (userName != null && !userName.equals("") && passWord != null && !passWord.equals("")) {

			if (us.Login(userName, passWord)) {
				new UserService().updateUsers(userName, "2");
				String[] rememberPassword = request.getParameterValues("remenberPwd");
				
					// 登录成功后获取登录的角色
					Users user = new UserService().searchUsers(userName);
					Integer role = user.getRole();
					if (role == 2) {
						List<Users> users = new ArrayList<Users>();
						customerService.put(userName, 0);
						request.setAttribute("userName", userName);
						customers.put(userName, users);
						login="servicerChat.jsp";
						request.setAttribute("user", user);
						
					} else {
						
						login="customer.jsp";
						request.setAttribute("userName", userName);
						request.setAttribute("user", user);

					}
					if (rememberPassword != null) {
						Cookie cookie1 = new Cookie("userName", userName);
						Cookie cookie2 = new Cookie("passWord", passWord);
						Cookie cookie3 = new Cookie("remenberPwd", "true");
						cookie1.setMaxAge(3600);
						cookie2.setMaxAge(3600);
						cookie3.setMaxAge(3600);

						response.addCookie(cookie1);
						response.addCookie(cookie2);
						response.addCookie(cookie3);
					} else {
						response.addCookie(new Cookie("userName", ""));
						response.addCookie(new Cookie("remenberPwd", "false"));
						response.addCookie(new Cookie("passWord", ""));

					}
				}
			 else {
				request.setAttribute("Message", "账号或密码错误！");
			}
		} else {
			System.out.println("用户名或密码必须填写！");

		}
		request.getRequestDispatcher(login).forward(request, response);
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		customerMap.clear();
		customerService.clear();
		customers.clear();
	}

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		customerMap = new HashMap<String, String>();
		customerService = new HashMap<String, Integer>();
		customers = new HashMap<String,List<Users>>();
	}


}
