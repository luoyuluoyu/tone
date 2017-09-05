<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body style="margin:0 auto;background-color:#EFFFD7">
	<% 	Object conum =  request.getAttribute("conum");
		int co = (int)conum;
	%>
	<center>
	<div>
		<div style=" width: 100%; height:100px">
			<img alt="" src="image/newLogo1.png" style="float: left;">
			<p style="color: black; font-size: 40px; float: left; margin-bottom: 0px;">欢迎成为char.Mr的一员</p>
			</div>
			<div style=" height:100px;height:350px;font-size:30px;margin-top:100px ">
		<span style="float:left;margin-left:25px">您的账号是：<%=co %>！</span><br>
		<span style="font-size:30px">未来此账号将作为您的唯一标识，您将使用此账号进行登等操作，请牢记！</span><br>
		
		<a href="login.jsp" style="margin:0 auto">返回登录界面</a>
		
		</div>
		</div>

		<div style="margin-top: 50px">
			<a href="https://www.tencent.com/zh-cn/index.html" class="text-muted">关于char.Mr</a>
			|<a href="http://kf.qq.com/product/email.html" class="text-muted">客服中心</a>
			|<a href="#" class="text-muted">联系我们</a> |<a href="#"
				class="text-muted">帮助中心</a> |<span>©2016 - 2017 char.Mr Inc.
				All Rights Reserved.</span>
		</div>
	</center>
</body>
</html>