<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="bootstrap/js/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="Js.js"></script>
<style>

input{ font-family:Arial; font-size:12px; color:#000}

</style>
</head>
<body style="margin: 0 0 0 0;">
	<center>
		<div style="background-color: #EFFFD7; widows: 1366px; height: 768px">
			
				<div style="float: left;">
					<pre style="font-size: 40px;font-family:Microsoft YaHei;color:#9ACD32;margin: 20px 0px 0px 30px;">欢迎注册Char.Mr</pre>
				</div>
				<img src="image/newLogo1.png" style="position:absolute;right :1000px;top:140px">
			
			<div style="margin: 50px 0px 0px 80px;float: left;">
				<form name="reg_testdate" id="form1" >
					<table >
						<tr>
							<td style="font-family: sans-serif;">*昵称</td>
							<td><input type="text" id="username" name="username"
								onblur="onk('username','show1')" onfocus="onk2('show1')" style="border-radius: 25px;font-size: 14px;border: 1px solid #7d7d7d;"></td>
							<td><P id="show1" style="width: 100px; height: 30px"></P></td>
						</tr>
						<tr>
							<td>*密码</td>
							<td><input type="password" id="password1" name="password1"
								onblur="pass('password1')" onfocus="onk2('show2')" style="border-radius: 25px;font-size: 14px;border: 1px solid #7d7d7d;"></td>
							<td><P id="show2" style="width: 130px; height: 30px"></P></td>
						</tr>
						<tr>
							<td>确认密码</td>
							<td><input type="password" id="password2" name="password2"
								onblur="pass2()" onfocus="onk2('show3')" style="border-radius: 25px;font-size: 14px;border: 1px solid #7d7d7d;"></td>
							<td><P id="show3" style="width: 100px; height: 30px"></P></td>
						</tr>
						<tr>
							<td>性别</td>
							<td><input type="radio" id="gender" name="gender" value="男">男
								<input type="radio" id="gender" name="gender" value="女">女</td>

						</tr>
						<tr>
							<td>生日</td>
							<td><select name="YYYY" onChange="YYYYDD(this.value)">
									<option value="nian">请选择 年</option>
							</select> <select name="MM" onChange="MMDD(this.value)">
									<option value="yue">选择 月</option>
							</select> <select name="DD">
									<option value="ri">选择 日</option>
							</select></td>
						</tr>
					
						<tr>
							<td>*手机号码</td>
							<td><input type="text" name="num" id="num" onblur="numyz()"
								onfocus="onk2('show4')" style="border-radius: 25px;font-size: 14px;border: 1px solid #7d7d7d;"></td>
							<td><P id="show4" style="width: 100px; height: 30px"></P></td>
						</tr>
						<tr>
							<td>验证码</td>
							<td><input type="text" name="checks" id="checkNumber"
								class="form-control" onblur="vaild()" style="border-radius: 25px;font-size: 14px;border: 1px solid #7d7d7d;"></td>
							<td><a href="javascript:reloadCode();"><img alt="验证码"
									id="imagecode" src="ImageServlet" /></a></td>
							<td><P id="checkResult" style="width: 130px; height: 30px"></P></td>
						</tr>

					</table>
					<button onclick="return validate()"
						style="height: 30px; width: 100px; margin-right: 170px;">确定</button>
					<div id="Verification"></div>
					<p style="color: #808080; font-size: 10px;">带*为必填项 亲亲宝贝!</p>
				</form>
			</div>

			<div style="float: left;margin: 50px 0px 0px 200px;">
				<a href="https://www.tencent.com/zh-cn/index.html"
					class="text-muted">关于Char</a> |<a
					href="http://kf.qq.com/product/email.html" class="text-muted">客服中心</a>
				|<a href="#" class="text-muted">联系我们</a> |<a href="#"
					class="text-muted">帮助中心</a> |<span>©2016 - 2017 char.mr Inc.
					All Rights Reserved.</span>
			</div>
		</div>
	</center>

</body>
</html>