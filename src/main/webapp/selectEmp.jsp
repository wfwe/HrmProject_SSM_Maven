<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>员工查询</title>
    <link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
    <script type="text/javascript" src="easyui/jquery.min.js"></script>
    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
</head>
<body>
<div title="查询员工" style="padding: 20px">
    <table class="easyui-datagrid" title="员工信息表"
           style="width: 100%; height: 780px"
           data-options="singleSelect:true,collapsible:true,url:'datagrid_data1.json',method:'get'">
        <thead>
        <tr>
            <th data-options="field:'listprice',align:'center',resizable:false"
                width="5%">姓名</th>
            <th data-options="field:'itemid',align:'center',resizable:false"
                width="5%">部门</th>
            <th data-options="field:'productid',align:'center',resizable:false"
                width="5%">职位</th>
            <th data-options="field:'card_id',align:'center',resizable:false"
                width="10%">卡号</th>
            <th data-options="field:'adress',align:'center',resizable:false"
                width="10%">地址</th>
            <th data-options="field:'post_code',align:'center',resizable:false"
                width="5%">邮政编码</th>
            <th data-options="field:'phone',align:'center',resizable:false"
                width="5%">电话</th>
            <th data-options="field:'qq_num',align:'center',resizable:false"
                width="5%">QQ</th>
            <th data-options="field:'email',align:'center',resizable:false"
                width="5%">email</th>
            <th data-options="field:'sex',align:'center',resizable:false"
                width="5%">性别</th>
            <th data-options="field:'party',align:'center',resizable:false"
                width="5%">政治面貌</th>
            <th data-options="field:'birthday',align:'center',resizable:false"
                width="5%">生日</th>
            <th data-options="field:'race',align:'center',resizable:false"
                width="5%">族</th>
            <th data-options="field:'education',align:'center',resizable:false"
                width="5%">学历</th>
            <th data-options="field:'speciality',align:'center',resizable:false"
                width="5%">专业</th>
            <th data-options="field:'hobby',align:'center',resizable:false"
                width="5%">兴趣</th>
            <th data-options="field:'remark',align:'center',resizable:false"
                width="5%">备注</th>
            <th data-options="field:'create_date',align:'center',resizable:false"
                width="5%">入职日期</th>
        </tr>
        </thead>
        <c:forEach var="emp" items="">
            <tr>
                <td>${emp.name}</td>
                <td>${emp.dept_name}</td>
                <td>${emp.job_name}</td>
                <td>${emp.card_id}</td>
                <td>${emp.address}</td>
                <td>${emp.post_code}</td>
                <td>${emp.phone}</td>
                <td>${emp.qq_num}</td>
                <td>${emp.email}</td>
                <td><c:if test="${emp.sex ==0}">女</c:if>
                    <c:if test="${emp.sex ==1}">男</c:if></td>
                <td>${emp.party}</td>
                <td>${emp.birthday}</td>
                <td>${emp.race}</td>
                <td>${emp.education}</td>
                <td>${emp.speciality}</td>
                <td>${emp.hobby}</td>
                <td>${emp.remark}</td>
                <td>${emp.create_date}</td>
            </tr>
        </c:forEach>
    </table>

</div>
</body>
</html>
