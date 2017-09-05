<%@ page language="java" contentType="text/html; charset=utf-8"
	import="com.service.*,com.entity.*,com.Dao.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Char.Mr</title>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="ckeditor/adapters/jquery.js"></script>
<script type="text/javascript" src="ckeditor/config.js"></script>
<script src="bootstrap/js/jquery.min.js"></script>
<style type="text/css">
body {
	width: 50%;
	height: 50%;
	margin: 20px;
	position: absolute;
	z-index: 1;
}

#foot_left {
	height: 30px;
	background-color: #666699;
	width: 100%;
}

#chatFriend {
	width: 100%;
	height: 12%;
	text-align: center;
	font-size: 20px;
	color: #FFFFFF;
	background-color: #666699;
}

#chatview {
	width: 100%;
	height: 80%;
	float: right;
	overflow-y: scroll;
	overflow-x: hidden;
}


#Chatwindow {
	padding-left: 50px;
	float: right;
	height: 75%;
	width: 75%;
	margin-top: 15px;
}
#close{
height:30px;
}

#foot_left input {
height:30px;
}
</style>

<script>
	//获取当前时间
	function getLocalTime() {
		var date1 = new Date();
		var seperator1 = "-";
		var seperator2 = ":";
		var month = date1.getMonth() + 1;
		var strDate = date1.getDate();
		if (month >= 1 && month <= 9) {
			month = "0" + month;
		}
		if (strDate >= 0 && strDate <= 9) {
			strDate = "0" + strDate;
		}
		var hour = date1.getHours();
		var minites = date1.getMinutes();
		var seconds = date1.getSeconds();

		if (minites >= 0 && minites <= 9) {
			minites = "0" + minites;
		}
		if (seconds >= 0 && seconds <= 9) {
			seconds = "0" + seconds;
		}
		LocalTime = date1.getFullYear() + seperator1 + month + seperator1
				+ strDate + " " + hour + seperator2 + minites + seperator2
				+ seconds;
		return LocalTime;
	}
	//定义最后一次的时间
	var endTime ;
	//用于获取编辑文本框中内容并设置为空，也就是清空文本框
	function cancel() {
		CKEDITOR.instances.TextArea1.setData("");
	}
	
	//点击发送按钮需要做的事件
	function info(){
		var sendMessage =CKEDITOR.instances.TextArea1.document.getBody().getText();
		
		if(sendMessage ==""){
		alter("发送内容不能为空!");
		}else{
			xmlHttp = createXMLHttp();
			var userName = document.getElementById("nickName").value;
			var ownNumber = document.getElementById("ownNumber").value;
			var customerNumber = document.getElementById("serviceNumber").value;
			var date =getLocalTime();
			showInfo(userName,date,sendMessage);
			cancel();
			xmlHttp.onreadystatechange = dealInfo;
			xmlHttp.open("post", "customerchat?own=" + ownNumber + "&customer="+customerNumber+"&act=save", true);
			var param ="date="+date+"&content="+sendMessage;
			 xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xmlHttp.send(param);
		}
	}
	//创建xml对象
	function createXMLHttp() {

		var XMLHttp;
		if (window.ActiveXObject) {
			XMLHttp = new MicrosoftActiveXObject("Microsoft.XMLHTTP");
		} else {
			XMLHttp = new XMLHttpRequest();
		}
		return XMLHttp;
	}

	function getMessage() {

		xmlHttp = createXMLHttp();
		var ownAccount = document.getElementById("ownNumber").value;
		getLocalTime();
		xmlHttp.open("post", "customerchat?servicer=" + ownAccount + "&date="
				+ LocalTime + "&act=get", true);
		xmlHttp.onreadystatechange = dealMessage;

		xmlHttp.send(null);

	}

	function getNewMessage(ownAccount,date) {

		xmlHttp = createXMLHttp();
		getLocalTime();

		xmlHttp.onreadystatechange = dealMessage;
		xmlHttp.open("post", "customerchat?servicer=" + ownAccount + "&date="
				+ date + "&act=get", true);
		xmlHttp.send(null);
	}
	function dealMessage() {
		if (xmlHttp && xmlHttp.readyState == 4 && xmlHttp.status == 200) {
			var chatCustomer = document.getElementById("customerName").innerHTML;
			var json = JSON.parse(xmlHttp.responseText);
			endTime = LocalTime;
			if (json != null) {
				for (var i = 0; i < json.length; i++) {
				if(json[i].sender == chatCustomer){
					var sender = json[i].sender;
					var date = json[i].sendTime;
					var content = json[i].content;
					showInfo(sender,date,content);
					endTime = json[i].sendTime;
				}
				}
			}
			
			var ownAccount = document.getElementById("ownNumber").value;
			setInterval(function() {
				getNewMessage(ownAccount,endTime)
			}, 5000);
		}
	}
	//使滚动条始终处于底部
	function keep() {
		var div = document.getElementById('chatview');
		div.scrollTop = div.scrollHeight;
	}

	//拼接发送消息
	function showInfo(sender, date, content) {
		var showContent = document.getElementById("chatview");
		var row = document.createElement("div")

		var row1 = document.createElement("span");
		row1.appendChild(document.createTextNode(sender));
		row.appendChild(row1);

		var row2 = document.createElement("span");
		row2.appendChild(document.createTextNode(date));
		row.appendChild(row2);

		var row3 = document.createElement("br");
		row.appendChild(row3);

		var row4 = document.createElement("span");
		row4.appendChild(document.createTextNode(content));
		row.appendChild(row4);

		showContent.appendChild(row);
		keep();

	}

	function dealInfo(){
	}
	
	$(document).ready(function() {
		$("#Chatwindow").hide();
		$("#customerService").click(function() {
			$.ajax({
				type : "post",
				async : true,
				url : "distribute",
				dataType : "json",
				data : {
					userName : $("input:hidden").val()
				},
				success : function(data) {
					$("#customerName").text(data.nickName);
					$("#serviceNumber").val(data.userName);
					$("#Chatwindow").show();					
						getMessage();
				},
				error : function() {
					alert('连接失败,暂无客服在线');
				}
			});

		})

		$("#close").click(function() {
			$.ajax({
				type : "get",
				async : true,
				url : "distribute",
				dataType : "json",
				data : {
					userName : $("#ownNumber").val(),
					customerServce : $("#serviceNumber").val()
				},
				success : function(data) {
					$("#customerName").text();
					$("#chatview").text();
					$("#Chatwindow").hide();

				},
				error : function() {
					alert('error');
				}
			});

		})

	})
