<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>找回密码4</title>
<link type="text/css" href="css/css.css" rel="stylesheet" />
<script src="bootstrap/js/jquery.min.js"></script>
<style>


#header {
	background-color: #2f86f6;
	font-color: white;
	height: 100px;
	margin-top: 100px;
}

#foot1 {
	margin: 0 auto;
	width: 1140px;
	background-color: #f5f5f5;
	height: 100px;
	line-height: 100px;
	text-align: center;
}

.successs {
	height: 420px;
	display: block;
}

#center2, #center1 {
	float: left;
}

.content {
	
}

#center2 {
	width: 1000px;
}

#center_content {
	margin-left: 200px;
	background-color: #EFFFD7;
}
</style>
</head>
<body style="margin: 0 0 0 0">
	<div style="background-color: #EFFFD7; widows: 1366px; height: 768px">

		<div style="float: left;">
			<pre
				style="font-size: 40px; font-family: Microsoft YaHei; color: #9ACD32; margin: 20px 0px 0px 30px;">欢迎注册Char.Mr</pre>
		</div>

		
			<div id="center1">
				<img src="image/newLogo1.png"
					style="position: absolute; right: 1000px; top: 140px">
			</div>
			<div id="center2">
				<div class="content" style="margin: 40px 450px 0px 20px;">
					<div class="for-liucheng">
						<div class="liulist for-cur" id="for-liucheng1"></div>
						<div class="liulist for-cur"></div>
						<div class="liulist for-cur"></div>
						<div class="liulist for-cur"></div>
						<div class="liutextbox">
							<div class="liutext for-cur">
								<em>1</em><br />
								<strong>填写账户名</strong>
							</div>
							<div class="liutext for-cur">
								<em>2</em><br />
								<strong>验证身份</strong>
							</div>
							<div class="liutext for-cur">
								<em>3</em><br />
								<strong>设置新密码</strong>
							</div>
							<div class="liutext for-cur">
								<em>4</em><br />
								<strong>完成</strong>
							</div>
						</div>
					</div>
					<!--for-liucheng/-->
				</div>
				<div class="successs">
					<h3>恭喜您，修改成功！</h3>
					<h3>
						如需登录请点击<a href="login.jsp">首页</a>
					</h3>
				</div>
			</div>
		
		<div id="foot1"  style="float: left;margin-top:-100px">
			<span id="foot_content"> <a
				href="https://www.tencent.com/zh-cn/index.html" class="text-muted">关于腾讯</a>
				|<a href="http://kf.qq.com/product/email.html" class="text-muted">客服中心</a>
				|<a href="#" class="text-muted">联系我们</a> |<a href="#"
				class="text-muted">帮助中心</a> |<span>©1998 - 2017 Tencent Inc.
					All Rights Reserved.</span>
			</span>
		</div>
	</div>
</body>
</html>