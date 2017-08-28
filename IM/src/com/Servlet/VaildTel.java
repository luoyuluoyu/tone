package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.json.JSONObject;

/**
 * Servlet implementation class Vaild
 */
@WebServlet("/Vaild")
public class VaildTel extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession hs = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VaildTel() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			
			String a=request.getParameter("num");
			String b =(String) request.getSession().getAttribute("checkNumber");
			int as=0;
			if(a.equals(b)){
				as=1;
			}else{
				as=2;
			}
			String checkResult ="{statusCod:"+as+"}";
			JSONObject jo = new JSONObject(checkResult);
			 PrintWriter out=response.getWriter();
			 out.print(jo.toString());
	         out.flush();//将流刷新
	         out.close();//将流关闭
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String telphone = request.getParameter("tel");
		 String str="ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		String checkNumber="";
		HttpSession hs = request.getSession();
		for(int i=0;i<4;i++)
		{
		char ch = str.charAt(new Random().nextInt(str.length()));
		checkNumber += ch;
		}
		hs.setAttribute("checkNumber", checkNumber);
		hs.setMaxInactiveInterval(60);
		int statusCode = sendValidNumber(telphone,checkNumber);
		String checkResult ="{statusCode:"+statusCode+"}";
		JSONObject jo = new JSONObject(checkResult);
		 PrintWriter out=response.getWriter();
		 out.print(jo.toString());
         out.flush();//将流刷新
         out.close();//将流关闭
	}
	
	
	public int sendValidNumber(String telphone,String ramdom){
		HttpClient client = new HttpClient();
		int statusCode = 0;
		PostMethod post = new PostMethod("http://gbk.api.smschinese.cn");
		post.addRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=gbk");// 在头文件中设置转码
		NameValuePair[] data = { new NameValuePair("Uid", "菠萝菠萝"), new NameValuePair("Key", "b37600ac6d1b67e7c796"),
				new NameValuePair("smsMob",telphone ), new NameValuePair("smsText", "你好,你的手机验证码是"+ramdom+",若非本人操作，请忽略!") };
		post.setRequestBody(data);

		try {
			client.executeMethod(post);
			Header[] headers = post.getResponseHeaders();
			 statusCode = post.getStatusCode();
			for (Header h : headers) {
				System.out.println(h.toString());
			}
			String result = new String(post.getResponseBodyAsString().getBytes("gbk"));
			System.out.println(result); // 打印返回消息状态

			post.releaseConnection();
		} catch (HttpException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return statusCode;
	}

}
