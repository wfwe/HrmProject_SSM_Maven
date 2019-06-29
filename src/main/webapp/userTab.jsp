<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/6/21
  Time: 21:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="copyright" content="All Rights Reserved, Copyright (C) 2013, Wuyeguo, Ltd." />
    <title>用戶管理</title>
</head>
<body class="easyui-layout">

<div class="easyui-layout" data-options="fit:true">
    <!-- Begin of toolbar -->
    <div id="user-toolbar-4">
        <div class="wu-toolbar-button">
            <a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="openAdd()" plain="true">添加</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-edit" onclick="openEdit()" plain="true">修改</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-remove" onclick="remove()" plain="true">删除</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-reload" onclick="toSearch()" plain="true">刷新</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="clearSearch()" plain="true">清空</a>
        </div>
        <div class="wu-toolbar-search">
            <label>起始时间：</label><input id="startTime" name="startTime" class="easyui-datebox" style="width:100px">
            <label>结束时间：</label><input id="endTime" name="endTime" class="easyui-datebox" style="width:100px">
            <label>用户角色：</label>
            <select class="easyui-combobox" panelHeight="auto" style="width:100px" id="searchStatus">
                <option value="">选择角色</option>
                <option value="1">公司员工</option>
                <option value="2">普通管理员</option>
                <option value="3">超级管理员</option>
            </select>
            <label>名字：</label><input id="searchName" name="searchName" class="wu-text" style="width:100px">
            <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="toSearch()">开始检索</a>
        </div>
    </div>
    <!-- End of toolbar -->
    <table id="user-datagrid-4" class="easyui-datagrid" toolbar="#user-toolbar-4"></table>
</div>
<!-- Begin of easyui-dialog -->
<div id="user-dialog-2" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="height:300px;width:500px; padding:20px;">
    <form id="user-form-2" method="post" class="easyui-form" >
        <table>
            <tr style="height: 30px">
                <td width="60" align="right">姓 名:</td>
                <td><input type="text" name="username" class="easyui-validatebox wu-text" data-options="required:true"/></td>
            </tr>
            <tr id="loginNameTr">
                <td align="right">登录名:</td>
                <td><input type="text"id="loginname" name="loginname" class="easyui-validatebox wu-text" data-options="required:true,validType:'length[1,16]'"/></td>
            </tr>
            <tr id="passwordTr">
                <td align="right">密 码:</td>
                <td><input type="password" name="password" class="easyui-validatebox wu-text" id="password" data-options="required:true,validType:'length[6,16]'"/></td>
            </tr>
            <tr id="rePasswordTr">
                <td valign="right" align="right">确认密码:</td>
                <td><textarea type="password" name="password2" id="password2" class="easyui-validatebox wu-text" required="true" validType="equalTo['#password']"></textarea></td>
            </tr>
            <tr>
                <td align="right">角色:</td>
                <td><select id="status" class="easyui-combobox easyui-validatebox" name="status" style="width: 120px;" panelHeight="auto">
                </select>
                </td>
            </tr>
        </table>
    </form>
</div>
<!-- End of easyui-dialog -->

<!-- Begin of easyui-dialog -->
<div id="user-dialog-1" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="height:300px;width:500px; padding:20px;">
    <form id="user-form-1" method="post" class="easyui-form" >
        <table>
            <tr>
                <td colspan="2">
                    <input type="hidden" name="id" >
                </td>
            </tr>
            <tr style="height: 30px">
                <td width="60" align="right">姓 名:</td>
                <td><input type="text" id="editName" name="username" class="easyui-validatebox wu-text" data-options="required:true"/></td>
            </tr>
            <tr>
                <td align="right">角色:</td>
                <td><select id="editStatus" class="easyui-combobox easyui-validatebox" name="status" style="width: 120px;" panelHeight="auto">
                </select>
                </td>
            </tr>
        </table>
    </form>
