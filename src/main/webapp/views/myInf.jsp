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
        <table cellpadding="10">
            <tr>
                <td><input type="hidden" name="id" id="id"></td>
            </tr>
            <tr>
                <td>姓名:</td>
                <td><input class="easyui-validatebox easyui-textbox" type="text" name="name" data-options="required:true"></td>
                <td>卡号:</td>
                <td><input class="easyui-validatebox easyui-numberbox" type="text" name="cardId" data-options="required:true,validType:'length[6,12]'"></td>
                <td>邮政编码:</td>
                <td><input class="easyui-numberbox" type="text" name="postCode" ></td>
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
                    <input id="dept" class=" easyui-combobox" name="deptId" data-options="valueField:'id',textField:'name',url:'${pageContext.request.contextPath}/findAllDeptInf.action'" >
                </td>
                <td>职位:</td>
                <td>
                    <input id="job" class="easyui-combobox" name="jobId" data-options="valueField:'id',textField:'name',url:'${pageContext.request.contextPath}/findAllJobInf.action'">
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <input type="button" class="class="class="easyui-textbox" value="申请修改" onclick="toChange()">
                </td>
            </tr>
        </table>
    </form>

<script type="text/javascript">

    function init(){
        $.ajax({
            url:'${pageContext.request.contextPath}/findEmpInfByUserName.action?loginName='+${userName},
            success:function(data){
                if(data != null){
                    //绑定值
                    var obj = jQuery.parseJSON(data);
                    $('#myInf').form('load', obj)
                    $('#dept').combobox("setValue",parseInt(obj.deptId));
                    $('#job').combobox('setValue',parseInt(obj.jobId));
                    //$("input:radio[name=sex][value=obj.sex]").attr("checked",true);
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
</script>

</body>
</html>
