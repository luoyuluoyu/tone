package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.service.Services;
@WebServlet("/retrieval")
public class Retrieval extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String branch =req.getParameter("sal");
		int num =Integer.parseInt(branch);
		switch(num){
		case 1:
			String numjsp =req.getParameter("num");
			String a ="";
			int num1 =Integer.parseInt(numjsp);
			boolean Retrievalpassword = false;
			Services se = new Services();
			Retrievalpassword =se.Retrievalpassword(num1);
			if(Retrievalpassword == true){
				a="{'name':1}";
			}else{
				a="{'name':2}";
			}
			PrintWriter out=resp.getWriter();
			JSONObject jo = new JSONObject(a);
			System.out.println(jo);
//			out.print("{jo:"+Retrievalpassword+"}");
			out.print(jo.toString());
	        out.flush();
	        out.close();
	        break;
	    case 2:
	    	String number =req.getParameter("num");
			String b ="";
			boolean Retrieval = false;
			Services re = new Services();
			Retrievalpassword =re.PhoneNumber(number);
			if(Retrievalpassword == true){
				b="{'name':1}";
			}else{
				b="{'name':2}";
			}
			PrintWriter outs=resp.getWriter();
			JSONObject jos = new JSONObject(b);
			//System.out.println(jos);
//			out.print("{jo:"+Retrievalpassword+"}");
			outs.print(jos.toString());
	        outs.flush();
	        outs.close();
		}
	
		
	}


	
}
