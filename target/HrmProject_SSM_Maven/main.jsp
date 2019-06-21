																																																																																																																																																															<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>人事管理系统</title>
<link rel="stylesheet" type="text/css"
	href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<style>
* {
	margin: 0px;
	padding: 0px;
	font-size: 12px;
}
</style>
</head>
<body class="easyui-layout" data-options="fit:true">
	<div class="easyui-layout" style="width: 100%; height: 100%;">
		<!--上面部分-->
		<div data-options="region:'north',border:false"
			style="background-image: url('images/topbg.gif'); height: 80px; overflow: hidden">
			<div style="position: relative;">
				<img src="images/top_logo.png" alt="找不到图片">
				<table style="position: absolute; left: 75%; top: 15px;">
					<tr>
						<td style="width: 25px"><img src="images/top_home.gif">
						</td>
						<td style="width: 120px"><a href="${pageContext.request.contextPath}/main.jsp"
							style="color: #FFFFFF; text-decoration: none">首页</a></td>
						<td style="width: 25px"><img src="images/top_exit.gif"></td>
						<td style="width: 120px"><a href="${pageContext.request.contextPath}/quitLogin.action"
							style="color: #FFFFFF; text-decoration: none">退出登录</a></td>
					</tr>
				</table>
				<div
					style="position: absolute; background-image: url('images/StatBarBg.png'); left: 400px; top: 47px; width: 100%; height: 33px; background-size: 100% 100%;">
					<div style="width: 100%">
						<table style="margin-left: 50px; margin-top: 7px">
							<tr>
								<td style="width: 25px"><img src="images/StatBar_admin.gif"></td>
								<td>当前用户:${pageContext.session.getAttribute("userName")}</td>
								<td style="width: 60%"></td>
								<td style="width: 25px"><img src="images/StatBar_time.gif"></td>
								<td style="width: 300px"><p id="ptime"></p></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!--最下面部分-->
		<div data-options="region:'south',border:false" style="height: 25px;">
			<center>©2019-2059 五邑大学信息安全专业&nbsp;&nbsp;&nbsp;javaEE技术开发</center>
		</div>
		<!--最右边部分-->
		<div data-options="region:'east'," title="East" style="width: 100px;"></div>
		<!--最左边部分-->
		<div data-options="region:'west',iconCls:'icon-clipart',"
			title="公司人事信息管理" style="width: 200px; background-color: #E6EEF8">

			<div class="easyui-accordion">
				<div title="用户管理" data-options="iconCls:'icon-group'"
					style="overflow: auto; padding: 10px; height: 200px">
					<a href="#" class="easyui-linkbutton"
						data-options="plain:true,iconCls:'icon-zoom'" id="selectuser">用户查询</a>
					<a href="#" class="easyui-linkbutton"
						data-options="plain:true,iconCls:'icon-groupadd'" id="adduser">添加用户</a>

				</div>
				<div title="部门管理" data-options="iconCls:'icon-edit'"
					style="overflow: auto; padding: 10px; height: 200px">
					<a href="#" class="easyui-linkbutton"
						data-options="plain:true,iconCls:'icon-zoom'" id="selectDept">部门查询</a>
					<a href="#"
						class="easyui-linkbutton"
						data-options="plain:true,iconCls:'icon-add'" id="addDept">添加部门</a>
				</div>
				<div title="职位管理" data-options="iconCls:'icon-remove'"
					style="overflow: auto; padding: 10px; height: 200px">
					<a href="#" class="easyui-linkbutton"
						data-options="plain:true,iconCls:'icon-zoom'" id="selectJob">职位查询</a> <a href="#"
						class="easyui-linkbutton"
						data-options="plain:true,iconCls:'icon-add'" id="addJob">添加职位</a>
				</div>
				<div title="员工管理" data-options="iconCls:'icon-user'"
					style="overflow: auto; padding: 10px; height: 200px">
					<a href="#" class="easyui-linkbutton"
						data-options="plain:true,iconCls:'icon-zoom'" id="selectEmp">员工查询</a>
					<a href="#" class="easyui-linkbutton"
						data-options="plain:true,iconCls:'icon-useradd'" id="addEmp">添加员工</a>
				</div>
				<div title="公告管理" data-options="iconCls:'icon-ok'"
					style="overflow: auto; padding: 10px; height: 200px">
					<a href="#" class="easyui-linkbutton"
						data-options="plain:true,iconCls:'icon-print'">公告查询</a> <a
						href="#" class="easyui-linkbutton"
						data-options="plain:true,iconCls:'icon-add'">添加公告</a>
				</div>
				<div title="下载中心" data-options="iconCls:'icon-print'"
					style="overflow: auto; padding: 10px; height: 200px">
					<a href="#" class="easyui-linkbutton"
						data-options="plain:true,iconCls:'icon-zoom'">文档查询</a> <a href="#"
						class="easyui-linkbutton"
						data-options="plain:true,iconCls:'icon-add'">下载文档</a>
				</div>


			</div>


		</div>
		<!--最中间边部分-->
		<div data-options="region:'center',split:true">
			<div class="easyui-tabs" style="height: 100%" id="usertab"></div>
		</div>
	</div>

