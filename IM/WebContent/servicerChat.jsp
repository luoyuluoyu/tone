<%@ page language="java" contentType="text/html; charset=utf-8"
	import="java.util.List, com.entity.Users, com.service.UserService"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<link href="css1/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css1/common.css" />
<link rel="stylesheet" type="text/css" href="css1/slide.css" />
<link
	href="https://cdn.bootcss.com/bootstrap-validator/0.5.3/css/bootstrapValidator.css"
	rel="stylesheet">
<link
	href="https://cdn.bootcss.com/bootstrap-validator/0.5.3/css/bootstrapValidator.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css1/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css1/flat-ui.min.css" />
<link rel="stylesheet" type="text/css" href="css1/jquery.nouislider.css">
<link type="text/css" rel="stylesheet"
	href="css1/bootstrapValidator.css" />
<script src="bootstrap/js/jquery.min.js"></script>


<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="ckeditor/adapters/jquery.js"></script>
<script type="text/javascript" src="ckeditor/config.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
<title>Mr.Char客服聊天界面</title>

<style>
#foot_left {
	height: 30px;
	background-color: #CCCCCC;
	width: 100%;
	border: 1px solid #CCCCCC;
}

#chatFriend {
	width: 100%;
	height: 30px;
	text-align: center;
	font-size: 20px;
	font-color: #778899;
	background-color: #eee;
	border-bottom: 1px solid #CCCCCC;
}

#chatview {
	width: 1200px;
	height: 360px;;
	overflow-y: scroll;
	overflow-x: hidden;
	border-right: 1px solid #CCCCCC;
}

.littleButton {
	height: 100%;
	font-size: 16px;
	color: black;
	background-color: #999999;
}

#Chatwindow {
	padding-left: 50px;
	float: right;
	height: 75%;
	width: 100%;
	margin-top: 15px;
}

#user {
	width: 1200px;
	margin-left: -49px;
	margin-top: -18px;
	overflow-x: hidden;
}
</style>

