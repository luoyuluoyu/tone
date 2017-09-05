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

import com.entity.Detail;
import com.service.UserService;

/**
 * Servlet implementation class CustomerChat
 */
@WebServlet("/customerchat")
public class CustomerChat extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CustomerChat() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * �ͻ���Ϣ�Ĵ���
	 * 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		String act = request.getParameter("act");
		switch (act) {
		case "save":
			String servicer = request.getParameter("own");
			String customerNumber = request.getParameter("customer");
			String date = request.getParameter("date");
			String massage = request.getParameter("content");

			new UserService().saveDetail(servicer, customerNumber, date, massage);
			break;
		case "get":
			String userName = request.getParameter("servicer");
			String date1 = request.getParameter("date");
			List<Detail> details = new UserService().getMessage(userName, date1);

			// Json����
			if (details != null) {
				PrintWriter out = response.getWriter();
				JSONArray ja = new JSONArray(details);
				out.print(ja.toString());
				out.flush();
				out.close();
				break;
			}
		case "show":
			String username = request.getParameter("servicer");
			String friendAccount = request.getParameter("chatAccount");
			List<Detail> detail = new UserService().getDetail(username, friendAccount);
			// Json����
			PrintWriter out1 = response.getWriter();
			JSONArray ja1 = new JSONArray(detail);
			out1.print(ja1.toString());
			out1.flush();
			out1.close();
			break;
		case "close":
			String ownNumber = request.getParameter("userName");
			Login.customerService.remove(ownNumber);
			Login.customers.remove(ownNumber);
		default:
			String userName1 = request.getParameter("userName");
			String pwd = request.getParameter("pwd");
			 boolean a = new UserService().updatePassWord(userName1, pwd);
			String update = "";
			if(a == true){
				update = "{updateRs:"+1+"}";
			}else{
				update = "{updateRs:"+2+"}";
			}
			// Json����
						PrintWriter out2 = response.getWriter();
						JSONObject result  = new JSONObject(update);
						out2.print(result.toString());
						out2.flush();
						out2.close();
						break;
		}
	}

}
