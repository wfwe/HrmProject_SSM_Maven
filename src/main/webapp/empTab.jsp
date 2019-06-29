<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/6/23
  Time: 15:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="copyright" content="" />
    <title>员工管理</title>
    <link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
    <script type="text/javascript" src="easyui/jquery.min.js"></script>
    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="https://unpkg.com/xlsx@0.14.0/dist/xlsx.full.min.js"></script>
</head>
<body class="easyui-layout">

<div class="easyui-layout" data-options="fit:true">
    <!-- Begin of toolbar -->
    <div id="emp-toolbar-4">
        <div class="wu-toolbar-button">
            <a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="openEmpAdd()" plain="true">添加</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-edit" onclick="openEmpEdit()" plain="true">修改</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-remove" onclick="removeEmp()" plain="true">删除</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-reload" onclick="toSearchEmp()" plain="true">刷新</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="clearSearchEmp()" plain="true">清空</a>
        </div>
        <div class="user-toolbar-search">
            <label>开始时间：</label><input id="startTimeEmp" name="startTime" class="easyui-datebox" style="width:100px">
            <label>结束时间：</label><input id="endTimeEmp" name="endTime" class="easyui-datebox" style="width:100px">
            <label>部门：</label>
            <select class="easyui-combobox" panelHeight="auto" style="width:100px" id="searchDept" data-options="valueField:'id',textField:'name',url:'${pageContext.request.contextPath}/findAllDeptInf.action'">
                <option value="">选择部门</option>
            </select>
            <label>职位：</label>
            <select class="easyui-combobox" panelHeight="auto" style="width:100px" id="searchJob" data-options="valueField:'id',textField:'name',url:'${pageContext.request.contextPath}/findAllJobInf.action'">
                <option value="">选择职位</option>
            </select>
            <label>姓名：</label><input id="searchNameEmp" name="searchName" class="wu-text" style="width:100px">
            <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="toSearchEmp()">开始检索</a>
            <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-save" onclick="tableToExcel()">导出</a>
        </div>
    </div>
    <!-- End of toolbar -->
    <table id="emp-datagrid-4" class="easyui-datagrid" toolbar="#emp-toolbar-4"></table>
</div>
<!-- Begin of easyui-dialog -->
<div id="emp-dialog-2" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="height:450px;width:750px; padding:20px;">
    <form id="emp-form-2" method="post" class="easyui-form" >
        <table cellpadding="10">
            <tr>
                <td>姓名:</td>
                <td><input class="easyui-validatebox easyui-textbox" type="text" name="name" data-options="required:true"></td>
                <td>员工号:</td>
                <td><input class="easyui-numberbox" type="text" name="cardId" data-options="required:true,validType:'length[6,12]'"></td>
                <td>部门:</td>
                <td>
                    <input id="deptId" class="easyui-combobox" name="deptId" data-options="valueField:'id',textField:'name',url:'${pageContext.request.contextPath}/findAllDeptInf.action'" >
                </td>
            </tr>
            <tr>
                <td>性别:</td>
                <td>
                    <input type="radio" name="sex"  value="1"><label>男</label></input>
                    <input type="radio" name="sex"  checked="checked" value="0"><label>女</label></input>
                    </select>
                </td>
                <td>政治面貌:</td>
                <td><select  class="easyui-combobox" name="party" style="width: 120px;" id="pa">

                </select>
                </td>
                <td>学历:</td>
                <td><select  class="easyui-combobox" name="education" style="width: 120px;" id="ed">
                </select>
                </td>
            </tr>
            <tr>
                <td>电话:</td>
                <td><input class="easyui-numberbox" type="text" name="tel" data-options="required:true,validType:'phoneRex'"></td>
                <td>Email:</td>
                <td><input class="easyui-validatebox easyui-textbox" type="text" name="email" data-options="required:true,validType:'email'"></td>
                <td>职位:</td>
                <td>
                    <input  id="jobId" class="easyui-combobox" name="jobId" data-options="valueField:'id',textField:'name',url:'${pageContext.request.contextPath}/findAllJobInf.action'">
                </td>
            </tr>
            <tr>
                <td>地址:</td>
                <td><input class="easyui-validatebox easyui-textbox" type="text" name="address" data-options="required:true"></td>
                <td>民族:</td>
                <td><input class="easyui-validatebox easyui-textbox" type="text" name="race" data-options="required:true"></td>
                <td>生日:</td>
                <td><input class=" easyui-datebox" type="text" name="birthday" ></td>
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
                <td>邮政编码:</td>
                <td><input class="easyui-numberbox" type="text" name="postCode" ></td>
                <td>QQ:</td>
                <td><input class="easyui-numberbox" type="text" name="qqNum" ></td>
            </tr>
        </table>
    </form>
