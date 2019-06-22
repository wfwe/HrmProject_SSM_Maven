<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<!-- begin of header -->
<div class="wu-header" data-options="region:'north',border:false,split:true">
    <div class="wu-header-left">
        <h1>人事管理系统</h1>
    </div>
    <div class="wu-header-right">
        <p><strong class="easyui-tooltip" title="2条未读消息">${pageContext.session.getAttribute("userName")}</strong>，欢迎您！</p>
        <p><a href="${pageContext.request.contextPath}/index.jsp">网站首页</a>|<a href="#">帮助中心</a>|<a href="${pageContext.request.contextPath}/quitLogin.action">安全退出</a></p>
    </div>
</div>
<!-- end of header -->
<!-- begin of sidebar -->
<div class="wu-sidebar" data-options="region:'west',split:true,border:true,title:'公司人事信息管理'">
    <div class="easyui-accordion" data-options="border:false,fit:true">
        <div title="管理中心" data-options="iconCls:'icon-application-cascade'" style="padding:5px;">
            <ul class="easyui-tree wu-side-tree">
                <li iconCls="icon-users"><a href="javascript:void(0)" data-icon="icon-users" data-link="userTab.jsp" iframe="0">用户管理</a></li>
                <li iconCls="icon-user-group"><a href="javascript:void(0)" data-icon="icon-user-group" data-link="temp/empTab.html" iframe="0">员工管理</a></li>
                <li iconCls="icon-book"><a href="javascript:void(0)" data-icon="icon-book" data-link="temp/deptTab.html" iframe="0">部门管理</a></li>
                <li iconCls="icon-cog"><a href="javascript:void(0)" data-icon="icon-cog" data-link="temp/jobTab.html" iframe="0">职位管理</a></li>
            </ul>
        </div>
        <div title="下载管理" data-options="iconCls:'icon-application-form-edit'" style="padding:5px;">
            <ul class="easyui-tree wu-side-tree">
                <li iconCls="icon-chart-organisation"><a href="javascript:void(0)" data-icon="icon-chart-organisation" data-link="layout-3.html" iframe="0">文档操作</a></li>
            </ul>
        </div>
        <div title="公告管理" data-options="iconCls:'icon-creditcards'" style="padding:5px;">
            <ul class="easyui-tree wu-side-tree">
                <li iconCls="icon-chart-organisation"><a href="javascript:void(0)" data-icon="icon-chart-organisation" data-link="layout-3.html" iframe="0">公告操作</a></li>
            </ul>
        </div>
        <div title="系统设置" data-options="iconCls:'icon-wrench'" style="padding:5px;">
            <ul class="easyui-tree wu-side-tree">
                <li iconCls="icon-chart-organisation"><a href="javascript:void(0)" data-icon="icon-chart-organisation" data-link="layout-3.html" iframe="0">日志操作</a></li>
            </ul>
        </div>
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
