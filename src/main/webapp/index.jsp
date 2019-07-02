<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="copyright" content="All Rights Reserved, Copyright (C) 2013, Wuyeguo, Ltd." />
    <title>人事管理系统</title>
    <link rel="stylesheet" type="text/css" href="easyui/1.3.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="css/wu.css" />
    <link rel="stylesheet" type="text/css" href="css/icon.css" />
    <script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="easyui/1.3.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="easyui/1.3.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="js/common.js"></script>
    <!--引入引入kindeditor编辑器相关文件-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/kindeditor-4.1.10/themes/default/default.css"/>
    <script charset="utf-8" src="${pageContext.request.contextPath}/kindeditor-4.1.10/kindeditor-all.js"></script>
    <script charset="utf-8" src="${pageContext.request.contextPath}/kindeditor-4.1.10/lang/zh_CN.js"></script>
    <script type="text/javascript" src="https://unpkg.com/xlsx@0.14.0/dist/xlsx.full.min.js"></script>




</head>
<body class="easyui-layout">
<!-- begin of header -->
<div class="wu-header" data-options="region:'north',border:false,split:true">
    <div class="wu-header-left">
        <h1>人事管理系统</h1>
    </div>
    <div class="wu-header-right">
        <p></p>
        <p id="pTime"></p>
        <p>尊敬的
            <span><strong class="easyui-tooltip" title="2条未读消息">${pageContext.session.getAttribute("realName")}</strong>
                <c:if test="${status == 1}">员工</c:if><c:if test="${status == 2}">管理员</c:if><c:if test="${status == 3}">超级管理员</c:if>
                ，欢迎您！&nbsp;&nbsp;</span>
            <a href="${pageContext.request.contextPath}/index.action">网站首页</a>|<a href="#">帮助中心</a>|<a href="${pageContext.request.contextPath}/quitLogin.action">安全退出</a></p>

    </div>
</div>
<!-- end of header -->
<!-- begin of sidebar -->
<div class="wu-sidebar" data-options="region:'west',split:true,border:true,title:'公司人事信息管理'">
    <div class="easyui-accordion" data-options="border:false,fit:true">
        <div title="个人中心" data-options="iconCls:'icon-folder-user'" style="padding:5px;">
            <ul class="easyui-tree wu-side-tree">
                    <li iconCls="icon-user"><a href="javascript:void(0)" data-icon="icon-user" data-link="views/myInf.jsp" iframe="0">个人信息</a></li>
            </ul>
        </div>
        <div title="管理中心" data-options="iconCls:'icon-application-cascade'" style="padding:5px;">
            <ul class="easyui-tree wu-side-tree">
                <c:if test="${status == 3}">
                    <li iconCls="icon-user"><a href="javascript:void(0)" data-icon="icon-user" data-link="userTab.jsp" iframe="0">用户管理</a></li>
                </c:if>
                <c:if test="${status >= 2}">
                    <li iconCls="icon-group"><a href="javascript:void(0)" data-icon="icon-group" data-link="empTab.jsp" iframe="0">员工管理</a></li>
                </c:if>
                <li iconCls="icon-book"><a href="javascript:void(0)" data-icon="icon-book" data-link="deptTab.jsp" iframe="0">部门管理</a></li>
                <li iconCls="icon-webcam"><a href="javascript:void(0)" data-icon="icon-webcam" data-link="jobTab.jsp" iframe="0">职位管理</a></li>
            </ul>
        </div>
        <div title="文件管理" data-options="iconCls:'icon-creditcards'" style="padding:5px;">
            <ul class="easyui-tree wu-side-tree">
                <li iconCls="icon-world-edit"><a href="javascript:void(0)" data-icon="icon-world-edit" data-link="views/loadTab.jsp" iframe="0">文件操作</a></li>
            </ul>
        </div>
        <div title="公告管理" data-options="iconCls:'icon-application-form-edit'" style="padding:5px;">
            <ul class="easyui-tree wu-side-tree">
                <li iconCls="icon-report-go"><a href="javascript:void(0)" data-icon="icon-report-go" data-link="views/noticeTab.jsp" iframe="0">公告操作</a></li>
        <c:if test="${status >= 2}">
                <li iconCls="icon-report-add"><a href="javascript:void(0)" data-icon="icon-report-add" data-link="views/addNotice.jsp" iframe="0" >添加公告</a></li>
        </c:if>
            </ul>
        </div>
