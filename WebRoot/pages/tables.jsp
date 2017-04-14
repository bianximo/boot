<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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

<script type="text/javascript" src="jquery.dataTables.js"></script>
<script type="text/javascript"
	src="../bower_components/jquery/dist/jquery.js"></script>

<!-- Bootstrap Core CSS -->
<link href="../bower_components/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">


<!-- MetisMenu CSS -->
<link href="../bower_components/metisMenu/dist/metisMenu.min.css"
	rel="stylesheet">

<!-- DataTables CSS -->
<link
	href="../bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link
	href="../bower_components/datatables-responsive/css/dataTables.responsive.css"
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
<script type="text/javascript">
	$(document).ready(function() {
		$('#Tables-example').dataTable({
			"sPaginationType" : "full_numbers",
			"oLanguage" : {
				"sLengthMenu" : "每页显示 _MENU_ 条记录",
				"sZeroRecords" : "抱歉， 没有找到",
				"sInfo" : "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
				"sInfoEmpty" : "没有数据",
				"sInfoFiltered" : "(从 _MAX_ 条数据中检索)",
				"sZeroRecords" : "没有检索到数据",
				"sSearch" : "名称:",
				"oPaginate" : {
					"sFirst" : "首页",
					"sPrevious" : "前一页",
					"sNext" : "后一页",
					"sLast" : "尾页"
				}
			},
		}
		);
	});
</script>

</head>

<body>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content col-md-10">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">请修改学生信息</h4>
				</div>

				<form action="<%=path%>/students/Students_update.action"
					method="post">
					<br>
					<div class="form-group">
						<label>学生学号：</label> <input class="form-control" name="sid"
							id="stuid" type="text" placeholder="Disabled input" readonly>
					</div>
					<div class="form-group">
						<label>学生姓名：</label> <input id="stuname" class="form-control"
							name="sname">
					</div>
					<div class="form-group">
						<label>性别：</label> <label class="radio-inline"> <input
							type="radio" name="gender" id="stuboy" value="男" checked>
							男
						</label> <label class="radio-inline"> <input type="radio"
							name="gender" id="stugirl" value="女"> 女
						</label>
					</div>
					<div class="form-group">
						<label>选择出生日期：</label>
						<div class="input-group date form_date " data-date=""
							data-date-format="yyyy-mm-dd" data-link-field="dtp_input2"
							data-link-format="yyyy-mm-dd">
							<input id="studate" name="date" class="form-control" size="16"
								type="text" readonly> <span class="input-group-addon"><span
								class="glyphicon glyphicon-remove"></span></span> <span
								class="input-group-addon"><span
								class="glyphicon glyphicon-calendar"></span></span>
						</div>
					</div>
					<div class="form-group">
						<label>家庭住址：</label> <input id="stuaddress"
							class="form-control col-md-2" name="address">
					</div>
					<br>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<input id="stumodify" type="submit" class="btn btn-primary"
							onclick="javascript: return alert('修改成功！')" value="修改">
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
								class="fa fa-wrench fa-fw"></i>用户设置</a>
						<li><a href="<%=path%>/pages/shermo.jsp"><i
								class="fa fa-qq fa-fw"></i>关于我</a> <!-- 
							
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
					<h1 class="page-header">学生信息</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">请查询学生信息</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="dataTable_wrapper">
								<table class="table table-striped  table-bordered table-hover"
									id="Tables-example">
									<thead>
										<tr>
											<th style='text-align: center;'>学号</th>
											<th style='text-align: center;'>姓名</th>
											<th style='text-align: center;'>性别</th>
											<th style='text-align: center;'>出生日期</th>
											<th style='text-align: center;'>家庭住址</th>
											<th style='text-align: center;'>操作</th>
										</tr>
									</thead>
									<tbody>
										<!-- 循环开始 -->
										<s:iterator value="#session.studentsList" var="stu">
											<tr class="odd gradeX">
												<td style='text-align: center;'><s:property
														value="#stu.sid" /></td>
												<td style='text-align: center;'><s:property
														value="#stu.sname" /></td>
												<td style='text-align: center;'><s:property
														value="#stu.gender" /></td>
												<td style='text-align: center;'><s:date
														name="#stu.date" format="yyyy-MM-dd" /></td>
												<td style='text-align: center;'><s:property
														value="#stu.address" /></td>
												<td style='text-align: center;'><a data-toggle="modal"
													id="<s:property
														value="#stu.sid" />"
													data-target="#myModal" onclick="editInfo(this)">修改</a> <a
													href="<%=path%>/students/Students_delete.action?sid=<s:property value="#stu.sid"/>"
													onclick="javascript: return confirm('真的要删除该学生吗？')">删除</a></td>
											</tr>
										</s:iterator>
										<!-- 循环结束 -->
									</tbody>
								</table>
							</div>
							<!-- /.table-responsive -->
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
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

	<!-- DataTables JavaScript -->
	<script
		src="../bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
	<script
		src="../bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="../dist/js/sb-admin-2.js"></script>
	<!-- Page-Level Demo Scripts - Tables - Use for reference -->

	<script>
		$(document).ready(function() {
			$('#dataTables-example').DataTable({
				responsive : true
			});
		});
	</script>
	<script type="text/javascript" src="../js/bootstrap-datetimepicker.js"
		charset="UTF-8"></script>
	<script type="text/javascript"
		src="../js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
	<script type="text/javascript">
		$('.form_datetime').datetimepicker({
			//language:  'fr',
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			forceParse : 0,
			showMeridian : 1
		});
		$('.form_date').datetimepicker({
			language : 'zh-CN',
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			minView : 2,
			forceParse : 0
		});
		$('.form_time').datetimepicker({
			language : 'zh-CN',
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 1,
			minView : 0,
			maxView : 1,
			forceParse : 0
		});
	</script>
	<script type="text/javascript">
		function editInfo(obj) {
			var $td = $(obj).parents('td').parents('tr').children('td');
			var id = $td.eq(0).text();
			var name = $td.eq(1).text();
			var gender = $td.eq(2).text();
			var date = $td.eq(3).text();
			var address = $td.eq(4).text();
			$('#stuid').val(id);
			$('#stuname').val(name);
			if (gender == '女') {
				document.getElementById('stugirl').checked = true;
			} else {
				document.getElementById('stuboy').checked = true;
			}
			$('#studate').val(date);
			$('#stuaddress').val(address);
		//$('#stu').modal('show');
		}
	</script>

</body>

</html>