</div>
<!-- End of easyui-dialog -->
<script type="text/javascript">

    /**
     * 搜索函数
     */
    function toSearch() {
        var startTime = $('#startTime').datebox("getValue");
        //alert(startTime);
        var endTime = $('#endTime').datebox("getValue");
        //alert(endTime);
        var searchStatus = $("#searchStatus").combobox("getValue");
        //alert(searchStatus);
        var searchName = $('#searchName').val();
        //if (($.trim(searchName) == "" || searchName == "")&& startTime == "" && endTime == "" && searchStatus =="") {
         //   alert("请选择搜索条件");
         //   return;
        //}
        $('#user-datagrid-4').datagrid("load",{
            startTime : startTime,
            endTime : endTime,
            searchStatus : searchStatus,
            searchName : searchName
        })

        //alert(searchName);
    }

    //完成两个密码效验
    $.extend($.fn.validatebox.defaults.rules, {
        /*必须和某个字段相等*/
        equalTo : {
            validator : function(value, param) {
                return $(param[0]).val() == value;
            },
            message : '两次密码不一致'
        }
    });

    /**
     * 清空搜索框
     */

    function clearSearch(){
        $('#startTime').combo("setText",'');
        $('#startTime').combo("setValue",'');
        $('#searchStatus').combobox("setValue","");
        $("#endTime").combo("setText",'');
        $("#endTime").combo("setValue",'');
        $('#searchName').val("");
    }
    /**
     * Name 添加记录
     */
    function add(){
        $('#user-form-2').form('submit', {
            url:'${pageContext.request.contextPath}/addUserInf.action',
            onSubmit : function() {
                return $(this).form('enableValidation').form('validate');
            },
            success:function(data){
                if(data == "ok"){
                    $.messager.alert('创建成功', '用户创建成功', 'info');
                    $('#user-dialog-2').dialog('close');
                    reload();
                }
                else
                {
                    $.messager.alert('创建失败', '用户创建失败', 'error');
                }
            }
        });
    }

    /**
     * Name 修改记录
     */
    function edit(){

        $('#user-form-1').form('submit', {
            url:'${pageContext.request.contextPath}/editUserInf.action',
            success:function(data){
                if(data == "ok"){
                    $.messager.alert('信息提示','修改成功！','info');
                    $('#user-dialog-1').dialog('close');
                    reload();
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
    function remove(){
        var items = $('#user-datagrid-4').datagrid('getSelections');
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
                    names.push(this.loginname);
                })
                //alert(ids);return;
                $.ajax({
                    url:'${pageContext.request.contextPath}/deleteUserInfById.action?ids='+ids,
                    success:function(data){
                        if(data == "ok"){
                            $.messager.alert('信息提示',names+' 删除成功！','info');
                            reload();
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
    function openAdd(){
        $('#user-form-2').form('clear');
        $('#user-dialog-2').dialog({
            closed: false,
            modal:true,
            title: "添加员工",
            buttons: [{
                text: '确定',
                iconCls: 'icon-ok',
                handler: add
            }, {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    $('#user-dialog-2').dialog('close');
                }
            }]
        });
        var data = [ {'text' : '未选择', 'value' : ''},
            {'text' : '公司员工', 'value' : '1'},
            {'text' : '普通管理员', 'value' : '2'},
            {'text' : '超级管理员', 'value' : '3'},];
        $('#status').combobox({ textField : 'text', valueField : 'value', panelHeight : 'auto', data : data });
    }

    /**
     * Name 打开修改窗口
     */
    function openEdit(){
        //$('#user-form-2').form('clear');
        var item = $('#user-datagrid-4').datagrid('getSelected');
        //alert(item.productid);return;
        if (item == null){
            alert("请选择要更新信息的职位");return;
        }
        $('#user-dialog-1').dialog({
            closed: false,
            modal:true,
            title: "修改用户信息",
            buttons: [{
                text: '确定',
                iconCls: 'icon-ok',
                handler: edit
            }, {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    $('#user-dialog-1').dialog('close');
                }
            }]
        });
        var data = [{'text' : '公司员工', 'value' : '1'},
            {'text' : '普通管理员', 'value' : '2'},
            {'text' : '超级管理员', 'value' : '3'},];
        $('#editStatus').combobox({ textField : 'text', valueField : 'value', panelHeight : 'auto', data : data });
        $.ajax({
            url:'${pageContext.request.contextPath}/findUserInfById.action?id='+item.id,
            success:function(data){
                if(data != null){
                    //绑定值
                    var obj = jQuery.parseJSON(data);
                    $('#user-form-1').form('load', obj)
                    $('#editStatus').combobox("setValue",parseInt(obj.status));
                }
                else{
                    $('#user-dialog-1').dialog('close');
                }
            }
        });
    }

    /**
     *
     * 刷新页面数据
     */

    function reload(){
        $('#user-datagrid-4').datagrid("reload");
    }
    /**
     * Name 载入数据
     */
    $('#user-datagrid-4').datagrid({
        url:'${pageContext.request.contextPath}/findUserInfPaging.action',
        rownumbers:true,
        singleSelect:false,
        pageSize:20,
        pagination:true,
        multiSort:true,
        fitColumns:true,
        fit:true,
        columns:[[
            { checkbox:true},
            { field:'loginname',title:'登录名',width:100,sortable:true,align:'center'},
            { field:'username',title:'姓名',width:180,sortable:true,align:'center'},
            { field:'status',title:'角色',width:100,sortable:true,align:'center',formatter:function (value) {
            if (value == 1)
                return "公司员工";
            if (value == 2)
                return "普通管理员";
            if (value == 3)
                return "超级管理员";
    }},
            { field:'createdate',title:'创建日期',width:100,sortable:true,align:'center'}
        ]]
    });
</script>
</body>
</html>