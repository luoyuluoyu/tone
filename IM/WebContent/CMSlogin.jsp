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
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/common.css" />
<link rel="stylesheet" type="text/css" href="css/slide.css" />
<link
	href="https://cdn.bootcss.com/bootstrap-validator/0.5.3/css/bootstrapValidator.css"
	rel="stylesheet">
<link
	href="https://cdn.bootcss.com/bootstrap-validator/0.5.3/css/bootstrapValidator.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/flat-ui.min.css" />
<link rel="stylesheet" type="text/css" href="css/jquery.nouislider.css">
<link type="text/css" rel="stylesheet" href="css/bootstrapValidator.css" />
<title>Mr.Char后台管理界面</title>
<style type="text/css">
.asd{
line-height: 40px;
    height: 40px;
    color: #aab1b7;
    cursor: pointer;
}
    
</style>
</head>
<body>

	<script src="js/html5.js"></script>
	<script src="js/respond.min.js"></script>
	<script src="js/jquery.nouislider.js"></script>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery-ui.js"></script>
	<script src="js/jquery.nouislider.min.js"></script>
	<script src="js/bootstrapValidator.js"></script>
	<script type="text/javascript" src="management.js"></script>


	<%
		List<Users> users = new UserService().getAllUsers();
		int num = new UserService().pagingnum();
		request.setAttribute("users", users);
		request.setAttribute("num", num);
	%>
	<div id="wrap">
		<!-- 左侧菜单栏目块 -->
		<div class="leftMeun" id="leftMeun">
			<div id="logoDiv">
				<p id="logoP">
					<img id="logo" alt="左右结构项目" src="images/logo.png"><span>Char.Mr后台管理</span>
				</p>
			</div>
			<div id="personInfor">
				
				<p id="userName">大飞</p>
				<p>
					<span >http://localhost:8040/后台管理1/index.jsp#</span> <a
						href="http://www.mycodes.net/" target="_blank">Char所欲言</a>
				</p>
				<p>
					<a href="#">退出登录</a>
				</p>
			</div>
			<div class="meun-title">账号管理</div>

			<div class="meun-item" href="#user" aria-controls="user" role="tab"
				data-toggle="tab">
				<img src="images/icon_user_grey.png">用户管理
			</div>
			<div class="meun-item" href="#chan" aria-controls="chan" role="tab"
				data-toggle="tab">
				<img src="images/icon_change_grey.png">修改密码
			</div>

		</div>
		<!-- 右侧具体内容栏目 -->
		<div id="rightContent">
			<a class="toggle-btn" id="nimei"> <i
				class="glyphicon glyphicon-align-justify"></i>
			</a>
			<!-- Tab panes -->
			<div class="tab-content">

				<!--用户管理模块-->
				<div role="tabpanel" class="tab-pane" id="user">
					<div class="check-div form-inline">
						<div class="col-xs-3">
							<button class="btn btn-yellow btn-xs" data-toggle="modal"
								data-target="#addUser" id="Refresh">刷新</button>
						</div>
						<div class="col-xs-4">
							<input type="text" class="form-control input-sm"
								placeholder="输入文字搜索" id="query">
							<button class="btn btn-white btn-xs " id="button_btn">查
								询</button>
						</div>
					
					</div>

					<div class="data-div" id="content">
						<div class="row tableHeader" id="as">
							<div class="col-xs-1 ">客户编码</div>
							<div class="col-xs-2">账号</div>
							<div class="col-xs-2">呢称</div>
							<div class="col-xs-1">性别</div>
							<div class="col-xs-2">电话</div>
							<div class="col-xs-2">出生日期</div>
							<div class="col-xs-2">操作</div>
						</div>
						<div class="tablebody">

							<div class="row" id="aaa">
								<c:forEach var="user" items="${users }">
									<div class="col-xs-1">${user.id }</div>
									<div class="col-xs-2 ">${user.userName }</div>
									<div class="col-xs-2">${user.nickName }</div>
									<div class="col-xs-1">${user.gender }</div>
									<div class="col-xs-2">${user.telephoneNumber}</div>
									<div class="col-xs-2">${user.birthday}</div>
									<div class="col-xs-2">
										<button class="btn btn-success btn-xs" data-toggle="modal"
											data-target="#reviseUser" data-param="${user.id }" data-param2="${user.userName }">修改</button>
										<button class="btn btn-danger btn-xs" data-toggle="modal"
											data-target="#deleteUser" data-param="${user.userName }">删除</button>
										<button class="btn btn-danger btn-xs" data-toggle="modal"
											data-target="#Chatlog" data-param="${user.userName }">好友</button>
									</div>
								</c:forEach>
							</div>

						</div>
					</div>

					<!--页码块-->
					<footer class="footer">
					<ul class="pagination">
						<li>跳转</li>
						<li><input type="text" id="pagingnum" style="height: 25px;width: 40px"></li>
						共<li class="gray" id="paging">${num }</li>页
						<li class="gray" id="pag">当前：1</li>
						<li><a class="glyphicon glyphicon-menu-left" id="forward" style="height: 20px"> </a></li>
						<li><a class="glyphicon glyphicon-menu-right" id="next" style="height: 20px"> </a></li>
					</ul>
					</footer>

					<!--弹出修改用户窗口-->
					<div class="modal fade" id="reviseUser" role="dialog"
						aria-labelledby="gridSystemModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="gridSystemModalLabel">修改用户</h4>
								</div>
								<div class="modal-body">
									<div class="container-fluid">
										<form class="form-horizontal" id="formone">
											<div class="form-group ">
												<label for="sName" class="col-xs-3 control-label">账号：</label>
												<div class="col-xs-8 " id="usernameshow">
												</div>
											</div>
											<div class="form-group">
												<label for="sLink" class="col-xs-3 control-label">昵称：</label>
												<div class="col-xs-8 ">
													<input type="" class="form-control input-sm" id="sLink"
														placeholder="" style="width: 200px">
												</div>
											</div>
											<div class="form-group">
												<label for="sOrd" class="col-xs-3 control-label">性别：</label>
												<div class="col-xs-8">
													<div class="radio" id="gender">
														<label style="margin: 0px 40px 0px 0px"> <input
															type="radio" name="gender" value="男" /> 男
														</label> <label> <input type="radio" name="gender"
															value="女" />女
														</label>
													</div>
												</div>
											</div>
											<div class="form-group">
												<label for="sKnot" class="col-xs-3 control-label">电话：</label>
												<div class="col-xs-8">
													<input type="" class="form-control input-sm" id="sKnot"
														placeholder="" style="width: 200px">
												</div>
											</div>
											<div class="form-group">
												<label for="sKnot" class="col-xs-3 control-label">生日：</label>
												<div class="col-xs-8">
													<input type="" class="form-control input-sm" id="sbnot"
														placeholder="" style="width: 200px">
												</div>
											</div>
											<div class="form-group">
												<label for="sKnot" class="col-xs-3 control-label">权限：</label>
												<div class="col-xs-8">
													<input type="" class="form-control input-sm" id="sqnot"
														placeholder="1为在线  2为已下线  3为禁用" style="width: 200px">
												</div>
											</div>

										</form>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-xs btn-xs btn-white"
										data-dismiss="modal">取 消</button>
									<button type="button" class="btn btn-xs btn-green "
										id="updataook" data-dismiss="modal">保 存</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.modal -->

					<!--弹出删除用户警告窗口-->
					<div class="modal fade" id="deleteUser" role="dialog"
						aria-labelledby="gridSystemModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
								</div>
								<div class="modal-body">
									<div class="container-fluid" id="delTipContainer">
										确定要删除该用户？删除后不可恢复！</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-xs btn-white"
										data-dismiss="modal">取 消</button>
									<button type="button" id="button_footer"
										class="btn btn-green btn-xs" data-dismiss="modal">删除</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.modal -->
				</div>

				<!-- 好友聊天记录窗 -->
				<div class="modal fade" id="Chatlog" role="dialog"
					aria-labelledby="gridSystemModalLabel">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="gridSystemModalLabel">信息管理器</h4>
							</div>
							<div class="modal-body">
								<div  id="friendlist" style="float: left; height: 400px; overflow: scroll; width: 200px ">
									<p>好友列表</p>
									<c:forEach var="user" items="${users}">
										<div class="asd" id="${user.userName}" 
										onmousedown="changeBackcolor('${user.userName}','1')"
										onMouseOut="changeBackcolor('${user.userName}','2')" 
										onmouseover="changeBackcolor('${user.userName}','3')"
										onclick=" ">
											<img src="images/icon_change_grey.png" data-toggle="modal"
												data-target="#xinxi" id="Personalinformationdisplay">
												<span>${user.nickName }</span>
										</div>
										<input type="hidden" id="username" value="${user.userName }">
									</c:forEach>
								</div>
								<div style="height: 400px; overflow: scroll;">
								<p style="text-align:center">聊天记录</p>
								<div id="charbody">
								<p>Char   2015.12.1</p>
								<p>你和好友的聊天记录，好友的信息</p>
								</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" id="button_footer"
									class="btn btn-green btn-xs" data-dismiss="modal">返回</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>

				<!-- 好友信息 -->
				<div class="modal fade" id="xinxi" role="dialog"
					aria-labelledby="gridSystemModalLabel">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="gridSystemModalLabel">好友资料</h4>
							</div>
							<div class="modal-body">
							<div id="information">
								
								</div>
							</div>
							<div class="modal-footer">
								
								<button type="button" id="button_footer"
									class="btn btn-green btn-xs" data-dismiss="modal">返回</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>


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

			</div>
</body>
</html>