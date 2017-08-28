<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.util.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
body{
width:97%;
height:100%;
margin:20px;
}
#chatFriend
{
	width:100%;
	height:7%;
	text-align:center;
	vertical-align:middle;
	font-size:20px;
	background-color:lightblue;
}
#chatview
{
	width:100%;
	height:70%;
	float:right;
	overflow-y: scroll;
  	overflow-x: hidden;
}
.littleButton
{
	
	height:27px;
	font-size:16px;
	color:green;
	border-top-left-radius: 10px;
    border-top-right-radius: 10px;
	border-bottom-left-radius: 10px;
	border-bottom-right-radius: 10px;
    border: 1px solid #000;
   	
}
#TextArea1
{
	width:100%;
	height:5%;	
}
.chat-thread {
  margin: 20px auto 0 5px;
  padding: 0 20px 0 0;
  position: relative;
  display:block;
  background-color: rgba(25, 147, 147, 0.2);
}

#Chatwindow{
height:70%;
width:100%;
background-color:lightblue;
}
#foot_left{
height:6%;
background-color:lightblue;

}
</style>
<title>聊天中</title>
<script src="ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="/ckeditor/adapters/jquery.js"></script>
<script>
function closeFunction(){
	this.window.close();
}
//用于获取编辑文本框中内容并设置为空，也就是清空文本框
function cancel(){
	 CKEDITOR.instances.TextArea1.setData("");
}
function send(form){
	var sendMessage = CKEDITOR.instances.TextArea1.getData();
	if(sendMessage == ""){
		alert("发送内容不能为空！");
		return false;
	}else{
		return true;
	}
}
	function onselected(a){
		var number = document.getElementById(a);
		number.style.backgroundColor="gray";
	}
function unselected(a){
	var number = document.getElementById(a);
	number.style.backgroundColor="lightblue";
}
</script>
</head>
<body>
<div id="Chatwindow">
	<div id="chatFriend">聊天好友名<span style="float:right;vertical-align:middle;">
<input type="button" class="littleButton" onclick="history()" value="聊天记录">&nbsp;&nbsp;&nbsp;
<input type="button" class="littleButton" onclick="closeFunction()" value="关 闭"></span></div>
<div id="chatview">
<div class="chat-thread">
<%=new Date().getHours() + ":" +  new Date().getMinutes() %>
<%=request.getAttribute("sendMessage") %>
</div>
</div>
<form id="form1" action="Chat" method="post" onsubmit="return send(this)" target="_blank">
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
<input type="submit" class="littleButton" value="发 送"></span>
</div>
</form>
</div>
</body>
</html>