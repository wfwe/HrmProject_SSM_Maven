<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/6/27
  Time: 21:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>article</title>
</head>
<body>
<div class="article" style="">

</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript">
    function getQueryStringByName(name) {
        var result = location.search.match(new RegExp("[\?\&]" + name + "=([^\&]+)", "i"));
        if (result == null || result.length < 1) {
            return "";
        }
        return result[1];
    }

    window.onload = function () {
        var id = getQueryStringByName("id");
        if (id == null) {
            alert("无数据!");
            return;
        }
        $.ajax({
            type: "GET",
            url: '${pageContext.request.contextPath}/notice/findById/' +${id},
            success: function (data) {
                if (data != null) {
                    var obj= jQuery.parseJSON(data);
                    $('.article').html(obj.noticeContent);
                    //console.log(data.articleContent);
                }
                else {
                    alert("无数据!");
                }
            }
        });
    }
</script>
</html>
