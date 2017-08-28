<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>添加</title>
<head>
<style type="text/css">
.menu_form_header {
	width: 450px;
	background-color: lightblue;
}

.menu_form_body {
	border: 1px solid black;
	width: 450px;
	margin-left: 400px;
	margin-top: 200px;
}
</style>
<script type="text/javascript"
	src="http://www.francescomalagrino.com/BootstrapPageGenerator/3/js/jquery-2.0.0.min.js"></script>
<link href="bootstrap/css/bootstrap-combined.min.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript"
	src="http://www.francescomalagrino.com/BootstrapPageGenerator/3/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function closeFunction() {
		this.window.close();
	}
</script>
</head>
<body>
	<div class="menu_form_body">
		<div class="menu_form_header">
			添加
			<div style="float: right">
				<img src="#" onclick="closeFunction()" value="关 闭">
			</div>
		</div>
		<div id="LG" class="container-fluid">
			<ul class="nav nav-tabs">
				<li class="active"><a data-toggle="tab" href="#panel-301425">找人</a>
				</li>
				<li><a data-toggle="tab" href="#panel-915635">找群</a></li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane active" id="panel-301425">
					<form method="post" action="">
						<table>
							<tr>
								<th><input type="text"><input type="checkbox" name="ck">在线
								<input type="submit" value="确认"></th>
							</tr>
						</table>
					</form>
				</div>
				<div class="tab-pane" id="panel-915635">
					<form method="post" action="">
						<table>
							<tr>
								<th><input type="text"><input type="submit"
									value="确认"></th>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>