</body>
<script>
	/*时钟*/
	//js完成，创建一个定时器（可重复的）
	var mytime = setInterval(function() {
		getTime();
	}, 1000);//1000毫秒==1秒
	function getTime() {
		var d = new Date();
		/*得到月，日，时，分，秒，要处理少10补0  */
		var M = (d.getMonth() + 1) < 10 ? ('0' + (d.getMonth() + 1)) : (d
				.getMonth() + 1);
		var D = d.getDate() < 10 ? ('0' + d.getDate()) : d.getDate();
		var H = d.getHours() < 10 ? ('0' + d.getHours()) : d.getHours();
		var m = d.getMinutes() < 10 ? ('0' + d.getMinutes()) : d.getMinutes();
		var s = d.getSeconds() < 10 ? ('0' + d.getSeconds()) : d.getSeconds();
		var t = d.getFullYear() + "年" + M + "月" + D
				+ "号&nbsp;&nbsp;&nbsp;&nbsp;" + H + ":" + m + ":" + s
				+ "&nbsp;&nbsp;&nbsp;&nbsp;星期" + "日一二三四五六".charAt(d.getDay());
		;
		//将控件的内容修改为处理好的字符串
		$("#ptime").html(t);
	}

	//添加用户的点击事件
	$(function() {//jq的页面加载完成事件
		addTab("#usertab", "欢迎登录", "icon-zoom", "welcome.jsp");

		$("#selectuser").click(function() {
			addTab("#usertab", "用户查询", "icon-zoom", "selectuser.jsp");
		});
        $("#selectJob").click(function() {
            addTab("#usertab", "职位查询", "icon-zoom", "selectJob.jsp");
		});
        $("#selectEmp").click(function() {
			addTab("#usertab", "员工查询", "icon-zoom", "selectEmp.jsp");
        });
        $("#selectDept").click(function() {
			addTab("#usertab", "部门查询", "icon-zoom", "selectDept.jsp");
        });
		$("#adduser").click(function() {
			addTab("#usertab", "添加用户", "icon-groupadd", "adduser.jsp");
		});
		$("#addEmp").click(function(){
			addTab("#usertab", "添加员工", "icon-groupadd", "addemp.jsp");	
			
		});
		$("#addDept").click(function () {
			addTab("#usertab","添加部门","icon-groupadd","addDept.jsp");
        });
        $("#addJob").click(function () {
            addTab("#usertab","添加职位","icon-groupadd","addJob.jsp");
        });
		

	});

	//封装一个添加tab的方法（id--—>要添加tab的id, info-->要添加的title,icon:要添加的图标）
	function addTab(id, info, icon, url) {
		//先判断是否存在,返回一个boolean值
		var res = $(id).tabs("exists", info);

		//如果选项卡存在，则直接选中：select选中
		if (res) {
			//让table选中
			$(id).tabs("select", info);

		} else {//如果不存在则添加
			//调用添加tab的函数
			var content = '<iframe scrolling="auto" frameborder="0"  src="'
					+ url + '" style="width:100%;height:100%;"></iframe>';
			$(id).tabs("add", {
				"iconCls" : icon,
				"title" : info,
				content : content,
				"closable" : "true"
			});
		}

	}
</script>
</html>