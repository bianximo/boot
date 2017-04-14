<%@page import="java.text.SimpleDateFormat"%>
<%@page import="myutils.OnlineCounter"%>
<%@ page language="java" import="java.util.*,entity.Message,java.lang.*"
	pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	List<Message> receiveList = (ArrayList) session.getAttribute("receiveList");
	List<Message> sendList = (ArrayList) session.getAttribute("sendList");
	int index = Integer.parseInt(request.getParameter("index"));
	Message now;
	int read = Integer.parseInt(request.getParameter("read"));
	if (read == 1)
		now = receiveList.get(index);
	else
		now = sendList.get(index);
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

						<input id="sendMessageModel" type="submit" class="btn btn-primary"
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
						<s:iterator value="#session.newMessage" var="message" status="L">
							<li><a href="#">
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
						<li><a class="text-center"
							href="<%=path%>/messages/Messages_query.action"> <strong>所有信息</strong>
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
								class="fa fa-wrench fa-fw"></i>用户设置</a></li>
						<li><a href="<%=path%>/pages/shermo.jsp"><i
								class="fa fa-qq fa-fw"></i>关于我</a>
					</ul>
				</div>
				<!-- /.sidebar-collapse -->
			</div>
			<!-- /.navbar-static-side -->
		</nav>

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">详细消息</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<form
				action="<%=path%>/messages/Messages_read.action?readId=<%=now.getMid()%>"
				method="post" class="col-lg-8">
				<div class="form-group ">
					<label>发信人：<%=now.getSendName()%>
				</div>
				<div class="form-group ">
					<label>收信人：<%=now.getReceiveName()%></label>
				</div>
				<div class="form-group ">
					<label>状态：<%
						if (now.getIsRead() == 0)
							out.print("未读");
						else
							out.print("已读");
					%></label>
				</div>
				<div class="form-group ">
					<label>内容：</label>
					<textarea class="form-control" name="data" rows="7"><%=now.getMessage()%>
					</textarea>
				</div>
				<div class="form-group ">
					<label>时间：<%=new SimpleDateFormat("MM-dd hh:mm").format(now.getDate()).toString()%></label>
				</div>
				<div class="modal-footer">
					<%
						if (read == 1) {
							out.print("<input type='submit' class='btn btn-primary' value='标为已读'>");
						}
						;
					%>

					<a type="button" href="<%=path%>/messages/Messages_query.action"
						class="btn btn-default">返回</a>
				</div>
			</form>
		</div>
		<!-- jQuery -->
		<script src="../bower_components/jquery/dist/jquery.min.js"></script>

		<!-- Bootstrap Core JavaScript -->
		<script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

		<!-- Metis Menu Plugin JavaScript -->
		<script src="../bower_components/metisMenu/dist/metisMenu.min.js"></script>
</body>

</html>