<script>
	//创建一个存储当前正在联系的客户的数组
	var allUser = new Array();
	
	var j = 0;
	//对客服第一次拿到客户时设一个标志
	var count = 0;
	//定义上一次取的时间
	var endTime ;
	
	//当点击关闭按钮时执行的函数
	function closeFunction() {
		
		if(allUser.length > 0){
			
			var chatFriend = document.getElementById("customerName").innerHTML;
			var chatView = document.getElementById(chatFriend).value;
			var index = 0;
			for(var i = 0;i < allUser.length;i++){
				if(allUser[i] == chatView){
					index = i;
				}
			}
			allUser.splice(index,1);
			$("#" + chatView + "").remove();
			if(allUser.length == 0){
				document.getElementById("customerName").innerHTML ="暂无联系人";
				}else{
				var chatAccount = allUser[0];
				changeCustomer(chatAccount);
			}
			
			
		}else{
			var showContent = document.getElementById("chatview");
			showContent.innerHTML="";
			
			document.getElementById("customerName").innerHTML="暂无联系人";
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
	//到服务器查找是否有新消息和新的客户连接上来
	function findCustomerAndMessage() {
		xmlHttp = createXMLHttp();
		var ownAccount = document.getElementById("ownNumber").value;
		xmlHttp.onreadystatechange = getResult;
		var usersString ="";
		if(allUser.length > 0){
		for(var i = 0; i <allUser.length;i++){
			usersString += ("&allusers="+allUser[i]);
		}
		}else{
			usersString = "&allusers=";
		}
		xmlHttp.open("get", "FindNewCustomer?servicer=" + ownAccount+usersString, true);
		xmlHttp.send(null);

	}

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
	//服务器回调后执行
	function getResult() {
		if (xmlHttp && xmlHttp.readyState == 4 && xmlHttp.status == 200) {
			var content = document.getElementById("customerName");
			var json = JSON.parse(xmlHttp.responseText);
			if (json != null) {
				var friendList = document.getElementById("customerList");
				for(var i = 0; i < json.length;i++){
					//js动态的创建标签和对对应标签设置属性和方法
					var col = document.createElement("div");
					col.setAttribute("class", "meun-item");
					col.setAttribute("href", "#user");
					col.setAttribute("aria-controls", "user");
					col.setAttribute("role", "tab");
					col.setAttribute("data-toggle", "tab");
					col.setAttribute("onclick", "changeCustomer("
							+ json[i].userName + ")");
					col.setAttribute("id", json[i].userName);
					//显示出每个客户的昵称值
					col.appendChild(document.createTextNode(json[i].nickName));
					//每个新生成客户定义一个隐藏标签标识它的账号
					var col1 = document.createElement("input");
					col1.setAttribute("type", "hidden");
					col1.setAttribute("value", json[i].userName);
					col1.setAttribute("id", json[i].nickName);
					friendList.appendChild(col1);
					
	//				var col2 = document.createElement("input");
		//			col2.setAttribute("type", "hidden");
			//		col2.setAttribute("value", json[i].nickName);
				//	col2.setAttribute("class", json[i].userName);
					//col.appendChild(col2);

					friendList.appendChild(col);

					allUser[j] = json[i].userName;

					j = j + 1;
					if (allUser.length == 1) {
						content.innerHTML = json[i].nickName;
						count = count + 1;
						if (count == 1) {
							var ownAccount = document.getElementById("ownNumber").value;
							getLocalTime();

							getMessage(ownAccount, LocalTime);
						}
					}

				}
			}
		setInterval(function() {
				findCustomerAndMessage()
			}, 5000);

		}
	}
	//切换聊天界面获取它的全部聊天记录并保持滚动条始终在底部
	function changeCustomer(chatAccount) {
		xmlHttp = createXMLHttp();
		
		var ownAccount = document.getElementById("ownNumber").value;
		
		var customerNumber = document.getElementById(""+chatAccount+"").innerHTML;
		var customer = document.getElementById(""+chatAccount+"");
		
		customer.style.backgroundColor = "#4d5e70";
		var showContent = document.getElementById("chatview");
		showContent.innerHTML="";
		
		document.getElementById("customerName").innerHTML=customerNumber;
		xmlHttp.onreadystatechange = chatDetail;
		xmlHttp.open("post", "customerservice?servicer=" + ownAccount
				+ "&chatAccount=" + chatAccount + "&act=show", true);
		xmlHttp.send(null);
	}

	function chatDetail() {
		if (xmlHttp && xmlHttp.readyState == 4 && xmlHttp.status == 200) {
			var json = JSON.parse(xmlHttp.responseText);
			if (json != null) {

				for (var i = 0; i < json.length; i++) {
					
						var sender = json[i].sender;
						var date = json[i].sendTime;
						var content = json[i].content;
						showInfo(sender, date, content);
					
				}
			}

		}
	}
	//用于获取编辑文本框中内容并设置为空，也就是清空文本框
	function cancel() {
		CKEDITOR.instances.TextArea1.setData("");
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
	//点击发送按钮需要做的事件
	function info() {
		var sendMessage =CKEDITOR.instances.TextArea1.document.getBody().getText();

		if (sendMessage == "") {
			alter("发送内容不能为空!");
		} else {
			xmlHttp = createXMLHttp();
			var userName1 = document.getElementById("nickName").value;
			var userName = document.getElementById("ownNumber").value;
			var customerNumber1 = document.getElementById("customerName").innerHTML;
			var customerNumber = document.getElementById(""+customerNumber1+"").value;
			var date = getLocalTime();
			showInfo(userName1, date, sendMessage);
			cancel();
			xmlHttp.onreadystatechange = dealInfo;
			xmlHttp.open("post", "customerservice?own=" + userName
					+ "&customer=" + customerNumber + "&act=save", true);
			var param = "date=" + date + "&content=" + sendMessage;
			xmlHttp.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");
			xmlHttp.send(param);
		}
	}

	function dealInfo() {
	}
	function getMessage(ownAccount, date) {

		xmlHttp = createXMLHttp();
		getLocalTime();

		xmlHttp.onreadystatechange = dealMessage;
		xmlHttp.open("post", "customerservice?servicer=" + ownAccount
				+ "&date=" + date + "&act=get", true);
		xmlHttp.send(null);
	}

	function dealMessage() {
		if (xmlHttp && xmlHttp.readyState == 4 && xmlHttp.status == 200) {
			var chatCustomer = document.getElementById("customerName").innerHTML;
			var json = JSON.parse(xmlHttp.responseText);
			endTime =LocalTime;
			if (json != null) {

				for (var i = 0; i < json.length; i++) {
					if (json[i].sender == chatCustomer) {
						var sender = json[i].sender;
						var date = json[i].sendTime;
						var content = json[i].content;
						showInfo(sender, date, content);
						//最后一次取的时候的时间
						endTime = json[i].sendTime;
					}else{
						var customer = document.getElementById(""+json[i].sender+"").value;
						var customer1 = document.getElementById(""+customer+"");
						customer1.style.backgroundColor = "green";
					}
				}

			}
			var ownAccount = document.getElementById("ownNumber").value;


			setInterval(function() {
				getMessage(ownAccount, endTime)
			}, 5000);

		}
	}
	//使滚动条始终处于底部
	function keep() {
		var div = document.getElementById('chatview');
		div.scrollTop = div.scrollHeight;
	}

	
</script>
</head>

<body>
<input type="hidden" value="${user.userName}" id="ownNumber" />
<input type="hidden" value="${user.nickName}" id="nickName" />
<input type="hidden" id="allCustomer" />
	
	<div id="wrap">
		<!-- 左侧菜单栏目块 -->
		<div class="leftMeun" id="leftMeun">
			<div id="logoDiv">
				<p id="logoP">
					<img id="logo" alt="Mr.Char" src="images/logo.png"><span>Mr.Char</span>
				</p>
			</div>
			<div id="personInfor">
				<p id="userName">
					<span>${user.nickName}欢迎你!</span>
				</p>
				<p>
					<a href="login.jsp" id="closeWindow">退出登录</a>
				</p>
			</div>
			<div id="customerList">
				<div class="meun-item" href="#chan" aria-controls="chan" role="tab"
					data-toggle="tab">
					<img src="images/icon_change_grey.png">修改密码
				</div>
				<div class="meun-item" href="#user" aria-controls="user" role="tab"
					data-toggle="tab" onclick="findCustomerAndMessage()">
					<img src="images/icon_user_grey.png">客户列表
				</div>

			</div>
		</div>
		<!-- 右侧具体内容栏目 -->
		<div id="rightContent">
			<a class="toggle-btn" id="nimei"> <i
				class="glyphicon glyphicon-align-justify"></i>
			</a>
			<!-- Tab panes -->
			<div class="tab-content">

				<!-- 修改密码模块 -->
				<div role="tabpanel" class="tab-pane" id="chan">
					<div class="check-div">原始密码为12312313</div>
					<div
						style="padding: 50px 0; margin-top: 50px; background-color: #fff; text-align: right; width: 420px; margin: 50px auto;">
						<form class="form-horizontal">
							<div class="form-group">
								<label for="sKnot" class="col-xs-4 control-label">原密码：</label>
								<div class="col-xs-5">
									<input type="" class="form-control input-sm duiqi" id="sKnot"
										placeholder="" style="margin-top: 7px;">
								</div>
							</div>
							<div class="form-group">
								<label for="sKnot" class="col-xs-4 control-label">新密码：</label>
								<div class="col-xs-5">
									<input type="" class="form-control input-sm duiqi" id="sKnot"
										placeholder="" style="margin-top: 7px;">
								</div>
							</div>
							<div class="form-group">
								<label for="sKnot" class="col-xs-4 control-label">重复密码：</label>
								<div class="col-xs-5">
									<input type="" class="form-control input-sm duiqi" id="sKnot"
										placeholder="" style="margin-top: 7px;">
								</div>
							</div>
							<div class="form-group text-right">
								<div class="col-xs-offset-4 col-xs-5"
									style="margin-left: 169px;">
									<button type="reset" class="btn btn-xs btn-white">取 消</button>
									<button type="submit" class="btn btn-xs btn-green">保存</button>
								</div>
							</div>
						</form>
					</div>

				</div>

				<div role="tabpanel" class="tab-pane" id="user">
					<!--客服与客户聊天界面 -->
					<div id="Chatwindow">
						<div id="chatFriend">
							<span id="customerName">暂无联系客户</span> <span style="float: right">
								<input type="button"
								class="littleButton" onclick="closeFunction()" value="关 闭">
							</span>
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
								var editor = CKEDITOR.replace('TextArea1', {
									height : 100
								});
							</script>

							<div id="foot_left">
								<span style="float: right;"><input type="button"
									class="littleButton" value="清 除" onclick="cancel() ">&nbsp;&nbsp;&nbsp;
									<input type="button" class="littleButton" value="发 送"
									onclick="info()"></span>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
</body>
</html>