<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/6/25
  Time: 20:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="copyright" content="All Rights Reserved, Copyright (C) 2013, Wuyeguo, Ltd." />
    <title>下载管理</title>
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
    <div id="load-toolbar-4">
        <div class="wu-toolbar-button">
            <a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="openAddLoad()" plain="true">上传</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-edit" onclick="openEditLoad()" plain="true">修改</a>
            <a  class="easyui-linkbutton" iconCls="icon-remove" onclick="removeLoad()" plain="true" >删除</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-remove" onclick="Load()" plain="true" id="removeL">下载</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-reload" onclick="reloadLoad()" plain="true">刷新</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="clearSearchLoad()" plain="true">清空</a>
        </div>
        <div class="user-toolbar-search">
            <label>开始时间：</label><input id="startTime" name="startTime" class="easyui-datebox" style="width:100px">
            <label>结束时间：</label><input id="endTime" name="endTime" class="easyui-datebox" style="width:100px">
            <label>文件名称：</label><input id="searchLoadTitle" name="searchLoadTitle" class="wu-text" style="width:100px">
            <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="toSearchLoad()">开始检索</a>
        </div>
    </div>
    <!-- End of toolbar -->
    <table id="load-datagrid-4" class="easyui-datagrid" toolbar="#load-toolbar-4"></table>
</div>
<!-- Begin of easyui-dialog -->
<div id="load-dialog-2" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="height:300px;width:500px; padding:20px;">
    <form method="post" enctype="multipart/form-data" id="load-form-2" action="" class="easyui-form">
        <table cellpadding="10">
            <tr>
                <td>标题:</td>
                <td><input class="easyui-textbox" type="text" name="loadTitle" data-options="required:true"></td>
            </tr>
            <tr>
                <td>备注:</td>
                <td><input class="easyui-textbox" type="text" name="loadRemark" data-options="required:true"></td>
            </tr>
            <tr>
                <td>下载权限:</td>
                <td>
                    <select class="easyui-combobox" panelHeight="auto" style="width:100px" id="canLoadUser" name="canLoadUser">
                        <option value="">选择权限</option>
                        <option value="7">公司全体</option>
                        <option value="6">所有管理员</option>
                        <option value="4">仅超级管理员</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>选择文件：</td>
                <td><input type="file" name="file" width="120px"> </td>
            </tr>
        </table>
        <div ><span id="load_mes"></span></div>
    </form>


</div>
<!-- End of easyui-dialog -->

