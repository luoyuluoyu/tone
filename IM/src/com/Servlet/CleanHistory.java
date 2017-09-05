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
 * Servlet implementation class CleanHistory
 */
@WebServlet("/CleanHistory")
public class CleanHistory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CleanHistory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String sender = request.getParameter("sender");
		String getter = request.getParameter("getter");
		int sendRows = new UserService().updatesendValid(sender, getter);
		int getRows = new UserService().updategetValid(sender, getter);
		if(sendRows >= 1 && getRows >= 1){
			List<Detail> history = new UserService().getDetail(sender,getter);
			JSONArray jsonUsers = new JSONArray(history);
			PrintWriter out = response.getWriter();
			out.print(jsonUsers.toString());
			out.close();
		}
	}

}
