<%@ page language="java" contentType="text/html; charset=UTF-8" 
import="com.entity.Users,com.service.UserService,java.util.*,com.service.UserService"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="bootstrap/js/jquery.min.js"></script>
<script type="text/javascript" src="http://www.francescomalagrino.com/BootstrapPageGenerator/3/js/jquery-2.0.0.min.js"></script>
<script type="text/javascript" src="http://www.francescomalagrino.com/BootstrapPageGenerator/3/js/jquery-ui"></script>
<link href="http://www.francescomalagrino.com/BootstrapPageGenerator/3/css/bootstrap-combined.min.css" rel="stylesheet" media="screen">
<script type="text/javascript" src="http://www.francescomalagrino.com/BootstrapPageGenerator/3/js/bootstrap.min.js"></script>
<title>Char.Mr</title>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
<style type="text/css">
body{
width:75%;
height:80%;
margin-top:30px;
 background-image:url(image/background4.jpg); 

}
.container{
	max-width:1200px;
	height:90%;
	
}
#head{
background-color:#EFFFD7;
height:15%;
width:100%;
}
#head_right{
font-size:20px;
color:#778899;
padding-bottom:10px;
}
#search{
height:10%;
width:100%;
margin-bottom:-3px;
}

#friendList{
height:75%;
width:25%;
float:left;
margin-top:15px;
background-color:white; 
    
}

.foot{
position:absolute;
z-index:5;
border:1px solid #d1d1d1;
border-top:none;
width:20.8%;
height:6.4%;
background-color:#EFFFD7;
}
.foot span {
margin:15px 0 0 20px;
line-height:12px;
}
#chatFriend
{
	width:100%;
	height:8%;
	text-align:center;
	font-size:20px;
	font-color:#778899;
	background-color:#EFFFD7;
}
#chatview
{
	width:100%;
	height:60%;
	float:right;
	overflow-y: scroll;
  	overflow-x: hidden;
  	
}
.littleButton
{
	
	height:27px;
	font-size:16px;
	color:black;
	
	/* border-top-left-radius: 10px;
    border-top-right-radius: 10px;
	border-bottom-left-radius: 10px;
	border-bottom-right-radius: 10px;
     */
   	
}


.container-fluid p{
	position:relative;
	margin:0 0 6% 60%;
	
}

.container-fluid p span{
	padding:0 0px 0 25px;
	line-height:16px;
}
.container-fluid{
	padding:0px;
	height:100%;
	line-height:20px;  	
	width:100%;
	overflow-y: scroll;
	background-color:white;
	
}
.sample_popup .menu_form_header {
	border: 1px solid #d1d1d1;
	border-bottom: 0px;
	cursor: default;
	width: 300px;
	height: 30px;
	line-height: 19px;
	vertical-align: middle;
	background: url('http://www.mb5u.com/jscss/demoimg/200904/20title.png')
		no-repeat;
	background-color:#EFFFD7;	
}

.sample_popup .menu_form_body {
	border: 1px solid #d1d1d1;
	width: 300px;
	background: url('http://mb5u.com/jscss/demoimg/200904/logbg.png')
		no-repeat left bottom;
}

#panel-987843{
font-size:10px;
font-family:verdana;
}

#panel-987843 p {
margin-top:-20px;
margin-left:160px;
}

#panel-987843 p a {
margin:0 0px 0 -20px;
}
#TextArea1
{
	width:100%;
	height:10%;	
}
#Chatwindow{
	padding-left:50px;
	float:left;
	height:75%;
	width:60%;
	margin-top:15px;
}
#foot_left{
	height:10%;
	background-color:#EFFFD7;

}


</style>
<script  type="text/javascript" src="ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="ckeditor/adapters/jquery.js"></script>
<script>


