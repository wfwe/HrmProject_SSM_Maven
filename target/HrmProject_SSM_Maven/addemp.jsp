<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加员工</title>
<link rel="stylesheet" type="text/css"
      href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
</head>
<body>
<div style="margin: 20px 0;"></div>
<div class="easyui-panel" title="添加部门"
     style="width: 950px; height: 600px;">
    <div style="padding: 40px 60px 20px 60px;">
        <form id="ff" class="easyui-form" method="post">
            <table cellpadding="10">
                <tr>
                    <td>姓名:</td>
                    <td><input class="easyui-textbox" type="text" name="username"
                               data-options="required:true"></td>
                    <td>卡号:</td>
                    <td><input class="easyui-numberbox" type="text" name="card_id"
                               data-options="required:true,validType:'length[6,6]'"></td>
                    <td>邮政编码:</td>
                    <td><input class="easyui-numberbox" type="text" name="post_code"
                               data-options="required:false,validType:'length[6,6]'"></td>
                </tr>
                <tr>
                    <td>电话:</td>
                    <td><input class="easyui-numberbox" type="text" name="tel"
                               data-options="required:true,validType:'phoneRex'"></td>
                    <td>QQ:</td>
                    <td><input class="easyui-numberbox" type="text" name="qq_num"
                               data-options="required:false"></td>
                    <td>Email:</td>
                    <td><input class="easyui-textbox" type="text" name="email"
                               data-options="required:true,validType:'email'"></td>
                </tr>
                <tr>
                    <td>地址:</td>
                    <td><input class="easyui-textbox" type="text" name="address"
                               data-options="required:true"></td>
                    <td>民族:</td>
                    <td><input class="easyui-textbox" type="text" name="race"
                               data-options="required:true"></td>
                    <td>生日:</td>
                    <td><input class="easyui-datebox" type="text" name="birthday"
                               data-options="formatter:myformatter,parser:myparser" id="fn"></td>
                </tr>
                <tr>
                    <td>爱好:</td>
                    <td><input class="easyui-textbox" type="text" name="hobby"
                               data-options="required:false"></td>
                    <td>专业:</td>
                    <td><input class="easyui-textbox" type="text" name="speciality"
                               data-options="required:true"></td>
                    <td>备注:</td>
                    <td><input class="easyui-textbox" type="text" name="remark"
                               data-options="required:false"></td>
                </tr>

                <tr>
                    <td>性别:</td>
                    <td><select id="sex" class="easyui-combobox" name="sex"
                                style="width: 120px;">
                        <option value="1">男</option>
                        <option value="0">女</option>
                    </select></td>
                    <td>政治面貌:</td>
                    <td><select id="party" class="easyui-combobox" name="party"
                                style="width: 120px;">
                        <option value="群众">群众</option>
                        <option value="团员">团员</option>
                        <option value="党员">党员</option>
                    </select></td>
                    <td>学历:</td>
                    <td><select id="education" class="easyui-combobox" name="education"
                                style="width: 120px;">
                        <option value="高中">高中</option>
                        <option value="专科">专科</option>
                        <option value="本科">本科</option>
                        <option value="本科以上">本科以上</option>
                    </select></td>
                </tr>
                <tr>
                    <td>部门:</td>
                    <td>    <input id="deptName" class="easyui-combobox" name="dept_name" data-options="valueField:'id',textField:'name',url:'${pageContext.request.contextPath}/FindAllDeptServlet'">
                    </td>
                    <td>职位:</td>
                    <td>    <input id="jobName" class="easyui-combobox" name="job_name" data-options="valueField:'id',textField:'name',url:'${pageContext.request.contextPath}/FindAllJobServlet'">
                    </td>
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
    //easyui使用的是ajax做表单提交
    function submitForm() {

        $('#ff').form('submit', {
            url : "AddEmpServlet",
            onSubmit : function() {
                return $(this).form('enableValidation').form('validate');
            },
            //data:ajax从服务器端返回的数据
            success : function(data) {
                if (data == "1") {
                    //以下是easyui的信息提示框：有三个参数：1.标题，2.提示信息，3.图片
                    $.messager.alert('注册成功', '恭喜你,注册成功'+data, 'info');
                } else {
                    $.messager.alert('注册失败', '对不起,注册失败了'+data, 'error');
                }
            }

        });
    }
    //置空的方法
    function clearForm() {
        $('#ff').form('clear');

    }


    function myformatter(date){
        var y = date.getFullYear();
        var m = date.getMonth()+1;
        var d = date.getDate();
        return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
    }
    function myparser(s){
        if (!s) return new Date();
        var ss = (s.split('-'));
        var y = parseInt(ss[0],10);
        var m = parseInt(ss[1],10);
        var d = parseInt(ss[2],10);
        if (!isNaN(y) && !isNaN(m) && !isNaN(d)){
            return new Date(y,m-1,d);
        } else {
            return new Date();
        }
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
    //电话验证
    $.extend($.fn.validatebox.defaults.rules, {
        phoneRex: {
            validator: function(value){
                var rex=/^1[3-8]+\d{9}$/;
                if(rex.test(value))
                {

                    return true;
                }else
                {

                    return false;
                }

            },
            message: '请输入正确手机号码格式'
        }
    });

</script>
</html>