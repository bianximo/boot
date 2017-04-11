<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	Cookie[]cookies = request.getCookies();
	String username="",password="";
	String ischecked = "";
	if(cookies!=null){
		for(int i=0;i<cookies.length;i++){
			if(cookies[i].getName().equals("check"))ischecked = "checked";
			if(cookies[i].getName().equals("username"))username = cookies[i].getValue();
			if(cookies[i].getName().equals("password"))password = cookies[i].getValue();
		}
	}
%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">



<title>用户登录</title>

<!-- Bootstrap Core CSS -->
<link href="../bower_components/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="../bower_components/metisMenu/dist/metisMenu.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="../dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="../bower_components/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">请填写注册信息</h4>
				</div>
				<form action="<%=path%>/users/Users_regist.action" method="post">
				<div class="modal-body">
						<div class="form-group">
							<label>用户id：</label> <input class="form-control" name="username">
							<label>用户密码：</label> <input class="form-control" name="password">
						</div>
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<input type="submit" class="btn btn-primary" value="注册">
				</div>
				</form>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">请登录学生信息管理系统</h3>
					</div>
					<div class="panel-body">
						<form role="form" name="loginForm"
							action="<%=path%>/users/Users_login.action" method="post">
							<fieldset>
								<div class="form-group">
									<input class="form-control" value="<%=username %>" placeholder="用户名" name="username"
										autofocus>
								</div>
								<div class="form-group">
									<input class="form-control" value="<%=password %>"placeholder="密码" name="password"
										type="password">
								</div>
								<div class="checkbox">
									<label> <input name="remember" type="checkbox" checked="<%=ischecked %>"
										value="true">记住我
									</label>
								</div>
								<!-- Change this to a button or input when using this as a form -->
								<input type="submit" class="btn btn-lg btn-success btn-block"
									value="登录">
								<button type="button" class="btn btn-primary btn-lg btn-block"
									data-toggle="modal" data-target="#myModal">注册</button>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- jQuery -->
	<script src="../bower_components/jquery/dist/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="../bower_components/metisMenu/dist/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="../dist/js/sb-admin-2.js"></script>

</body>

</html>
