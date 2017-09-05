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

import com.entity.Users;
import com.service.UserService;

/**
 * Servlet implementation class FindNewCustomer
 */
@WebServlet("/FindNewCustomer")
public class FindNewCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static int count = 0;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindNewCustomer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 *查询是否有新分配上来的客户
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		String serviceNumber = request.getParameter("servicer");
		
		String[] allUsers = request.getParameterValues("allusers");
		List<Users> customers = Login.customers.get(serviceNumber);
		List<Users> newCustomer = null;
		List<String> userAllName = null;
		List<String> oldUser = null;
		int customerNumber = 0;
		Users newUser = null;
	
		if(customers.size() == 1){
			if(count ==1){
				customerNumber = allUsers.length;
			}
			count = 1;
			
		}else if(customers.size() > 1){
			customerNumber = allUsers.length;
		}
		
		// 查找是否有新的客户连接上来
		
		if (customers.size() > customerNumber) {
			userAllName = new ArrayList<String>();
			oldUser = new ArrayList<String>();
			newCustomer = new ArrayList<Users>();

			for(Users uer :customers){
				String a = uer.getUserName();
				userAllName.add(a);
			}
			
			for(String user :allUsers){
				oldUser.add(user);
			}
	
			for(String allName :userAllName){
				if(!oldUser.contains(allName)){
					newUser = new UserService().searchUsers(allName);
					newCustomer.add(newUser);
				}
			}
		}
	
			// Json返回
			PrintWriter out = response.getWriter();
			JSONArray jos = new JSONArray(newCustomer);
			out.print(jos.toString());
			out.flush();
			out.close();
			newCustomer = null;
	
	}

}
