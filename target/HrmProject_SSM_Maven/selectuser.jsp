<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户查询</title>
	<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
</head>
<body>
	<div title="查询用户" style="padding: 20px">
		<table class="easyui-datagrid" title="员工信息表"
			style="width: 100%; height: 780px"
			id="userTb" >
			<thead>
				<tr>
					<th data-options="field:'id',align:'center',resizable:false"
						width="10%">ID</th>
					<th data-options="field:'loginname',align:'center',resizable:false"
						width="15%">登录名</th>
					<th data-options="field:'username',align:'center',resizable:false"
						width="15%">姓名</th>
					<th data-options="field:'createdate',align:'center',resizable:false"
						width="30%">创建日期</th>
					<th data-options="field:'status',align:'center',resizable:false"
						width="30%">角色</th>
				</tr>
			</thead>
		</table>

	</div>

</body>
<script type="text/javascript">
    $(function () {
        $("#userTb").datagrid({
            url:'${pageContext.request.contextPath}/findUserInfPaging.action',
            method:'get',
            fitColumns:true,//列自适应宽度，不能和冻结列同时设置为true
            striped:true,//斑马线效果
            idField:'id',//主键列
            rownumbers:true,//显示行号
            singleSelect:false,//是否单选
            pagination:true,//显示分页栏
            pageList:[5,10,15,20],//每页行数选择列表
            pageSize:10,//初始每页行数
            remoteSort:false,//是否服务器端排序，设成false，才能客户端排序
            sortName:'id'//设置排序列
        });

    });
</script>
</html>