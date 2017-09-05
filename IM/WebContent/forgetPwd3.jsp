<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>找回密码3</title>
<link type="text/css" href="css/css1.css" rel="stylesheet" />
<script src="bootstrap/js/jquery.min.js"></script>
<script src="Js.js"></script>
<style>
body{
	font-size:16px;
}
#header {
	background-color: #2f86f6;
	font-color: white;
	height: 100px;
	margin-top: 50px;
}

#foot1 {
	margin: 0 auto;
	width: 1140px;
	background-color: #EFFFD7;
	height: 100px;
	line-height: 100px;
	text-align: center;
}
</style>

<script>
	function validates(userName, num) {
		var a = document.getElementById(userName).innerHTML;
		if (a == "密码一致") {
			getAccount.action = "forget?go=" + num + "";
			getAccount.method = "post";
			getAccount.submit();
		} else {
			var s = document.getElementById("Verification");
			s.style.color = "#EEAD0E";
			document.getElementById("Verification").innerHTML = "填写正确的必填项"
			var t = setTimeout("timedMsg()", 2000);
		}
	}
</script>
</head>
<body style="margin: 0 0 0 0">

	<div style="background-color: #EFFFD7; widows: 1366px; height: 768px">

		<div style="float: left;">
			<pre
				style="font-size: 40px; font-family: Microsoft YaHei; color: #9ACD32; margin: 50px 0px 0px 80px;">Char.Mr</pre>
		</div>

		<img src="image/newLogo1.png"
			style="position: absolute; right: 1000px; top: 140px">
		<div class="content">
			<div class="web-width">
			<div class="for-liucheng" style="float: left;margin-left:160px;margin-top: 83px;">
				<div class="liulist for-cur"></div>
				<div class="liulist"></div>
				<div class="liulist"></div>
				<div class="liulist"></div>
				<div class="liutextbox">
					<div class="liutext for-cur">
						<em>1</em><br /> <strong>填写账户名</strong>
					</div>
					<div class="liutext">
						<em>2</em><br /> <strong>验证身份</strong>
					</div>
					<div class="liutext">
						<em>3</em><br /> <strong>设置新密码</strong>
					</div>
					<div class="liutext">
						<em>4</em><br /> <strong>完成</strong>
					</div>
				</div>
			</div>
				<form style="margin-left: 400px;line-height:50px" id="getAccount" name="getAccount">
					<table>
						<tr>
							<td>新密码：</td>
							<td><input type="password" id="password1"
								onblur="pass('password1')"
								style="width: 299px; height: 30px; border-radius: 25px; font-size: 14px; border: 1px solid #7d7d7d;"></td>
							<td><P id="show2"></P></td>
						</tr>
						<tr>
							<td>确认密码：</td>
							<td><input type="password" name="password2" id="password2"
								onblur="pass2()"
								style="width: 299px; height: 30px; border-radius: 25px; font-size: 14px; border: 1px solid #7d7d7d;"></td>
							<td><P id="show3"></P></td>
						</tr>

					</table>
					<button onclick="validates('show3',3)"
						style="height: 30px; width: 100px; margin-top:30px;margin-left: 150px;">确定</button>
					<p id="Verification" style="color: red"></p>
				</form>
				<!--forget-pwd/-->
			</div>
			<!--web-width/-->
		</div>
		<!--content/-->

		<div id="foot1" style="display: block;font-family:Microsoft YaHei;color:#9ACD32;margin:300x 0px 0px 30px;">
			<span id="foot_content" style="display: block;font-family:Microsoft YaHei;color:#9ACD32;margin: 140px 0px 0px 30px;"> <a
				href="#" class="text-muted">关于char.Mr</a>
				|<a href="#" class="text-muted">客服中心</a>
				|<a href="#" class="text-muted">联系我们</a> |<a href="#"
				class="text-muted">帮助中心</a> |<span>©2016 - 2017 char.Mr Inc.
					All Rights Reserved.</span>
			</span>
		</div>
	</div>
</body>
</html>