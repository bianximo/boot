<%@page import="myutils.OnlineCounter"%>
<%@ page language="java" import="java.util.*,entity.Message"
	pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>学生信息管理系统</title>

<!-- Bootstrap Core CSS -->
<link href="../bower_components/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="../bower_components/metisMenu/dist/metisMenu.min.css"
	rel="stylesheet">

<!-- Timeline CSS -->
<link href="../dist/css/timeline.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="../dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="../bower_components/morrisjs/morris.css" rel="stylesheet">

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
	<div class="modal fade" id="sendMessage" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content col-md-10">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">发送新消息</h4>
				</div>

				<form action="<%=path%>/messages/Messages_send.action" method="post">
					<br>
					<div class="form-group">
						<label>收信人：</label> <input class="form-control" name="receiveName"
							type="text">
					</div>
					<div class="form-group">
						<label>内容：</label>
						<textarea class="form-control" name="data" rows="3"></textarea>
					</div>
					<br>
					<div class="modal-footer">

						<input id="stumodify" type="submit" class="btn btn-primary"
							onclick="javascript: return alert('消息发送成功！')" value="发送">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="<%=path%>/pages/index.jsp">欢迎用户<font
					color="#2B6FD5">${sessionScope.loginName}</font>使用学生信息管理系统
				</a>
			</div>
			<!-- /.navbar-header -->

			<ul class="nav navbar-top-links navbar-right">
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i
						class="fa fa-envelope fa-fw"></i> <i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-messages">
						<li><a href="#">
								<div>
									<strong>John Smith</strong> <span class="pull-right text-muted">
										<em>Yesterday</em>
									</span>
								</div>
								<div>Lorem ipsum dolor sit amet, consectetur adipiscing
									elit. Pellentesque eleifend...</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<strong>John Smith</strong> <span class="pull-right text-muted">
										<em>Yesterday</em>
									</span>
								</div>
								<div>Lorem ipsum dolor sit amet, consectetur adipiscing
									elit. Pellentesque eleifend...</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<strong>John Smith</strong> <span class="pull-right text-muted">
										<em>Yesterday</em>
									</span>
								</div>
								<div>Lorem ipsum dolor sit amet, consectetur adipiscing
									elit. Pellentesque eleifend...</div>
						</a></li>
						<li class="divider"></li>
						<li><a class="text-center" href="#"> <strong>所有信息</strong>
								<i class="fa fa-angle-right"></i>
						</a></li>
					</ul> <!-- /.dropdown-messages --></li>
				<!-- /.dropdown -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-tasks fa-fw"></i>
						<i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-tasks">
						<li><a href="#">
								<div>
									<p>
										<strong>事务一</strong> <span class="pull-right text-muted">完成40%</span>
									</p>
									<div class="progress progress-striped active">
										<div class="progress-bar progress-bar-success"
											role="progressbar" aria-valuenow="40" aria-valuemin="0"
											aria-valuemax="100" style="width: 40%">
											<span class="sr-only">40% Complete (success)</span>
										</div>
									</div>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<p>
										<strong>事务2</strong> <span class="pull-right text-muted">完成20%</span>
									</p>
									<div class="progress progress-striped active">
										<div class="progress-bar progress-bar-info" role="progressbar"
											aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"
											style="width: 20%">
											<span class="sr-only">20% Complete</span>
										</div>
									</div>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<p>
										<strong>事务3</strong> <span class="pull-right text-muted">完成60%</span>
									</p>
									<div class="progress progress-striped active">
										<div class="progress-bar progress-bar-warning"
											role="progressbar" aria-valuenow="60" aria-valuemin="0"
											aria-valuemax="100" style="width: 60%">
											<span class="sr-only">60% Complete (warning)</span>
										</div>
									</div>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<p>
										<strong>事务4</strong> <span class="pull-right text-muted">完成80%</span>
									</p>
									<div class="progress progress-striped active">
										<div class="progress-bar progress-bar-danger"
											role="progressbar" aria-valuenow="80" aria-valuemin="0"
											aria-valuemax="100" style="width: 80%">
											<span class="sr-only">80% Complete (danger)</span>
										</div>
									</div>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a class="text-center" href="#"> <strong>所有事务</strong>
								<i class="fa fa-angle-right"></i>
						</a></li>
					</ul> <!-- /.dropdown-tasks --></li>
				<!-- /.dropdown -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-bell fa-fw"></i>
						<i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-alerts">
						<li><a href="#">
								<div>
									<i class="fa fa-comment fa-fw"></i> New Comment <span
										class="pull-right text-muted small">4 minutes ago</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<i class="fa fa-twitter fa-fw"></i> 3 New Followers <span
										class="pull-right text-muted small">12 minutes ago</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<i class="fa fa-envelope fa-fw"></i> Message Sent <span
										class="pull-right text-muted small">4 minutes ago</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<i class="fa fa-tasks fa-fw"></i> New Task <span
										class="pull-right text-muted small">4 minutes ago</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<i class="fa fa-upload fa-fw"></i> Server Rebooted <span
										class="pull-right text-muted small">4 minutes ago</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a class="text-center" href="#"> <strong>所有系统消息</strong>
								<i class="fa fa-angle-right"></i>
						</a></li>
					</ul> <!-- /.dropdown-alerts --></li>
				<!-- /.dropdown -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
						<i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-user">
						<li><a href="#"><i class="fa fa-user fa-fw"></i>用户</a></li>
						<li><a href="<%=path%>/pages/userConfig.jsp"><i
								class="fa fa-gear fa-fw"></i>设置</a></li>
						<li class="divider"></li>
						<li><a href="<%=path%>/users/Users_logout.action"> <i
								class="fa fa-sign-out fa-fw"></i>退出登录
						</a></li>
					</ul> <!-- /.dropdown-user --></li>
				<!-- /.dropdown -->
			</ul>
			<!-- /.navbar-top-links -->

			<div class="navbar-default sidebar" role="navigation">
				<div class="sidebar-nav navbar-collapse">
					<ul class="nav" id="side-menu">
						<li class="sidebar-search">
							<div class="input-group custom-search-form">
								<input type="text" class="form-control" placeholder="搜索...">
								<span class="input-group-btn">
									<button class="btn btn-default" type="button">
										<i class="fa fa-search"></i>
									</button>
								</span>
							</div> <!-- /input-group -->
						</li>
						<li><a href="/boot/pages/index.jsp"><i
								class="fa fa-dashboard fa-fw"></i> 公告</a></li>
						<li><a href="#"><i class="fa fa-gears fa-fw"></i> 学生信息管理<span
								class="fa arrow"></span></a>

							<ul class="nav nav-second-level">
								<li><a href="<%=path%>/pages/addStu.jsp"><i
										class="fa fa-plus fa-fw"></i> 增加学生信息</a></li>
								<li><a href="<%=path%>/students/Students_query.action"><i
										class="fa fa-table fa-fw"></i> 查询学生信息</a></li>

							</ul> <!-- /.nav-second-level --></li>


						<li><a href="#"><i class="fa fa-child fa-fw"></i> 学生成绩管理<span
								class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a href="#"><i class="fa fa-pencil fa-fw"></i> 录入成绩</a></li>
								<li><a href="#"><i class="fa fa-paw fa-fw"></i> 查询成绩</a></li>
								<li><a href="#"><i class="fa fa-download fa-fw"></i>
										打印成绩单</a></li>

							</ul> <!-- /.nav-second-level --></li>
						<li><a href="<%=path%>/messages/Messages_query.action"><i
								class="fa fa-comments-o fa-fw"></i>消息系统</a>
						<li><a href="<%=path%>/pages/userConfig.jsp"><i
								class="fa fa-wrench fa-fw"></i>用户设置</a></li>


					</ul>
				</div>
				<!-- /.sidebar-collapse -->
			</div>
			<!-- /.navbar-static-side -->
		</nav>

		<div id="page-wrapper">
			<div class="row">
				<br>
			</div>
			<!-- /.row -->
			<div class="col-lg-5 ">
				<div class="panel panel-default">
					<div class="panel-heading">
						<i class="fa fa-bell fa-fw"></i>收件箱
					</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<div class="list-group">
							<s:iterator value="#session.receiveList" var="receive">
								<a href="#" class="list-group-item"> <i
									class="fa fa-comment fa-fw"></i> <s:property
										value="#receive.getShortMessage()" /><span
									class="pull-right text-muted small"><em><s:date
												name="#receive.date" format="MM-dd hh:mm" /></em> </span>
								</a>
							</s:iterator>
						</div>
						<!-- /.list-group -->

					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-5 -->

			<div class="col-lg-5">
				<div class="panel panel-default">
					<div class="panel-heading">
						<i class="fa fa-bell fa-fw"></i>发件箱
					</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<div class="list-group">
							<s:iterator value="#session.sendList" var="send">
								<a href="#" class="list-group-item"> <i
									class="fa fa-envelope fa-fw"></i> <s:property
										value="#send.getShortMessage()" /><span
									class="pull-right text-muted small"><em><s:date
												name="#send.date" format="MM-dd hh:mm" /></em> </span>
								</a>
							</s:iterator>
						</div>
						<!-- /.list-group -->

					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-5 -->
			<div class="col-lg-10">
				<a href="<%=path%>/messages/Messages_query.action"
					class="btn btn-primary btn-outline col-md-offset-2 col-md-2">更&nbsp;&nbsp;新</a>
				<a data-toggle="modal" data-target="#sendMessage"
					class="btn btn-primary btn-outline col-md-offset-4 col-md-2">发送新消息</a>
			</div>
		</div>
	</div>
	<!-- jQuery -->
	<script src="../bower_components/jquery/dist/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="../bower_components/metisMenu/dist/metisMenu.min.js"></script>

</body>

</html>
