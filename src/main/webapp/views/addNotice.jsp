<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/6/24
  Time: 22:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加公告</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/1.3.3/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/1.3.3/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/1.3.3/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/1.3.3/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/1.3.3/locale/easyui-lang-zh_CN.js"></script>
</head>
<body style="margin:1px;" id="ff" >
<div id="dl" class="easyui-layout" align="center">
    <form id="fm" method="post" class="easyui-form" >
        <table>
            <tr align="center">
                <td><label>标题：</label>
                <input type="text" id="title" name="noticeTitle" class="easyui-validatebox" required="true" style="width: 200px"/></td>
            </tr>
            <tr>
                <td>
                    <textarea id="editor" name="noticeContent"></textarea>
                </td>
            </tr>
        </table>
    </form>
</div>

<div id="dlg-buttons" align="center">
    <a href="javascript:saveArt()" class="easyui-linkbutton"
       iconCls="icon-ok" id="save">保存</a> <a href="javascript:reset()" class="easyui-linkbutton" iconCls="icon-cancel">清空</a>
</div>


<script type="text/javascript">
    function reset() {
        $('#editor').val("");
        $('#title').val("");
        keditor.html("");
    }

    function saveArt() {
        $("#fm").form("submit", {
            url: '${pageContext.request.contextPath}/notice/add.action',
            onSubmit: function () {
                return $(this).form("validate");
            },
            success: function (result) {
                if (result == "ok") {
                    $.messager.alert("系统提示", "公告发布成功");
                    reset();
                }
                //resetValue();
            }
        });
    }

    var keditor;

    function kedit(keid){

        //alert(1);

        keditor =  KindEditor.create(

            '#' + keid,

            {

                width : "100%", //编辑器的宽度为

                height : "500px", //编辑器的高度为100px

                filterMode : false, //不会过滤HTML代码

                resizeMode : 1 ,//编辑器只能调整高度

                //imageUploadJson : '/kindeditor-4.1.7/jsp/upload_json.jsp',

                //fileManagerJson : '/kindeditor-4.1.7/jsp/file_manager_json.jsp',

                allowUpload : true,

                allowFileManager : true,

                afterCreate : function() {

                    var self = this;

                    KindEditor.ctrl(document, 13, function() {

                        self.sync();

                        document.forms['example'].submit();

                    });

                    KindEditor.ctrl(self.edit.doc, 13, function() {

                        self.sync();

                        document.forms['example'].submit();

                    });

                },

                items : [

                    'source', '|', 'undo', 'redo', '|', 'preview', 'print', 'code', 'cut', 'copy', 'paste',

                    'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',

                    'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',

                    'superscript', 'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen', '/',

                    'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',

                    'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|',

                    'table', 'hr', 'pagebreak',

                    'anchor', 'link', 'unlink', '|', 'image','multiimage','flash','media','insertfile','editImage'

                ],

                afterBlur: function(){this.sync();},//和DWZ 的 Ajax onsubmit 冲突,提交表单时 编辑器失去焦点执行填充内容

                newlineTag : "br"

            });
        //alert(1);
    }
    $(function (){
        //alert(1);
        kedit("editor");
    });
</script>
</body>
</html>
