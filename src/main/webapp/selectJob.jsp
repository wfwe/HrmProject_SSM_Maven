<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/6/4
  Time: 9:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
    <script type="text/javascript" src="easyui/jquery.min.js"></script>
    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
    <title>查询职位</title>
</head>
<body>

<div title="查询职位" style="padding: 20px">
    <table class="easyui-datagrid" title="职位表"
           style="width: 100%; height: 780px"
           id="jobTb">
        <thead>
        <tr>

            <th data-options="field:'name',align:'center',resizable:false"
                width="30%">职位</th>
            <th data-options="field:'remark',align:'center',resizable:false"
                width="40%">备注</th>
        </tr>
        </thead>

    </table>

</div>
</body>
<script type="text/javascript">
    $(function () {
        $("#jobTb").datagrid({
            url:'${pageContext.request.contextPath}/FindAllJobInfPaging.action',
            method:'get',
            fitColumns:true,//列自适应宽度，不能和冻结列同时设置为true
            striped:true,//斑马线效果
            //idField:'id',//主键列
            rownumbers:true,//显示行号
            singleSelect:false,//是否单选
            pagination:true,//显示分页栏
            pageList:[5,10,15,20],//每页行数选择列表
            pageSize:10,//初始每页行数
            remoteSort:false,//是否服务器端排序，设成false，才能客户端排序
            //sortName:'id'//设置排序列
        });

    });
</script>
</html>