</div>
<!-- End of easyui-dialog -->

<!-- Begin of easyui-dialog -->
<div id="emp-dialog-1" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="height:450px;width:750px; padding:20px;">
    <form id="emp-form-1" method="post" class="easyui-form" >
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
                    <input id="deptName" class=" easyui-combobox" name="deptId" data-options="valueField:'id',textField:'name',url:'${pageContext.request.contextPath}/findAllDeptInf.action'" >
                </td>
                <td>职位:</td>
                <td>
                    <input id="jobName" class="easyui-combobox" name="jobId" data-options="valueField:'id',textField:'name',url:'${pageContext.request.contextPath}/findAllJobInf.action'">
                </td>
            </tr>
        </table>
    </form>
</div>
<!-- End of easyui-dialog -->
<script type="text/javascript">

    /**
     * Name 载入数据
     */
    $('#emp-datagrid-4').datagrid({
        url:'${pageContext.request.contextPath}/findEmpInfPaging.action',
        rownumbers:true,
        singleSelect:false,
        pageSize:20,
        pagination:true,
        multiSort:true,
        fitColumns:true,
        fit:true,
        columns:[[
            { checkbox:true},
            { field:'name',title:'姓名',width:100,sortable:true,align:'center'},
            { field:'deptName',title:'部门',width:100,sortable:true,align:'center'},
            { field:'jobName',title:'职位',width:100,sortable:true,align:'center'},
            { field:'cardId',title:'员工号',width:100,sortable:true,align:'center'},
            { field:'sex',title:'性别',width:50,sortable:true,align:'center',formatter:function (value) {
                    if (value == 0)
                        return "女";
                    if (value == 1)
                        return "男";
                }},
            { field:'tel',title:'电话',width:150,sortable:true,align:'center'},
            { field:'createDate',title:'入职日期',width:100,sortable:true,align:'center'}
        ]]
    });

    /**
     * 搜索函数
     */
    function toSearchEmp() {
        var startTime = $('#startTimeEmp').datebox("getValue");
        //alert(startTime);
        var endTime = $('#endTimeEmp').datebox("getValue");
        //alert(endTime);
        var searchDept = $("#searchDept").combobox("getValue");
        //alert(searchStatus);
        var searchName = $('#searchNameEmp').val();
        var searchJob = $('#searchJob').combobox("getValue");
        //if (($.trim(searchName) == "" || searchName == "")&& startTime == "" && endTime == "" && searchStatus =="") {
        //   alert("请选择搜索条件");
        //   return;
        //}
        var data =$('#emp-datagrid-4').datagrid("load",{
            startTime : startTime,
            endTime : endTime,
            searchDept : searchDept,
            searchJob : searchJob,
            searchName : searchName
        })

        //alert(searchName);
    }

    /**
     * 清空搜索框
     */

    function clearSearchEmp(){
        $('#startTimeEmp').combo("setText",'');
        $('#startTimeEmp').combo("setValue",'');
        $('#searchDept').combobox("setValue","");
        $('#searchJob').combobox("setValue","");
        $("#endTimeEmp").combo("setText",'');
        $("#endTimeEmp").combo("setValue",'');
        $('#searchNameEmp').val("");
    }
    /**
     * Name 添加记录
     */
    function addEmp(){
        $('#emp-form-2').form('submit', {
            url:'${pageContext.request.contextPath}/addEmpInf.action',
            onSubmit : function() {
                return $(this).form('enableValidation').form('validate');
            },
            success:function(data){
                if(data == "ok"){
                    $.messager.alert('创建成功', '员工创建成功', 'info');
                    $('#emp-dialog-2').dialog('close');
                    reloadEmp();
                }
                else
                {
                    $.messager.alert('创建失败', '员工创建失败', 'error');
                }
            }
        });
    }


    /**
     * Name 修改记录
     */
    function editEmp(){

        $('#emp-form-1').form('submit', {
            url:'${pageContext.request.contextPath}/editEmpInf.action',
            success:function(data){
                if(data == "ok"){
                    $.messager.alert('信息提示','修改成功！','info');
                    $('#emp-dialog-1').dialog('close');
                    reloadEmp();
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
    function removeEmp(){
        var items = $('#emp-datagrid-4').datagrid('getSelections');
        if (items.length <= 0){
            alert("请选择要删除的数据！");
            return;
        }
        $.messager.confirm('信息提示','确定要删除该记录？', function(result){
            if(result){
                var ids = [];
                var names = [];
                $(items).each(function(){
                    ids.push(this.id);
                });
                $(items).each(function () {
                    names.push(this.name);
                })
                //alert(ids);return;
                $.ajax({
                    url:'${pageContext.request.contextPath}/deleteEmpInfById.action?ids='+ids,
                    success:function(data){
                        if(data == "ok"){
                            $.messager.alert('信息提示',names+' 删除成功！','info');
                            reloadEmp();
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
     * Name 打开添加窗口
     */
    function openEmpAdd(){
        $('#emp-form-2').form('clear');
        $('#emp-dialog-2').dialog({
            closed: false,
            modal:true,
            title: "添加员工",
            buttons: [{
                text: '确定',
                iconCls: 'icon-ok',
                handler: addEmp
            }, {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    $('#emp-dialog-2').dialog('close');
                }
            }]
        });
        var data = $("#deptId").combobox("getData");
        if (data && data.length > 0) {
            $("#deptId").combobox("setValue", data[0].id);
        }
        data = $("#jobId").combobox("getData");
        if (data && data.length > 0) {
            $("#jobId").combobox("setValue", data[0].id);
        }
        var da = [ {'text' : '群众', 'value' : '群众'},
            {'text' : '团员', 'value' : '1'},
            {'text' : '中共党员', 'value' : '中共党员'}]
        $('#pa').combobox({ textField : 'text', valueField : 'value', panelHeight : 'auto', data : da})
        var d = [ {'text' : '高中', 'value' : '高中'},
            {'text' : '专科', 'value' : '专科'},
            {'text' : '本科', 'value' : '本科'},
            {'text' : '硕士', 'value' : '硕士'},
            {'text' : '博士', 'value' : '博士'}]
        $('#ed').combobox({ textField : 'text', valueField : 'value', panelHeight : 'auto', data : d})

        data = $("#pa").combobox("getData");
        if (data && data.length > 0) {
            $("#pa").combobox("setValue", data[0].value);
        }
        data = $("#ed").combobox("getData");
        if (data && data.length > 0) {
            $("#ed").combobox("setValue", data[0].value);
        }
        $("[name='sex'][value='0']").prop("checked", "checked");
    }

    /**
     * Name 打开修改窗口
     */
    function openEmpEdit(){
        //$('#user-form-2').form('clear');
        var item = $('#emp-datagrid-4').datagrid('getSelected');
        //alert(item.id);
        if (item == null){
            alert("请选择要更新的员工信息");return;
        }
        $('#emp-dialog-1').dialog({
            closed: false,
            modal:true,
            title: "修改用户信息",
            buttons: [{
                text: '确定',
                iconCls: 'icon-ok',
                handler: editEmp
            }, {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    $('#emp-dialog-1').dialog('close');
                }
            }]
        });
        $.ajax({
            url:'${pageContext.request.contextPath}/findEmpInfById.action?id='+item.id,
            success:function(data){
                if(data != null){
                    //绑定值
                    var obj = jQuery.parseJSON(data);
                    $('#emp-form-1').form('load', obj)
                    $('#deptName').combobox("setValue",parseInt(obj.deptId));
                    $('#jobName').combobox('setValue',parseInt(obj.jobId));
                    //$("input:radio[name=sex][value=obj.sex]").attr("checked",true);
                    if (obj.sex == 0){
                        $("[name='sex'][value='0']").prop("checked", "checked");
                    }else{
                        $("[name='sex'][value='1']").prop("checked", "checked");
                    }
                }
                else{
                    $('#emp-dialog-1').dialog('close');
                }
            }
        });
    }


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

    /**
     *
     * 刷新页面数据
     */

    function reloadEmp(){
        $('#emp-datagrid-4').datagrid("reload");
    }

    function tableToExcel() {
        var startTime = $('#startTimeEmp').datebox("getValue");
        //alert(startTime);
        var endTime = $('#endTimeEmp').datebox("getValue");
        //alert(endTime);
        var searchDept = $("#searchDept").combobox("getValue");
        //alert(searchStatus);
        var searchName = $('#searchNameEmp').val();
        var searchJob = $('#searchJob').combobox("getValue");
        //if (($.trim(searchName) == "" || searchName == "")&& startTime == "" && endTime == "" && searchStatus =="") {
        //   alert("请选择搜索条件");
        //   return;
        //}
        $.ajax({
            url:'${pageContext.request.contextPath}/findEmpInf.action?startTime='+startTime+'&&endTime='+endTime+'&&searchDept='+searchDept+'&&searchName='+searchName+'&&searchJob='+searchJob,
            success:function (data) {
                var obj = jQuery.parseJSON(data);
                //alert(obj.id);
                //data = jquery.parseJSON(data);
                var arr = new Array();  //定义一个二维数组存储SheetJS所需数据
                arr[0] = ['员工号','姓名','部门','职位','性别','电话','QQ','族','学历','生日','地址','爱好','邮政编码','email','政治面貌','专业','入职日期','备注'];  //这里定义一下Excel的头部标题，记住这个顺序，因为后面需要按照这个顺序填充json里的数据
                obj.forEach(function(val,idx,array){
                    // 这里可以先对数据进行改变，得到我们需要的
                    val['sex'] = val['sex']>0?'女':'男';
                    // 实例二位数组空间
                    arr[idx+1] = new Array();
                    arr[idx+1][0] = val['cardId'];
                    arr[idx+1][1] = val['name'];
                    arr[idx+1][2] = val['deptName'];
                    arr[idx+1][3] = val['jobName'];
                    arr[idx+1][4] = val['sex'];
                    arr[idx+1][5] = val['tel'];
                    arr[idx+1][6] = val['qqNum'];
                    arr[idx+1][7] = val['race'];
                    arr[idx+1][8] = val['education'];
                    arr[idx+1][9] = val['birthday'];
                    arr[idx+1][10] = val['address'];
                    arr[idx+1][11] = val['hobby'];
                    arr[idx+1][12] = val['postCode'];
                    arr[idx+1][13] = val['email'];
                    arr[idx+1][14] = val['party'];
                    arr[idx+1][15] = val['speciality'];
                    arr[idx+1][16] = val['createDate'];
                    arr[idx+1][17] = val['remark'];
                });
                // console.log(arr); //得到数据咯
                var filename = "员工信息表.xlsx"; //文件名称
                //var data = [[1,2,3],[true, false, null, "sheetjs"],["foo","bar",new Date("2014-02-19T14:30Z"), "0.3"], ["baz", null, "qux"]];  //数据，一定注意需要时二维数组
                var ws_name = "Sheet1"; //Excel第一个sheet的名称
                var wb = XLSX.utils.book_new(),ws = XLSX.utils.aoa_to_sheet(arr);
                XLSX.utils.book_append_sheet(wb, ws, ws_name);  //将数据添加到工作薄
                XLSX.writeFile(wb, filename);
            }
        })
    }

</script>
</body>

</html>
