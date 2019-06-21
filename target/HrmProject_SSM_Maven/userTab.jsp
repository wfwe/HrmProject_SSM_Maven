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
    <title>EasyUI Web Admin Power by Wuyeguo</title>
    <link rel="stylesheet" type="text/css" href="easyui/1.3.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="css/wu.css" />
    <link rel="stylesheet" type="text/css" href="css/icon.css" />
    <script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="easyui/1.3.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="easyui/1.3.4/locale/easyui-lang-zh_CN.js"></script>
</head>
<body class="easyui-layout">

<div class="easyui-layout" data-options="fit:true">
    <!-- Begin of toolbar -->
    <div id="wu-toolbar-4">
        <div class="wu-toolbar-button">
            <a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="openAdd()" plain="true">添加</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-edit" onclick="openEdit()" plain="true">修改</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-remove" onclick="remove()" plain="true">删除</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="cancel()" plain="true">取消</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-reload" onclick="reload()" plain="true">刷新</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-print" onclick="openAdd()" plain="true">打印</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-help" onclick="openEdit()" plain="true">帮助</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-undo" onclick="remove()" plain="true">撤销</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-redo" onclick="cancel()" plain="true">重做</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-sum" onclick="reload()" plain="true">总计</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-back" onclick="reload()" plain="true">返回</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-tip" onclick="reload()" plain="true">提示</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-save" onclick="reload()" plain="true">保存</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-cut" onclick="reload()" plain="true">剪切</a>
        </div>
        <div class="wu-toolbar-search">
            <label>起始时间：</label><input class="easyui-datebox" style="width:100px">
            <label>结束时间：</label><input class="easyui-datebox" style="width:100px">
            <label>用户组：</label>
            <select class="easyui-combobox" panelHeight="auto" style="width:100px">
                <option value="0">选择用户组</option>
                <option value="1">黄钻</option>
                <option value="2">红钻</option>
                <option value="3">蓝钻</option>
            </select>
            <label>关键词：</label><input class="wu-text" style="width:100px">
            <a href="#" class="easyui-linkbutton" iconCls="icon-search">开始检索</a>
        </div>
    </div>
    <!-- End of toolbar -->
    <table id="wu-datagrid-4" class="easyui-datagrid" toolbar="#wu-toolbar-4"></table>
</div>
<!-- Begin of easyui-dialog -->
<div id="user-dialog-2" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="height:300px;width:500px; padding:20px;">
    <form id="user-form-2" method="post" class="easyui-form" >
        <table onload="initSelect()">
            <tr style="height: 30px">
                <td width="60" align="right">姓 名:</td>
                <td><input type="text" name="username" class="easyui-validatebox wu-text" data-options="required:true" onclick="initSelect()"/></td>
            </tr>
            <tr>
                <td align="right">登录名:</td>
                <td><input type="text" name="loginname" class="easyui-validatebox wu-text" data-options="required:true,validType:'length[3,16]'"/></td>
            </tr>
            <tr>
                <td align="right">密 码:</td>
                <td><input type="password" name="password" class="easyui-validatebox wu-text" id="password" data-options="required:true,validType:'length[6,16]'"/></td>
            </tr>
            <tr>
                <td valign="right" align="right">确认密码:</td>
                <td><textarea type="password" name="password2"  class="easyui-validatebox wu-text" required="true" validType="equalTo['#password']"></textarea></td>
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
<script type="text/javascript">

    function initSelect(){

    }

    /**
     * Name 添加记录
     */
    function add(){
        $('#user-form-2').form('submit', {
            url:'addUserInf.action',
            onSubmit : function() {
                return $(this).form('enableValidation').form('validate');
            },
            success:function(data){
                if(data){
                    $.messager.alert('注册成功', '恭喜你,注册成功', 'info');
                    $('#user-dialog-2').dialog('close');
                }
                else
                {
                    $.messager.alert('注册失败', '对不起,注册失败了', 'error');
                }
            }
        });
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

    //默认下拉列表选择


    /**
     * Name 修改记录
     */
    function edit(){
        $('#user-form-2').form('submit', {
            url:'',
            success:function(data){
                if(data){
                    $.messager.alert('信息提示','提交成功！','info');
                    $('#wu-dialog-2').dialog('close');
                }
                else
                {
                    $.messager.alert('信息提示','提交失败！','info');
                }
            }
        });
    }

    /**
     * Name 删除记录
     */
    function remove(){
        $.messager.confirm('信息提示','确定要删除该记录？', function(result){
            if(result){
                var items = $('#wu-datagrid-4').datagrid('getSelections');
                var ids = [];
                $(items).each(function(){
                    ids.push(this.productid);
                });
                //alert(ids);return;
                $.ajax({
                    url:'',
                    data:'',
                    success:function(data){
                        if(data){
                            $.messager.alert('信息提示','删除成功！','info');
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
        $('#user-form-2').form('clear');
        var item = $('#wu-datagrid-4').datagrid('getSelected');
        //alert(item.productid);return;
        $.ajax({
            url:'',
            data:'',
            success:function(data){
                if(data){
                    $('#wu-dialog-2').dialog('close');
                }
                else{
                    //绑定值
                    $('#wu-form-2').form('load', data)
                }
            }
        });
        $('#wu-dialog-2').dialog({
            closed: false,
            modal:true,
            title: "修改信息",
            buttons: [{
                text: '确定',
                iconCls: 'icon-ok',
                handler: edit
            }, {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    $('#wu-dialog-2').dialog('close');
                }
            }]
        });
    }

    /**
     * Name 分页过滤器

    function pagerFilter(data){
        if (typeof data.length == 'number' && typeof data.splice == 'function'){// is array
            data = {
                total: data.length,
                rows: data
            }
        }
        var dg = $(this);
        var opts = dg.datagrid('options');
        var pager = dg.datagrid('getPager');
        pager.pagination({
            onSelectPage:function(pageNum, pageSize){
                opts.pageNumber = pageNum;
                opts.pageSize = pageSize;
                pager.pagination('refresh',{pageNumber:pageNum,pageSize:pageSize});
                dg.datagrid('loadData',data);
            }
        });
        if (!data.originalRows){
            data.originalRows = (data.rows);
        }
        var start = (opts.pageNumber-1)*parseInt(opts.pageSize);
        var end = start + parseInt(opts.pageSize);
        data.rows = (data.originalRows.slice(start, end));
        return data;
    }
     */

    /**
     * Name 载入数据
     */
    $('#wu-datagrid-4').datagrid({
        url:'${pageContext.request.contextPath}/findUserInfPaging.action',
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
            { field:'loginname',title:'登录名',width:100,sortable:true},
            { field:'username',title:'姓名',width:180,sortable:true},
            { field:'status',title:'角色',width:100,sortable:true,formatter:function (value) {
            if (value == 0)
                return "公司员工";
            if (value == 1)
                return "普通管理员";
            if (value == 2)
                return "超级管理员";
    }},
            { field:'createdate',title:'创建日期',width:100,sortable:true}
        ]]
    });
</script>
</body>
</html>