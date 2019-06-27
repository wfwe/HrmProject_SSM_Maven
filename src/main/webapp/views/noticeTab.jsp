<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/6/24
  Time: 15:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>articleManger</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/1.3.3/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/1.3.3/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/1.3.3/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/1.3.3/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/1.3.3/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>

</head>
<body style="margin:1px;" id="ff">
<table id="dg" title="公告管理" class="easyui-datagrid" pagination="true"
       rownumbers="true" fit="true" data-options="pageSize:10"
       url="${pageContext.request.contextPath}/notice/findPaging" toolbar="#tb">
    <thead data-options="frozen:true">
    <tr>
        <th field="cb" checkbox="true" align="center"></th>
        <th field="id" width="10%" align="center" hidden="true">编号</th>
        <th field="noticeTitle" width="300" align="center">标题</th>
        <th field="username" width="150" align="center">添加人</th>
        <th field="noticeCreatedate" width="200" align="center">创建时间</th>
        <th field="content" width="100" align="center" formatter="formatHref">操作</th>
    </tr>
    </thead>
</table>
<div id="tb">

    <div>
        <a href="javascript:openArticleModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
        <a href="javascript:removeNotice()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
        <a href="javascript:clearNoticeSearch()" class="easyui-linkbutton" iconCls="icon-undo" plain="true">清空</a>
        <a href="javascript:reloadNotice()" class="easyui-linkbutton" iconCls="icon-reload" plain="true">刷新</a>
    </div>
    <div class="wu-toolbar-search">
        <label>起始时间：</label><input id="startTime" name="startTime" class="easyui-datebox" style="width:100px">
        <label>结束时间：</label><input id="endTime" name="endTime" class="easyui-datebox" style="width:100px">
        <label>用户角色：</label>
        <label>名字：</label><input id="searchNoticeTitle" name="noticeTitle" class="wu-text" style="width:100px">
        <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="toSearchNotice()">开始检索</a>
    </div>
</div>

<div id="dlg" class="easyui-dialog"
     style="width: 850px;height:555px;padding: 10px 20px; position: relative; z-index:1000;"
     closed="true" buttons="#dlg-buttons" >
    <form id="fm" method="post">
        <table cellspacing="8px">
            <tr>
                <td>标题：</td>
                <td><input type="text" id="noticeTitle" name="noticeTitle" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font>
                </td>
            </tr>
            <tr>
                <td>添加人：</td>
                <td>
                    <input type="text" id="userName" name="userName"/>
                </td>
            </tr>
            <tr>
                <td>详细内容</td>
                <td id="editor">
                </td>
            </tr>
        </table>
    </form>
</div>



<script type="text/javascript">

    /**
     * 搜索函数
     */
    function toSearchNotice() {
        var startTime = $('#startTime').datebox("getValue");
        //alert(startTime);
        var endTime = $('#endTime').datebox("getValue");
        var searchNoticeTitle = $('#searchNoticeTitle').val();
        //if (($.trim(searchName) == "" || searchName == "")&& startTime == "" && endTime == "" && searchStatus =="") {
        //   alert("请选择搜索条件");
        //   return;
        //}
        $('#dg').datagrid("load",{
            startTime : startTime,
            endTime : endTime,
            noticeTitle : searchNoticeTitle
        })

        //alert(searchName);
    }

    /**
     * 清空搜索框
     */

    function clearNoticeSearch(){
        $('#startTime').combo("setText",'');
        $('#startTime').combo("setValue",'');
        $("#endTime").combo("setText",'');
        $("#endTime").combo("setValue",'');
        $('#searchNoticeTitle').val("");
        toSearchNotice();
    }

    var url;
    function searchArticle() {
        $("#dg").datagrid('load', {
            "articleTitle": $("#articleTitle").val(),
        });
    }

    /**
     * Name 删除记录
     */
    function removeNotice(){
        $.messager.confirm('信息提示','确定要删除该记录？', function(result){
            if(result){
                var items = $('#dg').datagrid('getSelections');
                var ids = [];
                var names = [];
                $(items).each(function(){
                    ids.push(this.id);
                });
                $(items).each(function () {
                    names.push(this.noticeTitle);
                })
                //alert(ids);return;
                $.ajax({
                    url:'${pageContext.request.contextPath}/notice/delete?ids='+ids,
                    success:function(data){
                        if(data == "ok"){
                            $.messager.alert('信息提示',names+' 删除成功！','info');
                            reloadNotice();
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




    function openArticleModifyDialog() {
        var selectedRows = $("#dg").datagrid('getSelections');
        if (selectedRows.length != 1) {
            $.messager.alert("系统提示", "请选择一条要编辑的数据！");
            return;
        }
        var row = selectedRows[0];
        $("#dlg").dialog("open").dialog("setTitle", "修改信息");
        $('#fm').form('load', row);
        var html = '<div id="myEditor" name="articleContent"></div>';
        $('#editor').append(html);
        ResetEditor(editor);
        var ue = UE.getEditor('myEditor');
        ue.setContent(row.articleContent);
        url = "${pageContext.request.contextPath}/article/save.do?id="
            + row.id;
    }

    function formatHref(val, row) {
        return "<a href='${pageContext.request.contextPath}/notice/query/" + row.id + "' target='_blank'>查看详情</a>";
    }

    function reloadNotice() {
        $('#dg').datagrid("reload");
    }


</script>
</body>
</html>
