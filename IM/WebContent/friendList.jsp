<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.entity.Users,com.service.UserService,java.util.*,com.service.UserService"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="bootstrap/js/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="bootstrap/js/bootstrap.js"></script>
<script type="text/javascript"
	src="http://www.francescomalagrino.com/BootstrapPageGenerator/3/js/jquery-2.0.0.min.js"></script>
<script type="text/javascript"
	src="http://www.francescomalagrino.com/BootstrapPageGenerator/3/js/jquery-ui"></script>
<link
	href="http://www.francescomalagrino.com/BootstrapPageGenerator/3/css/bootstrap-combined.min.css"
	rel="stylesheet" media="screen">
<script type="text/javascript"
	src="http://www.francescomalagrino.com/BootstrapPageGenerator/3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="otherjar/bootstrap.min.js"></script>
<script type="text/javascript" src="otherjar/bootstrapValidator.js"></script>
<script type="text/javascript" src="otherjar/html5.js"></script>
<script type="text/javascript" src="otherjar/jquery-ui.js"></script>
<script type="text/javascript" src="otherjar/jquery.nouislider.js"></script>
<script type="text/javascript" src="otherjar/jquery.nouislider.min.js"></script>
<script type="text/javascript" src="otherjar/respond.min.js"></script>
<script type="text/javascript" src="otherjar/zh_CN.js"></script>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
<link  rel="stylesheet" type="text/css" href="css/friendList.css"/>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="ckeditor/adapters/jquery.js"></script>
<script type="text/javascript" src="myjs/friendList.js"></script>
<title>Char.Mr</title>

</head>
<%
	String userName = request.getParameter("userName");
	Users user = new UserService().searchUsers(userName);
	List<Users> users = new UserService().getAllUsers(user);
	request.setAttribute("users", users);
	request.setAttribute("userName", userName);
	request.setAttribute("user", user.getNickName());
%>
<body class="container" onunload="checkLeave(${userName})">
	
	<div id="friendList">
		<div id="head">
			<div>
				<img src="image/head.jpg" class="img-circle"> <span
					id="head_right"><%=user.getNickName()%></span> <input type="hidden"
					id="head_right1" value="${userName}" />
			</div>
		</div>
		<div style="overflow-y: scroll">
			<input id="search" type="text" placeholder="搜索" />

			<div id="LG" class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<div class="tabbable" id="tabs-986427">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#panel-987843"
									data-toggle="tab">好 友</a></li>
								<li><a href="#panel-616709" data-toggle="tab">会 话</a></li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane active" id="panel-987843">
									<c:forEach var="user" items="${users}">
										<div id="${user.userName}"
											onDblclick='switchchat("${user.userName}","${user.nickName}")'
											onmousedown="changeBackcolor('${user.userName}','1')"
											onMouseOut="changeBackcolor('${user.userName}','2')"
											onmouseover="changeBackcolor('${user.userName}','3')">
											<img src="image/head1.jpg" class="img-circle"> 
											<span>${user.nickName}</span>
											<span>(在线)</span>

											<p id="isDelete">
												<a
													onclick='deletefriend("${user.userName}","${userName}")'><span
													class="glyphicon glyphicon-trash"></span></a>
												<!--   <a href='DeleteFriends?accountnumber=${user.userName}'><span class="glyphicon glyphicon-trash"></span></a>-->
											</p>
										</div>
									</c:forEach>
								</div>
								<div class="tab-pane" id="panel-616709">
									<div onmouseover="onselected('12')" id="12"
										onmouseout="unselected(12)">
										<img src="image/head1.jpg" class="img-circle"> <span>幸福</span>
										<p>
											<span class="glyphicon glyphicon-pencil"></span> <span
												class="glyphicon glyphicon-trash"></span>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="foot">

			<!--  <span class="glyphicon glyphicon-th-list" ></span>-->
			<!-- <span style="padding:2px 30px 0px 10px"><button class="littlebutton" data-toggle="modal" data-target="#mymodal">添加好友</button></span> -->
			<span style="padding: 2px 10px 0px 10px"><button
					class="littlebutton" onclick="add('${userName}')">添加好友</button></span> <span
				style="padding: 2px 10px 0px 10px"><a href="Logout"><button
						class="littlebutton">退出登录</button></a></span>

		</div>
	</div>
	
	<div id="Chatwindow">
		<div id="chatFriend">
			chat
		</div>
		<input type="hidden" id="friendQq" value="" />
		<div id="chatview"></div>		
		<div><span style="float:right;margin-right:-8px"><button id = "cleanhistory" class="littleButton1" onclick="cleanHistory()">清除聊天记录</button>&nbsp;&nbsp;</span>
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
				<span style="float: right;"><input type="button"
					class="littleButton" value="清 除" onclick="cancel() ">&nbsp;&nbsp;&nbsp;
					<input type="button" class="littleButton" value="发 送"
					onclick="send('${user}','${userName}')"></span>
			</div>
		</form>
	</div>
</body>
</html>