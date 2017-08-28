package com.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.Services;
@WebServlet("/forget")
public class Counters extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	String num =req.getParameter("go");
	switch(num){
	case "1":
		String un =req.getParameter("username");
		req.getSession().setAttribute("us",un);
		req.getRequestDispatcher("forgetPwd2.jsp").forward(req, resp);
		break;
	case "2":
		req.getRequestDispatcher("forgetPwd3.jsp").forward(req, resp);
		break;
	case "3":
		String pw =req.getParameter("password2");
		String una =(String)req.getSession().getAttribute("us");
		int numq =Integer.parseInt(una);
		Services se = new Services();
		se.Modifypassword(pw,numq);
		req.getRequestDispatcher("forgetPwd4.jsp").forward(req, resp);
		break;
}
	}

}
