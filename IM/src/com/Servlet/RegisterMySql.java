package com.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.Services;
@WebServlet("/qq")
public class RegisterMySql extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
	          
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//保存注册信息
		req.setCharacterEncoding("utf-8");
		int conums=0;
		int id=0;
		String username=req.getParameter("username");
		String password2=req.getParameter("password2");
		String gender=req.getParameter("gender");
		String YYYY=req.getParameter("YYYY");
		String MM=req.getParameter("MM");
		String DD=req.getParameter("DD");
		String num=req.getParameter("num");
		String Birthday = YYYY+"."+MM+"."+DD;
		Services er= new Services();
		id = er.mysqlServices(username, password2, num, Birthday, gender);
		//提出账号
		String conum =er.CounterServlet();
		conums=Integer.parseInt(conum);
		conums++;
		req.setAttribute("conum", conums);
		//保存账号
		er.Accountnumbers(conums,id);
		//修改账号
		er.Modifyaccounts(conums);
		
		req.getRequestDispatcher("Getaccount.jsp").forward(req, resp);
	}
	
}
