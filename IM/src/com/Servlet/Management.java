package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.entity.Detail;
import com.entity.Users;
import com.service.UserService;

/**
 * Servlet implementation class Management
 */
@WebServlet("/Management")
public class Management extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static int NUM = 0;



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		String action = request.getParameter("act");
		PrintWriter out;
		switch(action){
		
		case "del":
			String userNames = request.getParameter("num");
			new UserService().deleteUsers(userNames);
			List<Users> users = new UserService().getAllUsers();
			JSONArray jsa = new JSONArray(users);
			out = response.getWriter();
			out.print(jsa.toString());
			out.close();
			break;
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException,NumberFormatException {
		String action = request.getParameter("act");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
	
		PrintWriter out =null;
		switch (action)
		{
		case "update":
			String id =request.getParameter("id");
			String sqnot = request.getParameter("sqnot");
			Integer onsqnot=Integer.parseInt(sqnot);;
			Integer onid=Integer.parseInt(id);
			String num = request.getParameter("num");
			String sLink = request.getParameter("sLink");
			String gender = request.getParameter("gender");
			String sKnot = request.getParameter("sKnot");
			String sbnot = request.getParameter("sbnot");
			boolean a =new UserService().updateUsers(onid,onsqnot,num,sLink,sKnot,gender,sbnot);
			if(a == true){
				List<Users> users = new UserService().getAllUsers();
				JSONArray jsa = new JSONArray(users);
				 out = response.getWriter();
				out.print(jsa.toString());
				out.close();
			}
			break;
		case "query":
			String Queryvalue = request.getParameter("name");
			List<Users> users = new UserService().queryusers(Queryvalue);
			JSONArray jsa = new JSONArray(users);
			 out = response.getWriter();
			out.print(jsa.toString());
			out.close();
			break;
		
		case "friend":
			String ownNumber = request.getParameter("ownNumber");
			List<Users> friend =new UserService().getfriends(new Users(ownNumber));
			JSONArray js = new JSONArray(friend);
			out = response.getWriter();
			out.print(js.toString());
			out.close();
			break;
			
		case "getChatlog":
			String ownNum = request.getParameter("ownNumber");
			String friendnum = request.getParameter("friendnum");
			ArrayList<Detail> detail =new UserService().getDetail(ownNum,friendnum);
			JSONArray js2 = new JSONArray(detail);
			 out = response.getWriter();
			out.print(js2.toString());
			out.close();
			break;
			
		case "information":
			String information = request.getParameter("ownNumber");
			Users us =new UserService().getUserByusername(new Users(information));
			JSONObject js3 = new JSONObject(us);
			 out = response.getWriter();
			out.print(js3.toString());
			out.close();
			break;
			
		case "getpaging":
			int num1 = new UserService().pagingnum();
			if(num1-1>NUM){
				++NUM;
			}
			List<Users> list =new UserService().getpaging(NUM*5);
			JSONArray js4 = new JSONArray(list);
			out = response.getWriter();
			out.print(js4.toString());
			out.close();
			break;
			
		case "getforwardpaging":
			if(NUM>0){
				--NUM;
			}
			List<Users> list2 =new UserService().getpaging(NUM*5);
			JSONArray js5 = new JSONArray(list2);
			out = response.getWriter();
			out.print(js5.toString());
			out.close();
			break;
			
		case "getforwardpagings":
			String infor = request.getParameter("paging");
			int num3=Integer.parseInt(infor);
			num3=num3-1;
			List<Users> list3 =new UserService().getpaging(num3*5);
			JSONArray js6 = new JSONArray(list3);
			out = response.getWriter();
			out.print(js6.toString());
			out.close();
			break;
		}

	}


}
