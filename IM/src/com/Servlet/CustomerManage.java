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

import com.entity.Users;
import com.service.UserService;

/**
 * Servlet implementation class WebSocketLink
 */
 @WebServlet("/distribute")
public class CustomerManage extends HttpServlet {
	 /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static int min = 0;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String userName = req.getParameter("userName");
		new UserService().updateUsers(userName, "1");//�ͻ������޸�����״̬
		String customerService = req.getParameter("customerServce");
		Login.customerMap.remove(userName);//���ͻ����еĿͻ���Ϣ�Ƴ�
		//���ͷ������������ӵĿͻ�����ȥ1
		Integer count  =new Integer( Login.customerService.get(customerService).intValue()-1);
		//���ͷ����������뵽�ͷ�����
		Login.customerService.put(customerService, count);
		List<Users> users = Login.customers.get(customerService);
		//���ͻ������������ӵĿͻ����Ƴ�
		users.remove(new UserService().searchUsers(userName));
		Login.customers.put(customerService, users);
		
		// Json����
		String result = "{"+"success:1"+"}";
		PrintWriter out = resp.getWriter();
		JSONObject ja = new JSONObject(result);
		out.print(ja.toString());
		out.flush();
		out.close();
	}


	/**
	 * ���ͻ�������������ͻ������һ���Ŀͷ�
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userName = req.getParameter("userName");
		
		int resultLength = 0;
		String ServiceNumber = "";
		resultLength =Login.customerService.keySet().size();
		if(resultLength == 1){
			min = 1;
		}else{
			min = 0;
		}
		for (String map : Login.customerService.keySet()) {
			int value = Login.customerService.get(map);
			if (value <= min) {
				min = value;
				ServiceNumber = map;
			}
		}
		// ����Ӧ���û�����ͷ�
		int b  = Login.customerService.get(ServiceNumber).intValue();
		Login.customerMap.put(userName, ServiceNumber);
		int a = Login.customerService.get(ServiceNumber).intValue()+1;
		System.out.println(a);
		Login.customerService.put(ServiceNumber,a );
		List<Users> users = Login.customers.get(ServiceNumber);
		users.add(new UserService().searchUsers(userName));
		Login.customers.put(ServiceNumber, users);
			
		//Json����
		PrintWriter out=resp.getWriter();
		Users user =new UserService().searchUsers(ServiceNumber);

		JSONObject jos = new JSONObject(user);
		out.print(jos.toString());
        out.flush();
        out.close();

	}

	
}
