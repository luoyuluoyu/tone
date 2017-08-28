package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.entity.Detail;
import com.service.UserService;

/**
 * Servlet implementation class onLoadChat
 */
@WebServlet("/onLoadChat")
public class onLoadChat extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public onLoadChat() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		  request.setCharacterEncoding("utf-8"); 
		  response.setContentType("text/html;charset=utf-8");		
		  String act = request.getParameter("act");
		if(act.equals("onload")){
		String ownNumber = request.getParameter("userName");
		String friendNumber = request.getParameter("friendNumber");
		List<Detail> dt = new UserService().getDetail(ownNumber,friendNumber);
		JSONArray jsonUsers = new JSONArray(dt);
		PrintWriter out = response.getWriter();
		out.print(jsonUsers.toString());
		out.close();
		}else if(act.equals("save")){
			String ownNumber = request.getParameter("ownNumber");
			String friendNumber = request.getParameter("friendNumber");
			String date = request.getParameter("date");
			String content = request.getParameter("content");
			new UserService().saveDetail(ownNumber, friendNumber, date, content);
			
		}else if(act.equals("search")){
			String getter = request.getParameter("userName");
			String date = request.getParameter("date");
			List<Detail> dt = getNewMessage( getter, date);
			if(dt !=null){
			JSONArray jsonUsers = new JSONArray(dt);
			PrintWriter out = response.getWriter();
			out.print(jsonUsers.toString());
			out.close();
			}
		}
	}
	
	public List<Detail> getNewMessage(String getter,String date){
		List<Detail> dt = new ArrayList<Detail>();
		
		 dt = new UserService().getMessage(getter, date);
		
		
		
		return dt ;
	}
}
