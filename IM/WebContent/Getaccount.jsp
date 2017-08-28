<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 	Object conum =  request.getAttribute("conum");
		int co = (int)conum;
	%>
	<center>
		<div style="background-color: #87CEFA; width: 100%; height: 100px">
			<img alt="" src="image/logo.png" style="float: left;">
			<p style="color: #F0F8FF; font-size: 40px; float: left; margin-bottom: 0px;">恭喜成为QQ的一员</p>
		</div>
		<div style=" height:100px;background: url(image/content_background.jpg);no-repeat;height:465px; ">
		您的账号是：<%=co %>
		<form action="">
		<a href="login.jsp">返回登录界面</a>
		</form>
		</div>


		<div style="margin-top: 30px">
			<a href="https://www.tencent.com/zh-cn/index.html" class="text-muted">关于腾讯</a>
			|<a href="http://kf.qq.com/product/email.html" class="text-muted">客服中心</a>
			|<a href="#" class="text-muted">联系我们</a> |<a href="#"
				class="text-muted">帮助中心</a> |<span>©1998 - 2017 Tencent Inc.
				All Rights Reserved.</span>
		</div>
	</center>
</body>
</html>