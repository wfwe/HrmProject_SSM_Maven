<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/6/30
  Time: 18:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人信息页</title>
</head>
<body>
    <form id="myInf" method="post" class="easyui-form" >
        <table cellpadding="10" align="center" style="border-collapse:separate; border-spacing:18px;padding-top: 70px;font-family:'微软雅黑';font-size: 14px";>
            <tr>
                <td><input type="hidden" name="id" id="id"></td>
            </tr>
            <tr>
                <td >姓名:</td>
                <td><span id="pName"></span> </td>

                <td>员工号:</td>
                <td>
                    <span id="pCardId"></span>
                </td>
            </tr>
            <tr>
                <td>电话:</td>
                <td><input class="easyui-validatebox easyui-numberbox" type="text" name="tel" data-options="required:true,validType:'phoneRex'"></td>
                <td>QQ:</td>
                <td><input class="easyui-numberbox" type="text" name="qqNum"></td>
                <td>Email:</td>
                <td><input class="easyui-validatebox easyui-textbox" type="text" name="email" data-options="required:true,validType:'email'"></td>
            </tr>
            <tr>
                <td>地址:</td>
                <td><input class="easyui-validatebox easyui-textbox" type="text" name="address" data-options="required:true"></td>
                <td>民族:</td>
                <td><input class="easyui-validatebox easyui-textbox" type="text" name="race" data-options="required:true"></td>
                <td>生日:</td>
                <td><input class="easyui-datebox" type="text" name="birthday" ></td>
            </tr>
            <tr>
                <td>爱好:</td>
                <td><input class="easyui-textbox" type="text" name="hobby" ></td>
                <td>专业:</td>
                <td><input class="easyui-textbox" type="text" name="speciality" ></td>
                <td>备注:</td>
                <td><input class="easyui-textbox" type="text" name="remark" ></td>
            </tr>

            <tr>
                <td>性别:</td>
                <td>
                    <input type="radio" name="sex"  checked="checked" value="0"><label>女</label></input>
                    <input type="radio" name="sex"  value="1"><label>男</label></input>
                </td>
                <td>政治面貌:</td>
                <td><select id="party" class=" easyui-combobox" name="party" style="width: 120px;" >
                    <option value="群众">群众</option>
                    <option value="团员">团员</option>
                    <option value="党员">党员</option>
                </select>
                </td>
                <td>学历:</td>
                <td><select id="education" class=" easyui-combobox" name="education" style="width: 120px;" >
                    <option value="小学">小学</option>
                    <option value="初中">初中</option>
                    <option value="高中">高中</option>
                    <option value="专科">专科</option>
                    <option value="本科">本科</option>
                    <option value="硕士">硕士</option>
                    <option value="博士">博士</option>
                </select>
                </td>
            </tr>
            <tr>
                <td>部门:</td>
                <td>
                    <span id="deptId"></span>
                </td>
                <td>职位:</td>
                <td>
                   <span id="jobId"></span>
                </td>
                <td>邮政编码:</td>
                <td><span id="pPostCode"></span></td>
            </tr>
            <tr>
                <td colspan="3">
                    <input type="button" class="easyui-textbox" value="修改" onclick="toChange()">
                </td>
                <td colspan="2">
                    <input type="button" class="easyui-textbox" value="修改密码" onclick="rePasswordDialog()">
                </td>
            </tr>
        </table>
    </form>

    <!-- Begin of easyui-dialog -->
    <div id="rePassword-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="height:300px;width:500px; padding:20px;">
        <form id="rePassword-form" method="post" class="easyui-form" >
            <table>
                <tr id="loginNameTr">
                    <td align="right">旧密码:</td>
                    <td><input type="password"id="oldPassword" name="oldPassword" class="easyui-validatebox wu-text" data-options="required:true,validType:'length[6,16]'"/></td>
                </tr>
                <tr id="passwordTr">
                    <td align="right">新密 码:</td>
                    <td><input type="password" name="newPassword" class="easyui-validatebox wu-text" id="newPassword" data-options="required:true,validType:'length[6,16]'"/></td>
                </tr>
                <tr id="rePasswordTr">
                    <td valign="right" align="right">确认密码:</td>
                    <td><input type="password" name="reNewPassword" id="password2" class="easyui-validatebox wu-text" required="true" validType="equalTo['#newPassword']"/></td>
                </tr>
            </table>
        </form>
    </div>
    <!-- End of easyui-dialog -->

<script type="text/javascript">

    function init(){
        $.ajax({
            url:'${pageContext.request.contextPath}/findEmpInfByUserName.action?loginName='+${userName},
            success:function(data){
                if(data != null){
                    //绑定值
                    var obj = jQuery.parseJSON(data);
                    $('#myInf').form('load', obj);

                    $('#deptId').text(obj.deptName);
                    $('#jobId').text(obj.jobName);
                    $('#pPostCode').text(obj.postCode);
                    $('#pCardId').text(obj.cardId);
                    $('#pName').text(obj.name);
                    if (obj.sex == 0){
                        $("[name='sex'][value='0']").prop("checked", "checked");
                    }else{
                        $("[name='sex'][value='1']").prop("checked", "checked");
                    }
                }
                else{

                }
            }
        });
    }

    $(function () {
        init();
    })

    function toChange() {
        $('#myInf').form('submit', {
            url:'${pageContext.request.contextPath}/editEmpInf.action',
            success:function(data){
                if(data == "ok"){
                    $.messager.alert('信息提示','申请修改成功！','info');
                    //init();
                }
                else
                {
                    $.messager.alert('信息提示','修改失败！','info');
                }
            }
        });
    }

    function rePasswordDialog() {
        $('#rePassword-form').form('clear');
        $('#rePassword-dialog').dialog({
            closed: false,
            modal: true,
            title: "修改密码",
            buttons: [{
                text: '修改',
                iconCls: 'icon-ok',
                handler: changePassword
            }, {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    $('#rePassword-dialog').dialog('close');
                }
            }]
        });
    }

    /**
     * Name 修改
     */
    function changePassword(){
        $('#rePassword-form').form('submit', {
            url:'${pageContext.request.contextPath}/changePassword.action',
            onSubmit : function() {
                return $(this).form('enableValidation').form('validate');
            },
            success:function(data){
                if(data == "ok"){
                    $.messager.alert('修改成功', '密码修改成功', 'info');
                    $('#rePassword-dialog').dialog('close');
                }
                else
                {
                    $.messager.alert('修改失败', '密码修改失败', 'error');
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
</script>

</body>
</html>
