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

import com.entity.Detail;
import com.service.UserService;

/**
 * Servlet implementation class CustomerService
 */
@WebServlet("/customerservice")
public class CustomerService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CustomerService() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * 保存消息记录和获取到最新的消息
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

			// Json返回

				PrintWriter out = response.getWriter();
				JSONArray ja = new JSONArray(details);
				out.print(ja.toString());
				out.flush();
				out.close();
				break;
			
		case "show":
			String username = request.getParameter("servicer");
			String friendAccount = request.getParameter("chatAccount");
			List<Detail> detail = new UserService().getAllDetail(username, friendAccount);
			// Json返回
			PrintWriter out1 = response.getWriter();
			JSONArray ja1 = new JSONArray(detail);
			out1.print(ja1.toString());
			out1.flush();
			out1.close();
			break;
		}

	}

}
