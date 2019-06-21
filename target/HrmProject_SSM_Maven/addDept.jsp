<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/6/3
  Time: 21:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>添加部门</title>
    <link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
    <script type="text/javascript" src="easyui/jquery.min.js"></script>
    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
</head>
<body>
<div style="margin: 20px 0;"></div>
<div class="easyui-panel" title="添加部门"
     style="width: 700px; height: 500px;">
    <div style="padding: 40px 60px 20px 60px;">
        <form id="ff" class="easyui-form" method="post" id="deptTb">
            <table cellpadding="10">
                <tr>
                    <td>部门名:</td>
                    <td><input class="easyui-textbox" type="text" name="deptName"
                               data-options="required:true"></td>
                    <td>备注:</td>
                    <td><input class="easyui-textbox" type="text"
                               name="remark"
                               data-options="required:false"></td>
                </tr>
            </table>
        </form>

        <div style="text-align: left; padding: 20px; margin-top: 50px">
            <a href="javascript:void(0)" class="easyui-linkbutton"
               onclick="submitForm()">添加</a> &nbsp;&nbsp;&nbsp; <a
                href="javascript:void(0)" class="easyui-linkbutton"
                onclick="clearForm()">重置</a>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    //ajax表单提交
    function submitForm() {
        $('#ff').form('submit',{
            url:"AddDeptServlet",
            onSubmit : function() {
                return $(this).form('enableValidation').form('validate');
            },//data:ajax从服务器端返回的数据
            success : function(data) {
                if (data == "1") {
                    //以下是easyui的信息提示框：有三个参数：1.标题，2.提示信息，3.图片
                    $.messager.alert('添加成功', '部门添加成功', 'info');
                } else {
                    $.messager.alert('添加失败', '部门添加失败', 'error');
                }
            }

        });

        //置空的方法
        function clearForm() {
            $('#ff').form('clear');
        }
    }
</script>
</html>
