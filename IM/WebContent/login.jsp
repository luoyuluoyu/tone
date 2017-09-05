<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录CHar.Mr</title>

<link rel="stylesheet" href="css/style.css">
<link href="css/popup-box.css" rel="stylesheet" type="text/css"media="all" />

<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Sign In And Sign Up Forms  Widget Responsive,
		 Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, 
		 Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template,
		  Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />

	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<script src="bootstrap/js/jquery.min.js"></script>

</head>
<body>
	<h1>Char.Mr</h1>
	<div class="w3layouts" >
		<div class="signin-agile">
			<h2>登录</h2>
			<%String userName = "";
			String isSaveUserName = "";
			String password ="";
			Cookie[] cookies = request.getCookies();
			if(cookies != null){
			for (Cookie cookie : cookies) {
				String cookieName = cookie.getName();
				if (cookieName.equals("userName")) {
					userName = cookie.getValue();
					request.setAttribute("userName", userName);
				}

				if (cookieName.equals("remenberPwd")) {
					if (cookie.getValue().equals("true")) {
						isSaveUserName = "checked";
					}
				}
				if (cookieName.equals("passWord")) {
					password = cookie.getValue();
					request.setAttribute("passWord", password);

				}
			}
			}
				%>
			<form action="loginServlet1" method="post" >
				<input type="text" name="userName" class="name" id="userName" placeholder="用户名" required="" value="${userName}">
				<input type="password" name="passWord" class="password"  placeholder="密码" required="" value="${passWord}">
				<ul>
					<li><input type="checkbox" id="brand1" value="1" name="remenberPwd" <%=isSaveUserName%>> <label
						for="brand1"><span></span>记住密码</label></li>
				</ul>
				<a href="forgetPwd1.jsp">忘记密码?</a><br>
				<div class="clear"></div>
				<input type="submit" value="登录">
				<span style="color:red">${Message}</span>
			</form>
		</div>
		<div class="signup-agileinfo">
			<h3 style="font-family: Helvetica">闲谈</h3>
			<p>Char.Mr为我们打开了一个新天地，原来闲谈也可以如此精彩。不论你的学历有多高，你的财富有多少，
			你的言语都像画笔一样勾画着你的形象，反映着你的修养，所以闲谈能力决不可小视。</p>
			<div class="more">
				<a class="book popup-with-zoom-anim button-isi zoomIn animated"
					data-wow-delay=".5s" href="register.jsp">点击注册</a>
			</div>
		</div>
		<div class="foot1">
			<span class="foot_content"> 
			<a href="https://www.tencent.com/zh-cn/index.html" class="text-muted">关于char.Mr</a>
				|<a href="http://kf.qq.com/product/email.html" class="text-muted">客服中心</a>
				|<a href="#" class="text-muted">联系我们</a> | <a href="#"
				class="text-muted">帮助中心</a> |<span>©2016 - 2017 char.Mr Inc.All Rights Reserved.</span>
			</span>
		</div>
	</div>
</body>
</html>