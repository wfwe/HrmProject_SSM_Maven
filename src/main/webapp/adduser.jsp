<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加用户</title>
<link rel="stylesheet" type="text/css"
	href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
</head>
<body>
	<div style="margin: 20px 0;"></div>
	<div class="easyui-panel" title="添加用户"
		style="width: 700px; height: 500px;">
		<div style="padding: 40px 60px 20px 60px;">
			<form id="ff" class="easyui-form" method="post">
				<table cellpadding="10">
					<tr>
						<td>姓名:</td>
						<td><input class="easyui-textbox" type="text" name="username"
							data-options="required:true"></td>
						<td>登录名:</td>
						<td><input class="easyui-textbox" type="text"
							name="loginname"
							data-options="required:true,validType:'length[3,16]'"></td>
					</tr>

					<tr>
						<td>密码:</td>
						<td><input class="easyui-textbox" type="password"
							name="password" id="password"
							data-options="required:true,validType:'length[6,16]'"></td>
						<td>确认密码:</td>
						<td><input class="easyui-textbox" type="password"
							name="password2" required="true" validType="equalTo['#password']"></td>
					</tr>
					<tr>
						<td>角色:</td>
						<td><select id="cc" class="easyui-combobox" name="status"
							style="width: 120px;">
								<option value="0">公司员工</option>
								<option value="1">普通管理员</option>
								<option value="2">超级管理员</option>

						</select></td>

					</tr>
				</table>
			</form>

			<div style="text-align: left; padding: 20px; margin-top: 50px">
				<a href="javascript:void(0)" class="easyui-linkbutton"
					onclick="submitForm()">注册</a> &nbsp;&nbsp;&nbsp;
				<a href="javascript:void(0)" class="easyui-linkbutton"
					onclick="clearForm()">重置</a>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript">
	//easyui使用的是ajax做表单提交
	function submitForm() {
		$('#ff').form('submit', {
			url : "addUserInf.action",
			onSubmit : function() {
				return $(this).form('enableValidation').form('validate');
			},
			//data:ajax从服务器端返回的数据
			 success : function(data) {
	                if (data == "1") {
	                	//以下是easyui的信息提示框：有三个参数：1.标题，2.提示信息，3.图片
	                    $.messager.alert('注册成功', '恭喜你,注册成功', 'info');
	                } else {
	                    $.messager.alert('注册失败', '对不起,注册失败了', 'error');
	                }
	            }

		});
	}
	//置空的方法
	function clearForm() {
		$('#ff').form('clear');
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
</script>
</html>