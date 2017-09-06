package com.Servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.Users;
import com.service.UserService;

@WebServlet("/loginServlet1")
public class LoginVaild extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginVaild() {
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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		UserService us = new UserService();

		String userName = request.getParameter("userName");
		String passWord = request.getParameter("passWord");
		String login = "login.jsp";
		if(userName != null && ! userName.equals ("") && passWord != null && ! passWord.equals(""))
		{

			if(us.Login(userName, passWord))
			{	
				String onlineStatus = new UserService().searchUsers(userName).getOnlineStatus();
				if(onlineStatus.equals("1")){
					login = "friendList.jsp?userName="+userName+"";
					
					
				}else if(onlineStatus.equals("2")){
					request.setAttribute("Message", "∏√’À∫≈“—µ«¬º!");
					
				}
				new UserService().updateUsers(userName, "1");
				String[] rememberPassword =request.getParameterValues("remenberPwd") ;
				if(rememberPassword != null){
					Cookie cookie1 = new Cookie("userName",userName);
					Cookie cookie2 = new Cookie("passWord",passWord);
					Cookie cookie3 = new Cookie("remenberPwd","true");
					cookie1.setMaxAge(3600 * 24 * 3);
					cookie2.setMaxAge(3600 * 24 * 3);
					cookie3.setMaxAge(3600 * 24 * 3);

					response.addCookie(cookie1);
					response.addCookie(cookie2);
					response.addCookie(cookie3);
					
				}else{
					response.addCookie(new Cookie("userName", ""));
					response.addCookie(new Cookie("remenberPwd", "false"));
					response.addCookie(new Cookie("passWord", ""));

				}
			}else{
				request.setAttribute("Message", "’À∫≈ªÚ√‹¬Î¥ÌŒÛ£°");
			}
		}else
		{
			System.out.println("”√ªß√˚ªÚ√‹¬Î±ÿ–ÎÃÓ–¥£°");

		}
		request.getRequestDispatcher(login).forward(request, response);
	}

}
