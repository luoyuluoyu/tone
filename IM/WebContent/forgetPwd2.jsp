<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>找回密码2</title>
<link type="text/css" href="css/css.css" rel="stylesheet" />
<script src="bootstrap/js/jquery.min.js"></script>
<script src="Js.js"></script>
<script>
var time = 60;
function count(){
	time -=1;
	document.getElementById("checkNumber").value = time;
	if(time == 0){
		var b = document.getElementById("isSuccess");
		clearInterval(myVar);
		$('#checkNumber').removeAttr("disabled");
		document.getElementById("checkNumber").value="获取短信验证码";
		time = 60;
		if(b !="验证通过"){
			b.innerHTML="";
		}
	}
}
function createXMLHttp() {
	
	var XMLHttp;
	if (window.ActiveXObject) {
		XMLHttp = new MicrosoftActiveXObject("Microsoft.XMLHTTP");
	} else {
		XMLHttp = new XMLHttpRequest();
	}
	return XMLHttp;
}
function sendMessage() {
	document.getElementById("checkNumber").disabled="true"
	xmlHttp = createXMLHttp();
	var telephone = document.getElementById("tel").value;

	xmlHttp.onreadystatechange = getResult;
	xmlHttp.open("post", "Vaild?tel=" + telephone, true);
	xmlHttp.send(null);
}

function getResult() {
	if (xmlHttp && xmlHttp.readyState == 4 && xmlHttp.status == 200) {
		var b = document.getElementById("isSuccess");
		var json = JSON.parse(xmlHttp.responseText);
		

		if(json.statusCode <= 0){
			b.style.color = "red";
			b.innerHTML = "网络超时，短信发送失败，请在1分钟后再次发送";
		}else{
			b.style.color = "green";
			b.innerHTML = "短信发送成功,请在1分钟内输入谢谢";
		}
		myVar = setInterval(function(){count()},1000);
	}
}

$(document).ready(function(){
	$("#checkNumberContent").blur(function(){
		 num = document.getElementById("checkNumberContent").value;
		 userName = document.getElementById("Verification");
		 if(num == null || num ==""){
				userName.innerHTML="验证码不能为空";
		}else{
			$.ajax({  
				     url:'Vaild?num='+num+'',// 跳转
				     type:'get',  
				     cache:false,  
				     dataType:'json',  
			     success:function(data) {  
				         if(data.jo==2 ){  
				        	 userName.style.color = "red";
				        	 userName.innerHTML="验证码错误";
				         }else{  
				        	 userName.style.color = "green";
				        	 userName.innerHTML="验证通过";
				        }  
				     },  
				     error : function(){  
				    	 userName.innerHTML="服务器错误"; 
			 			}
				});
		}
	});
});

$(document).ready(function(){
	$("#tel").blur(function(){
		 num = document.getElementById("tel").value;
		 userName = document.getElementById("userNames");
		 if(num == null || num ==""){
				userName.innerHTML="手机号不能为空";
		}else{
			$.ajax({  
				     url:'retrieval?sal=2&num='+num+'',// 跳转
				     type:'get',  
				     cache:false,  
				     dataType:'json',  
			     success:function(data) {  
				         if(data.name==2 ){  
				        	 userName.innerHTML="该手机号没有绑定";
				         }else{  
				        	 userName.innerHTML="ok";
				        }  
				     },  
				     error : function(){  
				    	 userName.innerHTML="服务器错误"; 
			 			}
				});
		}
	});
});

function validates(userName ,checkResult,num) {
	var a = document.getElementById(userName).innerHTML;
	var b = document.getElementById(checkResult).innerHTML;
	if ( a == "ok" && b == "验证通过") {
		getAccount.action = "forget?go="+num+"";
		getAccount.method = "post";
		getAccount.submit();
	} else {
		var s = document.getElementById("Verification");
		s.style.color = "#EEAD0E";
		document.getElementById("Verification").innerHTML = "填写正确的必填项"
		var t = setTimeout("timedMsg()", 2000);
		return false;
	}
}
</script>
<style>
.web-width{
	
	margin-top:-30px;
}
#header{
background-color:#2f86f6;
font-color:white;
	height: 100px;
	
}
#foot1{
	margin:0 auto;

	background-color:#f5f5f5;
	height:100px;
	line-height:100px;
	text-align:center;
}
#content_center{
height:45%;
font-size:16px;
color:gray;
}
#content_table{
margin:50px 0 0 300px;
padding:20px 0 20px 0;
}
#submit{
width:80px;
background:#00CC00	;
height:30px;
margin:10px 0 0 200px;
}
#selectMethod select{
margin-left:-250px;
}
#center_content {
	margin-left: 200px;
	background-color: #EFFFD7;
}
</style>
</head>
<body style="margin:0px 0px 0px 0px;">
	<div style="background-color: #EFFFD7; widows: 1366px; height: 768px">
			
				<div style="float: left;">
					<pre style="display: block;font-size: 40px;font-family:Microsoft YaHei;color:#9ACD32;margin: 20px 0px 0px 30px;">欢迎注册Char.Mr</pre>
				</div>
			
				<div id="center1">
				<img src="image/newLogo1.png"
					style="position: absolute; right: 1000px; top: 140px">
			</div>
		<div class="content" style="float: left; margin-top: 40px">
			<div class="web-width" style="float: left;">
				<div class="for-liucheng">
					<div class="liulist for-cur"></div>
					<div class="liulist for-cur"></div>
					<div class="liulist"></div>
					<div class="liulist"></div>
					<div class="liutextbox">
						<div class="liutext for-cur">
							<em>1</em><br /> <strong>填写账户名</strong>
						</div>
						<div class="liutext for-cur">
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
			<!--web-width/-->
		</div>
		<!--content/-->
		<div id="content_center">
			<form id="getAccount">
				<table>
					<tr>
						<td>请选择验证身份方式:</td>
						<td colspan="2" id="selectMethod"><select style="border-radius: 25px;font-size: 14px;border: 1px solid #7d7d7d;">
								<option value="1">手机短信验证</option>
						</select></td>
					</tr>
					<tr>
						<td>已验证手机:</td>
						<td><input type="text" id="tel" style="width: 299px; height: 30px; border-radius: 25px; font-size: 14px; border: 1px solid #7d7d7d;"></td>
						<td><a href="#">若该手机已换请联系客服</a></td>
						<td colspan="2" id="userNames" style="color: red;width: 200px;"></td>
					</tr>
					<tr>
						<td>请填写手机验证码：</td>
						<td><input type="text" id="checkNumberContent" style="width: 299px; height: 30px; border-radius: 25px; font-size: 14px; border: 1px solid #7d7d7d;"
							></td>
						<td><input type="button" value="获取短信验证码" id="checkNumber"
							onclick="sendMessage()"></td>
							<td><span name ="isSuccess" id="Verification"style="color: red;width: 200px;"></span></td>
					</tr>
				</table>
				<button onclick="return validates('userNames','Verification',2)" style="height: 30px; width: 100px; margin-right:170px;">确定</button>
			<p id="Verification" style="color: red"></p>
			</form>
		</div>
		<center>
		<div id="foot1" style="display: block;font-family:Microsoft YaHei;color:#9ACD32;margin: 80px 0px 0px 30px;">
			<span id="foot_content"> <a
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