<!-- Begin of easyui-dialog -->
<div id="load-dialog-1" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="height:300px;width:500px; padding:20px;">
    <form id="load-form-1" method="post" class="easyui-form" >
        <table cellpadding="10">
            <tr>
                <td>标题:</td>
                <td><input class="easyui-textbox" type="text" name="name" data-options="required:true"></td>
            </tr>
            <tr>
                <td>上传文件:</td>
                <td><input class="easyui-numberbox" type="text" name="tel" data-options="required:true,validType:'phoneRex'"></td>
            </tr>
            <tr>
                <td>备注:</td>
                <td><input class="easyui-textbox" type="text" name="address" data-options="required:true"></td>
            </tr>
            <tr>
                <td>下载权限:</td>
                <td>
                    <input class="easyui-combobox" name="deptId" data-options="valueField:'id',textField:'name',url:'${pageContext.request.contextPath}/#'">
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
    function toSearchLoad() {
        var startTime = $('#startTime').datebox("getValue");
        //alert(startTime);
        var endTime = $('#endTime').datebox("getValue");
        //alert(endTime);
        //alert(searchStatus);
        var searchLoadTitle = $('#searchLoadTitle').val();
        //if (($.trim(searchName) == "" || searchName == "")&& startTime == "" && endTime == "" && searchStatus =="") {
        //   alert("请选择搜索条件");
        //   return;
        //}
        $('#load-datagrid-4').datagrid("load",{
            startTime : startTime,
            endTime : endTime,
            searchLoadTitle : searchLoadTitle
        })

        //alert(searchName);
    }

    /**
     * 清空搜索框
     */

    function clearSearchLoad(){
        $('#startTime').combo("setText",'');
        $('#startTime').combo("setValue",'');
        $("#endTime").combo("setText",'');
        $("#endTime").combo("setValue",'');
        $('#searchLoadTitle').val("");
    }
    /**
     * Name 上传文件
     */

    function addLoad(){
        $('#load-form-2').form('submit', {
            url:'${pageContext.request.contextPath}/file/upload',
            onSubmit : function() {
                return $(this).form('enableValidation').form('validate');
            },
            success:function(data){
                if(data == "ok"){
                    $.messager.alert('上传成功', '文件上传成功', 'info');
                    $('#load-dialog-2').dialog('close');
                    reloadLoad();
                }
                else
                {
                    $.messager.alert('上传失败', '文件上传失败', 'error');
                }
            }
        });
    }
    /**
     * Name 修改记录
     */
    function editLoad(){

        $('#load-form-1').form('submit', {
            url:'${pageContext.request.contextPath}/#',
            success:function(data){
                if(parseInt(data)){
                    $.messager.alert('信息提示','修改成功！','info');
                    $('#load-dialog-1').dialog('close');
                    reloadLoad();
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
    function removeLoad(){
        $.messager.confirm('信息提示','确定要删除该记录？', function(result){
            if(result){
                var items = $('#load-datagrid-4').datagrid('getSelections');
                var ids = [];
                var names = [];
                $(items).each(function(){
                    ids.push(this.id);
                });
                $(items).each(function () {
                    names.push(this.loadName);
                })
                //alert(ids);return;
                $.ajax({
                    url:'${pageContext.request.contextPath}/file/delete?ids='+ids,
                    success:function(data){
                        if(data == "ok"){
                            $.messager.alert('信息提示',names+' 删除成功！','info');
                            reloadLoad();
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
     * Name 下载
     */
    function Load(){
        var items = $('#load-datagrid-4').datagrid('getSelections');
        var ids = [];
        $(items).each(function(){
            ids.push(this.id);
        });
        $('#removeL').attr('href','${pageContext.request.contextPath}/file/down?fileId='+ids);
    }



    /**
     * Name 打开添加窗口
     */
    function openAddLoad(){
        $('#load-form-2').form('clear');
        $('#load-dialog-2').dialog({
            closed: false,
            modal:true,
            title: "上传文件",
            buttons: [{
                text: '上传',
                iconCls: 'icon-ok',
                handler: addLoad
            }, {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    $('#load-dialog-2').dialog('close');
                }
            }]
        });
    }

    /**
     * Name 打开修改窗口
     */
    function openEditLoad(){
        //$('#user-form-2').form('clear');
        var item = $('#load-datagrid-4').datagrid('getSelected');
        alert(item.id);return;
        if (item == null){
            alert("请选择要更新信息的文件");return;
        }
        $('#load-dialog-1').dialog({
            closed: false,
            modal:true,
            title: "修改文件信息",
            buttons: [{
                text: '确定',
                iconCls: 'icon-ok',
                handler: editLoad
            }, {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    $('#load-dialog-1').dialog('close');
                }
            }]
        });
        $.ajax({
            url:'${pageContext.request.contextPath}/#?id='+item.id,
            success:function(data){
                if(data != null){
                    //绑定值
                    var obj = jQuery.parseJSON(data);
                    $('#load-form-1').form('load', obj)
                    //$('#deptName').combobox("setValue",parseInt(obj.deptId));
                    // $('#jobName').combobox('setValue',parseInt(obj.jobId))
                }
                else{
                    $('#load-dialog-1').dialog('close');
                }
            }
        });
    }

    /**
     *
     * 刷新页面数据
     */

    function reloadLoad(){
        $('#load-datagrid-4').datagrid("reload");
    }
    /**
     * Name 载入数据
     */
    $('#load-datagrid-4').datagrid({
        url:'${pageContext.request.contextPath}/file/findLoadPaging.action',
        rownumbers:true,
        singleSelect:false,
        pageSize:20,
        pagination:true,
        multiSort:true,
        fitColumns:true,
        fit:true,
        columns:[[
            { checkbox:true},
            { field:'loadTitle',title:'标题',width:100,sortable:true,align:'center'},
            { field:'loadName',title:'文件名称',width:100,sortable:true,align:'center'},
            { field:'username',title:'上传用户',width:100,sortable:true,align:'center'},
            { field:'loadCreatedate',title:'上传日期',width:100,sortable:true,align:'center'},
            { field:'canLoadUser',title:'权限',width:100,sortable:true,align:'center',formatter:function (value) {
                    if (value == 7)
                        return "公司全体";
                    if (value == 6)
                        return "所有管理员";
                    if (value == 4)
                        return "仅超级管理员";
                }},
            { field:'loadRemark',title:'备注',width:100,sortable:true,align:'center'},
        ]]
    });
</script>
</body>
</html>
