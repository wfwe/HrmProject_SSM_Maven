<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/6/22
  Time: 11:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="copyright" content="All Rights Reserved, Copyright (C) 2013, Gjc." />
    <title>部门管理</title>
</head>
<body class="easyui-layout">

<div class="easyui-layout" data-options="fit:true">
    <!-- Begin of toolbar -->
    <div id="dept-toolbar-4">
            <div class="wu-toolbar-button">
            <c:if test="${status  >= 2}">
                <a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="openAddDept()" plain="true">添加</a>
                <a href="#" class="easyui-linkbutton" iconCls="icon-edit" onclick="openEditDept()" plain="true">修改</a>
                <a href="#" class="easyui-linkbutton" iconCls="icon-remove" onclick="removeDept()" plain="true">删除</a>
            </c:if>
                <a href="#" class="easyui-linkbutton" iconCls="icon-reload" onclick="reloadDept()" plain="true">刷新</a>
            </div>
    </div>
    <!-- End of toolbar -->
    <table id="dept-datagrid-4" class="easyui-datagrid" toolbar="#dept-toolbar-4"></table>
</div>
<!-- Begin of easyui-dialog -->
<div id="dept-dialog-2" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="height:200px;width:500px; padding:20px;">
    <form id="dept-form-2" method="post" class="easyui-form" >
        <table >
            <tr>
                <td colspan="2"><input type="text" name="id" data-options="field:'id'" hidden></td>
            </tr>
            <tr style="height: 30px">
                <td width="60" align="right">部 门:</td>
                <td><input type="text" name="name" class="easyui-validatebox wu-text" data-options="required:true" /></td>
            </tr>
            <tr>
                <td align="right">备 注:</td>
                <td><input type="text" name="remark" class="easyui-validatebox wu-text" data-options="required:true"/></td>
            </tr>
        </table>
    </form>
</div>
<!-- End of easyui-dialog -->
<script type="text/javascript">

    /**
     * Name 添加记录
     */
    function addDept(){
        $('#dept-form-2').form('submit', {
            url:'${pageContext.request.contextPath}/addDeptInf.action',
            onSubmit : function() {
                return $(this).form('enableValidation').form('validate');
            },
            success:function(data){
                if(data == "ok"){
                    $.messager.alert('添加成功', '部门添加成功', 'info');
                    $('#dept-dialog-2').dialog('close');
                    $('#dept-datagrid-4').datagrid("reload");
                }
                else
                {
                    $.messager.alert('添加失败', '部门添加失败了', 'error');
                }
            }
        });
    }

    /**
     * 刷新页面
     */
    function reloadDept() {
        $('#dept-datagrid-4').datagrid("reload");
    }


    /**
     * Name 修改记录
     */
    function editDept(){
        $('#dept-form-2').form('submit', {
            url:'${pageContext.request.contextPath}/editDeptInf.action',
            success:function(data){
                if(data == "ok"){
                    $.messager.alert('信息提示','修改成功！','info');
                    $('#dept-dialog-2').dialog('close');
                    $('#dept-datagrid-4').datagrid("reload");
                }
                else
                {
                    $.messager.alert('信息提示','修改失败！','info');
                }
            }
        });
    }

    /**
     * Name 删除记录
     */
    function removeDept(){
        var items = $('#dept-datagrid-4').datagrid('getSelections');
        if (items.length <= 0){
            alert("请选择要删除的数据！");
            return;
        }
        $.messager.confirm('信息提示','确定要删除该记录？', function(result){
            if(result){
                var ids = [];
                var names = [];
                $(items).each(function(){
                    ids.push(this.id);
                });
                $(items).each(function () {
                    names.push(this.name);
                })
                //alert(ids);return;
                $.ajax({
                    url:'${pageContext.request.contextPath}/deleteDeptInfById.action?ids='+ids,
                    success:function(data){
                        if(data=="ok"){
                            $.messager.alert('信息提示',names+' 删除成功！','info');
                            $('#dept-datagrid-4').datagrid("reload");
                        }
                        else
                        {
                            $.messager.alert('信息提示','删除失败！','info');
                        }
                    }
                });
            }
        });
    }

    /**
     * Name 打开添加窗口
     */
    function openAddDept(){
        $('#dept-form-2').form('clear');
        $('#dept-dialog-2').dialog({
            closed: false,
            modal:true,
            title: "添加部门",
            buttons: [{
                text: '确定',
                iconCls: 'icon-ok',
                handler: addDept
            }, {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    $('#dept-dialog-2').dialog('close');
                }
            }]
        });
    }

    /**
     * Name 打开修改窗口
     */
    function openEditDept(){
        var item = $('#dept-datagrid-4').datagrid('getSelected');
        if (item == null)
            alert("请选择要更新信息的部门");
        $('#dept-form-2').form('clear');
        //alert(item.productid);return;
        $.ajax({
            url:'${pageContext.request.contextPath}/findDeptInfById.action?id='+item.id,
            success:function(data){
                if(data == null){
                    alert("请选择要更新信息的部门");
                    $('#dept-dialog-2').dialog('close');
                }
                else{
                    //绑定值
                    var obj = jQuery.parseJSON(data);
                    $('#dept-form-2').form('load', obj);
                }
            }
        });
        $('#dept-dialog-2').dialog({
            closed: false,
            modal:true,
            title: "修改信息",
            buttons: [{
                text: '确定',
                iconCls: 'icon-ok',
                handler: editDept
            }, {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    $('#dept-dialog-2').dialog('close');
                }
            }]
        });
    }

    /**
     * Name 载入数据
     */
    $('#dept-datagrid-4').datagrid({
        url:'${pageContext.request.contextPath}/findAllDeptInfPaging.action',
        //loadFilter:pagerFilter,
        rownumbers:true,
        singleSelect:false,
        pageSize:20,
        pagination:true,
        multiSort:true,
        fitColumns:true,
        fit:true,
        columns:[[
            { checkbox:true},
            { field:'name',title:'部门',width:100,sortable:true,align:'center'},
            { field:'remark',title:'备注',width:180,sortable:true,align:'center'},
        ]]
    });
</script>
</body>
</html>
