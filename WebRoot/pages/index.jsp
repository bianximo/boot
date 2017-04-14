<%@page import="myutils.OnlineCounter"%>
<%@ page language="java" import="java.util.*,entity.Message"
	pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
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
	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
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
						<s:iterator value="#session.newMessage" var="message" status="L">
							<li><a
								href="#">
									<div>
										<strong><s:property value="#message.sendName" /></strong> <span
											class="pull-right text-muted"> <em><s:date
													format="MM-dd hh:mm" name="#message.date" /></em>
										</span>
									</div>
									<div>
										<s:property value="#message.getShortMessage()" />
									</div>
							</a></li>
							<li class="divider"></li>
						</s:iterator>
						<li><a class="text-center" href="<%=path%>/messages/Messages_query.action"> <strong>所有信息</strong>
								<i class="fa fa-angle-right"></i>
						</a></li>
					</ul> <!-- /.dropdown-messages --></li>
				<!-- /.dropdown -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-tasks fa-fw"></i>
						<i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-tasks">
						<li><a href="<%=path%>/messages/Messages_query.action">
								<div>
									<i class="fa fa-comment fa-fw"></i>消息系统<span
										class="pull-right text-muted small">内部邮件通讯</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="<%=path%>/students/Students_query.action">
								<div>
									<i class="fa fa-search fa-fw"></i>查询系统<span
										class="pull-right text-muted small">查询所有学生</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="<%=path%>/pages/addStu.jsp">
								<div>
									<i class="fa fa-plus fa-fw"></i>注册系统<span
										class="pull-right text-muted small">添加新的学生</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<i class="fa fa-child fa-fw"></i>成绩系统<span
										class="pull-right text-muted small">操作学生成绩</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="<%=path%>/pages/userConfig.jsp">
								<div>
									<i class="fa fa-wrench fa-fw"></i>用户设置<span
										class="pull-right text-muted small">修改你的用户信息</span>
								</div>
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
								class="fa fa-wrench fa-fw"></i>用户设置</a> 
						<li><a href="<%=path%>/pages/shermo.jsp"><i
								class="fa fa-qq fa-fw"></i>关于我</a>
								<!-- 
							<ul class="nav nav-second-level">
							
								<li><a href="panels-wells.jsp">Panels and Wells</a></li>
								<li><a href="buttons.jsp">Buttons</a></li>
								<li><a href="notifications.jsp">Notifications</a></li>
								<li><a href="typography.jsp">Typography</a></li>
								<li><a href="icons.jsp"> Icons</a></li>
								<li><a href="grid.jsp">Grid</a></li>
							</ul> /.nav-second-level --></li>



					</ul>
				</div>
				<!-- /.sidebar-collapse -->
			</div>
			<!-- /.navbar-static-side -->
		</nav>

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">公告</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-comments fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge">${session.noreadMessage}</div>
									<div>未读消息</div>
								</div>
							</div>
						</div>
						<a href="<%=path%>/messages/Messages_query.action">
							<div class="panel-footer">
								<span class="pull-left">查看</span> <span class="pull-right"><i
									class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-green">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-tasks fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge">${applicationScope.stuNum}</div>
									<div>学生数量</div>
								</div>
							</div>
						</div>
						<a href="<%=path%>/students/Students_query.action">
							<div class="panel-footer">
								<span class="pull-left">查询</span> <span class="pull-right"><i
									class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>

				<!-- <div class="col-lg-3 col-md-6">
					<div class="panel panel-yellow">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-shopping-cart fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge">124</div>
									<div>New Orders!</div>
								</div>
							</div>
						</div>
						<a href="#">
							<div class="panel-footer">
								<span class="pull-left">View Details</span> <span
									class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div> -->

				<div class="col-lg-3 col-md-6">
					<div class="panel panel-yellow">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-user fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge">${applicationScope.numSessions}</div>
									<div>当前在线用户数</div>
								</div>
							</div>
						</div>
						<a href="<%=path%>/pages/userConfig.jsp">
							<div class="panel-footer">
								<span class="pull-left">用户</span> <span class="pull-right"><i
									class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>
			</div>
			<!-- /.row -->

			<div class="row clearfix">
				<div class="col-md-9 ">
					<div class="carousel slide" id="carousel-643475">
						<ol class="carousel-indicators">
							<li class="active" data-slide-to="0"
								data-target="#carousel-643475"></li>
							<li data-slide-to="1" data-target="#carousel-643475"></li>
							<li data-slide-to="2" data-target="#carousel-643475"></li>
						</ol>
						<div class="carousel-inner">
							<div class="item active">
								<img alt="" src="../img/default.jpg" />
								<div class="carousel-caption">
									<h4>Bootstrap</h4>
									<p>Bootstrap，来自 Twitter，是目前很受欢迎的前端框架。Bootstrap 是基于
										HTML、CSS、JAVASCRIPT 的，它简洁灵活，使得 Web 开发更加快捷。</p>
								</div>
							</div>
							<div class="item">
								<img alt="" src="../img/default1.jpg" />
								<div class="carousel-caption">
									<h4>Hibernate</h4>
									<p>Hibernate是一个开放源代码的对象关系映射框架，它对JDBC进行了非常轻量级的对象封装，
										它将POJO与数据库表建立映射关系，是一个全自动的orm框架。</p>
								</div>
							</div>
							<div class="item">
								<img alt="" src="../img/default2.jpg" />
								<div class="carousel-caption">
									<h4>Struts2</h4>
									<p>Struts2是一个基于MVC设计模式的Web应用框架，它本质上相当于一个servlet，在MVC设计模式中，Struts2作为控制器(Controller)来建立模型与视图的数据交互。Struts
										2是 Struts的下一代产品，是在 struts 1和WebWork的技术基础上进行了合并的全新的Struts 2框架。</p>
								</div>
							</div>
						</div>
						<a class="left carousel-control" href="#carousel-643475"
							data-slide="prev"><span
							class="glyphicon glyphicon-chevron-left"></span></a> <a
							class="right carousel-control" href="#carousel-643475"
							data-slide="next"><span
							class="glyphicon glyphicon-chevron-right"></span></a>
					</div>
				</div>
			</div>

		</div>
		<!-- /.col-lg-4 -->
	</div>
	<!-- /.row -->
	</div>
	<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="../bower_components/jquery/dist/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="../bower_components/metisMenu/dist/metisMenu.min.js"></script>

	<!-- Morris Charts JavaScript -->
	<script src="../bower_components/raphael/raphael-min.js"></script>
	<script src="../bower_components/morrisjs/morris.min.js"></script>
	<script src="../js/morris-data.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="../dist/js/sb-admin-2.js"></script>

</body>

</html>
