<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>找回密码1</title>
<link type="text/css" href="css/css.css" rel="stylesheet" />
<script src="bootstrap/js/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="Js.js"></script> 
<script>
$(document).ready(function(){
	$("#username").blur(function(){
		 num = document.getElementById("username").value;
		 userName = document.getElementById("userName");
		 if(num == null || num ==""){
				userName.innerHTML="账号不能为空";
		}else{
			$.ajax({  
				     url:'retrieval?sal=1&num='+num+'',// 跳转
				     type:'get',  
				     cache:false,  
				     dataType:'json',  
			     success:function(data) {  
				         if(data.name==2 ){  
				        	 userName.innerHTML="没有该账号";
				         }else{  
				        	 userName.innerHTML="ok";
				        }  
				     },  
				     error : function(){  
				    	 userName.innerHTML="没有该账号";  
			 			}
				});
		}
	});
});
</script>
<style>
.web-width {
	background-color: #f5f5f5;
	margin-top: -30px;
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
	background-color: #f5f5f5;
	height: 100px;
	line-height: 100px;
	text-align: center;
}

#content_center {
	height: 500px;
}
</style>
</head>
<body style="margin: 0 0 0 0;">

	
		<div style="background-color: #EFFFD7; widows: 1366px; height: 768px">
			
				<div style="float: left; margin-top: 30px;">
					<pre style="font-size: 40px;font-family:Microsoft YaHei;color:#9ACD32;margin: 20px 0px 0px 30px;">欢迎注册Char.Mr</pre>
				</div>
				<img src="image/newLogo1.png" style="position:absolute;right :1000px;top:140px">
			
		<div class="web-width">
			<div class="for-liucheng" style="float: left;margin-top: 83px;">
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
			<!--for-liucheng/-->
		</div>
		<div id="content_center">
			<form   id="getAccount">
				<table>
					<tr>
						<td>账号：</td>
						<td><input type="text" placeholder="用户名" id="username" name="username" style="width: 299px; height: 30px; border-radius: 25px; font-size: 14px; border: 1px solid #7d7d7d;"></td>
						<td colspan="2" id="userName" style="color: #8C8C8C;"></td>
					</tr>
					<tr>
						<td>验证码：</td>
						<td><input type="text" id="checkNumber" onblur="vaild()" style="width: 299px; height: 30px; border-radius: 25px; font-size: 14px; border: 1px solid #7d7d7d;"></td>
						<td><a href="javascript:reloadCode();"> <img
								src="ImageServlet" alt="验证码" id="imagecode">
						</a></td>
						<td id="checkResult" style="color: #8C8C8C"></td>
					</tr>
				</table>
				<button onclick="return validates('userName','checkResult',1)" style="height: 30px; width: 100px; margin-right:170px;">确定</button>
		<p  id="Verification" style="color: #8C8C8C"></p>
			</form>
		</div>
		<center>
		<div>
			<span id="foot_content" style="display: block;font-family:Microsoft YaHei;color:#9ACD32;margin: 80px 0px 0px 30px;"> <a
				href="https://www.tencent.com/zh-cn/index.html" class="text-muted">关于腾讯</a>
				|<a href="http://kf.qq.com/product/email.html" class="text-muted">客服中心</a>
				|<a href="#" class="text-muted">联系我们</a> |<a href="#"
				class="text-muted">帮助中心</a> |<span>©1998 - 2017 Tencent Inc.
					All Rights Reserved.</span>
			</span>
		</div>
		</center>
	</div>
</body>
</html>