</script>

</head>
<body>
	<input type="hidden" value="${userName}" id="ownNumber">
	<input type="hidden" value="${user.nickName }" id="nickName"/>
	<input type="hidden" id="serviceNumber" />
	<%
		String userName = request.getParameter("userName");
	%>
	<div id="Chatwindow">
		<div id="chatFriend"><span id="customerName">chat</span>
			<span style="float: right"> 
			
				<input type="button" class="btn-large  btn btn-primary	"  id="close" value="关 闭"></span>
		</div>
		<input type="hidden" id="friendQq" value="" />
		<div id="chatview"></div>
		<textarea id="TextArea1" class="ckeditor" name="editor"></textarea>

		<form id="form1">
			<%--此处为自定义工具栏 --%>
			<script type="text/javascript">
				CKEDITOR.replace('TextArea1', {
					toolbar : [ [ 'Image', 'Smiley' ] ]

				});
				
				
			</script>

			<div id="foot_left">
				<span style="float: right;"><input type="button"
					class="btn-large  btn btn-primary" value="清 除" onclick="cancel() ">&nbsp;&nbsp;&nbsp;
					<input type="button"  value="发 送" class="btn-large  btn btn-primary"
					onclick="info()"></span>
			</div>
		</form>
	</div>
	<a href="#" id="customerService"> <img
		src="image/customerService.png"
		style="position: fixed; z-index: 999; top: 300px; right: 0; _position: absolute; _top: expression(documentElement.scrollTop + 45); overflow: hidden; *zoom: 1;">
	</a>
</body>
</html>