<c:if test="${status  == 3}">
        <div title="系统设置" data-options="iconCls:'icon-wrench'" style="padding:5px;">
            <ul class="easyui-tree wu-side-tree">
                <li iconCls="icon-cog"><a href="javascript:void(0)" data-icon="icon-cog" data-link="views/log.jsp" iframe="0">日志操作</a></li>
            </ul>
        </div>
</c:if>
    </div>
</div>
<!-- end of sidebar -->
<!-- begin of main -->
<div class="wu-main" data-options="region:'center'">
    <div id="wu-tabs" class="easyui-tabs" data-options="border:false,fit:true">
        <div title="首页" data-options="href:'welcome.jsp',closable:false,iconCls:'icon-tip',cls:'pd3'"></div>
    </div>
</div>
<!-- end of main -->
<!-- begin of footer -->
<div class="wu-footer" data-options="region:'south',border:true,split:true">
    ©2019-2059 五邑大学计算机通信网络专业&nbsp;&nbsp;&nbsp;javaEE技术开发
</div>
<!-- end of footer -->
<script type="text/javascript">
    $(function(){
        $('.wu-side-tree a').bind("click",function(){
            var title = $(this).text();
            var url = $(this).attr('data-link');
            var iconCls = $(this).attr('data-icon');
            var iframe = $(this).attr('iframe')==1?true:false;
            addTab(title,url,iconCls,iframe);
        });
    })

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
            + "号&nbsp;&nbsp;" + H + ":" + m + ":" + s
            + "&nbsp;&nbsp星期" + "日一二三四五六".charAt(d.getDay());
        ;
        //将控件的内容修改为处理好的字符串
        $("#pTime").html(t);
    }

    /**
     * Name 载入树形菜单
     */
    $('#wu-side-tree').tree({
        url:'temp/menu.json',
        cache:false,
        onClick:function(node){
            var url = node.attributes['url'];
            if(url==null || url == ""){
                return false;
            }
            else{
                addTab(node.text, url, '', node.attributes['iframe']);
            }
        }
    });

    /**
     * Name 选项卡初始化
     */
    $('#wu-tabs').tabs({
        tools:[{
            iconCls:'icon-reload',
            border:false,
            handler:function(){
                $('#wu-datagrid').datagrid('reload');
            }
        }]
    });

    /**
     * Name 添加菜单选项
     * Param title 名称
     * Param href 链接
     * Param iconCls 图标样式
     * Param iframe 链接跳转方式（true为iframe，false为href）
     */
    function addTab(title, href, iconCls, iframe){
        var tabPanel = $('#wu-tabs');
        if(!tabPanel.tabs('exists',title)){
            var content = '<iframe scrolling="auto" frameborder="0"  src="'+ href +'" style="width:100%;height:100%;"></iframe>';
            if(iframe){
                tabPanel.tabs('add',{
                    title:title,
                    content:content,
                    iconCls:iconCls,
                    fit:true,
                    cls:'pd3',
                    closable:true
                });
            }
            else{
                tabPanel.tabs('add',{
                    title:title,
                    href:href,
                    iconCls:iconCls,
                    fit:true,
                    cls:'pd3',
                    closable:true
                });
            }
        }
        else
        {
            tabPanel.tabs('select',title);
        }
    }
    /**
     * Name 移除菜单选项
     */
    function removeTab(){
        var tabPanel = $('#wu-tabs');
        var tab = tabPanel.tabs('getSelected');
        if (tab){
            var index = tabPanel.tabs('getTabIndex', tab);
            tabPanel.tabs('close', index);
        }
    }
</script>
</body>
</html>
