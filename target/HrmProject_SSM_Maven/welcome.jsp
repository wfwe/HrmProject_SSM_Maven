<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/6/3
  Time: 23:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>

</head>
<body>
<style>
    .first {
        width: 30%;
        float:left;
        height: 100px;
        border: 0px solid #3B6273;
            }
    .second {
        width: 70%;
        float:left;
        height: 100px;
        border: 0px solid #3B6273;
            }
</style>

    <div align="center" style="padding-top: 30px"><h1>欢迎使用GavinHrm管理系统</h1></div>
<div class="first" style="padding-top: 100px">
    <p align="center"><h2>系统概览</h2></p>
    <p><h3>开发作者：Gavin</h3></p>
    <p><h3>网站域名：hrm.dfeng.xyz</h3></p>
    <p><h3>框架：前端EasyUI 后端SSM Druid</h3></p>
    <p><h3>开发工具：IntelliJ IDEA 2018.1  Maven</h3></p>
    <P><h3>服务器环境：apache-tomcat-9.0.21</h3></P>
    <p><h3>数据库版本：mysql 5.7</h3></p>
    <p><h3>版本管理工具：Git</h3></p>
    <p><h3>最大上传限制：100M</h3></p>
</div>
<div class="second">
    <p align="center" style="color: red;font-size: 20px;font-family: 微软雅黑">最新公告</p>
    <div id="notice"></div>
</div>
<script type="text/javascript">
    $(function () {
        $.ajax({
            url:'${pageContext.request.contextPath}/notice/findNew/'+${status},

            success:function (data) {
                if (data != "" || data != null){
                    $('#notice').html(data);
                }else{
                    $('#notice').html("暂无最新公告");
                }
                //alert(data);

                // var o = jQuery.parseJSON(data);
                // $('#notice').html(o);


                    //$('#notice').html = "无最新公告";
            }
        })
    })
</script>
</body>
</html>