function changeBackcolor(a,b){
	var friend = document.getElementById(a);
	switch(b){
	case '1':
		friend.style.backgroundColor="#e3e3e3";
		break;
	case '2':
		friend.style.backgroundColor="white";
		break;
	case '3':
		friend.style.backgroundColor="#e3e3e3";
		break;
	}
}
function checkLeave(userName){
	xmlHttp = createXMLHttp();
	xmlHttp.onreadystatechange = getResult;
	xmlHttp.open("get", "loginServlet1?userName="+userName+"", true);
	xmlHttp.send(null);
}
function getMessage(a,b){
	xmlHttp = createXMLHttp();
	var Number = a;
	 
	xmlHttp.onreadystatechange = dealMessage;
	xmlHttp.open("post", "onLoadChat?userName="+Number+"&&act=search"+"&&date="+b+"", true);
	xmlHttp.send(null);
	getLocalTime();
	}


function dealMessage(){
if (xmlHttp && xmlHttp.readyState == 4 && xmlHttp.status == 200) {
		var content = document.getElementById("chatview");
		var json = JSON.parse(xmlHttp.responseText);
		if(json.length > 0){
			for(var i = 0 ; i < json.length;i++){
				var col = document.createElement("div");
				col.style.width="225px";

				var col1 =  document.createElement("div");
				col1.style.cssFloat="left";
				col1.innerHTML='<img src="image/head.jpg" height="25" width="25" class="img-circle"/>';
				col.appendChild(col1);
				
				var col2 = document.createElement("div");
				

				var col3 = document.createElement("span");
				col3.style.fontSize="8px";
				col3.style.fontFamily="微软雅黑";
				col3.appendChild(document.createTextNode(json[i].sender));
				col2.appendChild(col3);
				var col4 = document.createElement("br");
				col2.appendChild(col4);
				
				var col5 = document.createElement("span");
				col5.style.background="	#e3e3e3";
				col5.style.fontSize="10px";
				col5.style.fontFamily="微软雅黑";
				col5.style.cssFloat="left";
				col5.style.height="20px";
				col5.style.fontWeight="bold";
				col5.style.lineHeight="20px";

				col5.appendChild(document.createTextNode(json[i].content));
				col2.appendChild(col5);
				col.appendChild(col2);

				content.appendChild(col);
				col.style.clear="left";
				keep();

				}
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

function sendMessage(ownNumber,friendNumber) {
	xmlHttp = createXMLHttp();
	xmlHttp.onreadystatechange = getResult;
	xmlHttp.open("post", "onLoadChat?userName="+ownNumber+"&&friendNumber="+friendNumber+"&&act=onload", true);
	xmlHttp.send(null);
}

function getLocalTime(){
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
	    var hour = date1.getHours() ;  
	    var minites = date1.getMinutes();  
	    var seconds = date1.getSeconds();
	   
	    if (minites >= 0 && minites <= 9) {  
	    	minites = "0" + minites;  
	    } 
	    if (seconds >= 0 && seconds <= 9) {  
	    	seconds = "0" + seconds;  
	    } 
	     LocalTime  = date1.getFullYear() + seperator1 + month + seperator1 + 
	    strDate+" "+hour +seperator2+minites+seperator2
	    +seconds;
	     return LocalTime;
}
function getResult() {
	if (xmlHttp && xmlHttp.readyState == 4 && xmlHttp.status == 200) {
		
		var content = document.getElementById("chatview");
		var json = JSON.parse(xmlHttp.responseText);
		if(json.length > 0){
			for(var i = 0 ; i < json.length;i++){
				var col = document.createElement("div");
				col.style.width="225px";

				var col1 =  document.createElement("div");
				col1.style.cssFloat="left";
				col1.innerHTML='<img src="image/head.jpg" height="25" width="25" class="img-circle"/>';
				col.appendChild(col1);
				
				var col2 = document.createElement("div");
				

				var col3 = document.createElement("span");
				col3.style.fontSize="8px";
				col3.style.fontFamily="微软雅黑";
				col3.appendChild(document.createTextNode(json[i].sender));
				col2.appendChild(col3);
				var col4 = document.createElement("br");
				col2.appendChild(col4);
				
				var col5 = document.createElement("span");
				col5.style.background="	#e3e3e3";
				col5.style.fontSize="10px";
				col5.style.fontFamily="微软雅黑";
				col5.style.cssFloat="left";
				col5.style.height="20px";
				col5.style.fontWeight="bold";
				col5.style.lineHeight="20px";

				col5.appendChild(document.createTextNode(json[i].content));
				col2.appendChild(col5);
				col.appendChild(col2);

				content.appendChild(col);
				col.style.clear="left";
				keep();

			}
		}
		var a = document.getElementById("head_right1").value;
		getLocalTime();
		setInterval(function(){getMessage(a,LocalTime)},5000);
	}
}
function closeFunction(){
	this.window.close();
}
//用于获取编辑文本框中内容并设置为空，也就是清空文本框
function cancel(){
	 CKEDITOR.instances.TextArea1.setData("");
}

function switchchat(a,b){
	
	document.getElementById("chatFriend").innerHTML=b;
	var c = document.getElementById("head_right1").value;
	document.getElementById("chatview").innerHTML="";
	document.getElementById("friendQq").value=a;
	sendMessage(c,a);

}


function send(a,b){
	var sendMessage =CKEDITOR.instances.TextArea1.document.getBody().getText();
	if(sendMessage == ""){
		alert("发送内容不能为空！");
	}else{
		var chatView = document.getElementById("chatview");
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
	    var hour = date1.getHours() ;  
	    var minites = date1.getMinutes();  
	    var seconds = date1.getSeconds();
	   
	    if (minites >= 0 && minites <= 9) {  
	    	minites = "0" + minites;  
	    } 
	    if (seconds >= 0 && seconds <= 9) {  
	    	seconds = "0" + seconds;  
	    } 
	    var date = date1.getFullYear() + seperator1 + month + seperator1 + 
	    strDate+" "+hour +seperator2+minites+seperator2
	    +seconds;
		var friendNumber = document.getElementById("friendQq").value;
		cancel();
		
		
		var col = document.createElement("div");
		col.style.width="225px";

		var col1 =  document.createElement("div");
		col1.style.cssFloat="left";
		col1.innerHTML='<img src="image/head.jpg" height="25" width="25" class="img-circle"/>';
		col.appendChild(col1);
		
		var col2 = document.createElement("div");
		

		var col3 = document.createElement("span");
		col3.style.fontSize="8px";
		col3.style.fontFamily="微软雅黑";
		col3.appendChild(document.createTextNode(a));
		col2.appendChild(col3);
		var col4 = document.createElement("br");
		col2.appendChild(col4);
		
		var col5 = document.createElement("span");
		col5.style.background="	#e3e3e3";
		col5.style.fontSize="10px";
		col5.style.fontFamily="微软雅黑";
		col5.style.cssFloat="left";
		col5.style.height="20px";
		col5.style.fontWeight="bold";
		col5.style.lineHeight="20px";

		col5.appendChild(document.createTextNode(sendMessage));
		col2.appendChild(col5);
		col.appendChild(col2);

		chatView.appendChild(col);
		col.style.clear="left";
		
		keep();
		
		
		xmlHttp = createXMLHttp();
		xmlHttp.open("post", "onLoadChat?ownNumber="+b+"&&friendNumber="+friendNumber+"&&act=save"+"", true);
		var param ="date="+date+"&content="+sendMessage;
		 xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlHttp.send(param);
	}
}

function keep(){
	var div = document.getElementById('chatview');
	div.scrollTop = div.scrollHeight;
}
<!--
function popup_display(x) {
	var popup_dragging = false;
	var popup_target;
	var popup_mouseX;
	var popup_mouseY;
	var popup_mouseposX;
	var popup_mouseposY;
	var popup_oldfunction;
	var win = window.open();
	for ( var i in x)
		win.document.write(i + ' = ' + x[i] + '<br>');
}
function popup_mousedown(e) {
	var ie = navigator.appName == "Microsoft Internet Explorer";
	if (ie && window.event.button != 1)
		return;
	if (!ie && e.button != 0)
		return;
	popup_dragging = true;
	popup_target = this['target'];
	popup_mouseX = ie ? window.event.clientX : e.clientX;
	popup_mouseY = ie ? window.event.clientY : e.clientY;
	if (ie)
		popup_oldfunction = document.onselectstart;
	else
		popup_oldfunction = document.onmousedown;
	if (ie)
		document.onselectstart = new Function("return false;");
	else
		document.onmousedown = new Function("return false;");
}
function popup_mousemove(e) {
	if (!popup_dragging)
		return;
	var ie = navigator.appName == "Microsoft Internet Explorer";
	var element = document.getElementById(popup_target);
	var mouseX = ie ? window.event.clientX : e.clientX;
	var mouseY = ie ? window.event.clientY : e.clientY;
	element.style.left = (element.offsetLeft + mouseX - popup_mouseX)
			+ 'px';
	element.style.top = (element.offsetTop + mouseY - popup_mouseY) + 'px';
	popup_mouseX = ie ? window.event.clientX : e.clientX;
	popup_mouseY = ie ? window.event.clientY : e.clientY;
}

function popup_mouseup(e) {
	if (!popup_dragging)
		return;
	popup_dragging = false;
	var ie = navigator.appName == "Microsoft Internet Explorer";
	var element = document.getElementById(popup_target);
	if (ie)
		document.onselectstart = popup_oldfunction;
	else
		document.onmousedown = popup_oldfunction;
}
function popup_exit(e) {
	var ie = navigator.appName == "Microsoft Internet Explorer";
	var element = document.getElementById(popup_target);
	popup_mouseup(e);
	element.style.visibility = 'hidden';
	element.style.display = 'none';
}
function update() {
	element = document.getElementById('popup');
	drag_element = document.getElementById('popup_drag');
	exit_element = document.getElementById('popup_exit');
	element.style.position = "absolute";
	element.style.visibility = "visible";
	element.style.display = "block";
	element.style.left = (document.documentElement.scrollLeft
			+ popup_mouseposX - 10)
			+ 'px';
	element.style.top = (document.documentElement.scrollTop
			+ popup_mouseposY - 10)
			+ 'px';
	drag_element['target'] = 'popup';
	drag_element.onmousedown = popup_mousedown;
	exit_element.onclick = popup_exit;
}
function popup_mousepos(e) {
	var ie = navigator.appName == "Microsoft Internet Explorer";
	popup_mouseposX = ie ? window.event.clientX : e.clientX;
	popup_mouseposY = ie ? window.event.clientY : e.clientY;
}
if (navigator.appName == "Microsoft Internet Explorer")
	document.attachEvent('onmousedown', popup_mousepos);
else
	document.addEventListener('mousedown', popup_mousepos, false);
if (navigator.appName == "Microsoft Internet Explorer")
	document.attachEvent('onmousemove', popup_mousemove);
else
	document.addEventListener('mousemove', popup_mousemove, false);
if (navigator.appName == "Microsoft Internet Explorer")
	document.attachEvent('onmouseup', popup_mouseup);
else
	document.addEventListener('mouseup', popup_mouseup, false);
-->	
</script>
</head>
<%
 String userName = request.getParameter("userName");
 Users user  = new UserService().searchUsers(userName);
 List<Users> users = new UserService().getAllUsers(user);
 request.setAttribute("users", users);
 request.setAttribute("userName", userName);
 request.setAttribute("user", user.getNickName());
%>
<body  class="container" onunload="checkLeave(${userName})">
<div id="friendList">
	<div id="head">
			<div >
				<img src="image/head.jpg" class="img-circle">
				<span id="head_right"><%=user.getNickName() %></span>
				<input type="hidden" id="head_right1" value="${userName}"/>
			</div>
	</div>
	<div>
			<input id="search" type="text" placeholder="搜索" />					
	</div>
	<div id="LG" class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<div class="tabbable" id="tabs-986427">
					<ul class="nav nav-tabs">
						<li class="active">
							<a href="#panel-987843" data-toggle="tab">好 友</a>
						</li>
						<li>
							<a href="#panel-616709" data-toggle="tab">会 话</a>
						</li>
					</ul>
				<div class="tab-content">
			<div class="tab-pane active" id="panel-987843">
				<c:forEach var="user" items="${users}">
					<div id="${user.userName}" onclick='switchchat("${user.userName}","${user.nickName}")' onmousedown="changeBackcolor('${user.userName}','1')"
					onMouseOut="changeBackcolor('${user.userName}','2')" onmouseover="changeBackcolor('${user.userName}','3')">
						<img src="image/head1.jpg" class="img-circle" >
							<span >${user.nickName}</span>
							<span>(离线)</span>
							
							<p style="padding-right:10px">
							<a href="#" onclick="update()"><span class="glyphicon glyphicon-pencil" ></span></a>
							<a href="friendManage?act=del&&userName='${user.userName}'" onclick="return confirm('确认要删除？删除后你将从对方联系人列表中消失，且以后不再接收此人的会话消息。');"><span class="glyphicon glyphicon-trash"  ></span></a>
							</p>
					</div>
				</c:forEach>
			</div>		
				<div class="tab-pane" id="panel-616709">
					<div onmouseover ="onselected('12')" id="12" onmouseout ="unselected(12)">
						<img src="image/head1.jpg" class="img-circle" >
					<span >幸福</span>
					<p>
					<span class="glyphicon glyphicon-pencil"></span>
					<span class="glyphicon glyphicon-trash"></span>
					</p>
				</div>
				</div>
				</div>
				</div>
				</div>	
				</div>
				</div>

		<div class="foot">
			<!--  <span class="glyphicon glyphicon-th-list" ></span>-->
			<span style="padding:2px 30px 0px 10px"><a href="add.jsp" target="_blank"><button class="littlebutton">添加好友</button></span></a>
			<span style="padding:2px 10px 0px 10px"><a href="Logout"><button class="littlebutton">退出登录</button></a></span>
		</div>
		</div>
	<!-- <div class="sample_popup" id="popup"
		style="visibility: hidden; display: none; width:250px; height:100px">
		<div class="menu_form_header" id="popup_drag">修改备注姓名</div>
		<div class="menu_form_body">
		<form method="post" action="">
				<table>
					<tr>
						<th>请输入备注姓名:</th>
					</tr>
					<tr>
						<th><input type="text"></th>
					</tr>
				</table>
						<input type="submit" value="确认">
						<input type="submit" value="取消">
		</form>
		</div>
	</div> -->
	<div id="Chatwindow">
	<div id="chatFriend">chat<span style="float:right">
<input type="button" class="littleButton" onclick="history()" value="聊天记录">&nbsp;&nbsp;</span>
</div>
<input type="hidden" id="friendQq" value=""/>
<div id="chatview" >

</div>

<form id="form1">
<textarea id="TextArea1" class="ckeditor" name="editor"></textarea>
<%--此处为自定义工具栏 --%>
<script type="text/javascript">CKEDITOR.replace('editor',{
	toolbar:
		[
			['Bold','Italic','Underline','Strike','Image','Smiley','SpecialChar','Font','FontSize','TextColor']
		]
	}
);
</script>
<div id="foot_left">
<span style="float:right;"><input type="button"  class="littleButton" value="清 除" onclick="cancel() ">&nbsp;&nbsp;&nbsp;
<input type="button" class="littleButton" value="发 送" onclick="send('${user}','${userName}')"></span>
</div>
</form>
</div>
</body>
</html>