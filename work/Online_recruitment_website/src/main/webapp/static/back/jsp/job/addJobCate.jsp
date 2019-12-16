<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title></title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <meta name="generator" content=""/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;">
    <link href="${path}/static/back/css/haiersoft.css" rel="stylesheet" type="text/css" media="screen,print"/>
    <link href="${path}/static/back/css/print.css" rel="stylesheet" type="text/css" media="print"/>
    <script src="${path}/static/back/js/jquery-1.10.1.min.js"></script>
    <script src="${path}/static/back/js/side.js" type="text/javascript"></script>

</head>

<body>
<!-- Popup -->
<div id="Popup">

    <!-- SubPopup -->
    <div id="SubPopup">
        <div class="form_boxC">
            <table cellpadding="0" cellspacing="0">
                <h2>添加一级类别</h2>
                <tr>
                    <th>请输入类别名称 <span class="f_cB"></span></th>
                    <td>
                        <div class="txtbox floatL">
                            <form action="${path}/jobcate/addJobCate">
                                <input name="name" type="text" value="">
                                <input type="submit" value="提交">
                            </form>
                        </div>
                    </td>
                </tr>
            </table>
        </div>

        <div style="margin-top: 50px">
            <hr>
        </div>

        <div class="form_boxC">
            <table cellpadding="0" cellspacing="0">
                <form action="${path}/jobcate/addJobCate">
                    <h2>添加二级类别</h2>
                    <tr>
                        <th>所属一级类别 <span class="f_cB"></span></th>
                        <td>
                            <div class="selectbox" style="width:210px;">
                                <select id="jocCateOne1" name="parentId" style="width: 210px;height: 35px">
                                </select>
                            </div>
                            <!-- /selectbox --></td>
                    </tr>
                    <tr>
                        <th>请输入类别名称 <span class="f_cB"></span></th>
                        <td>
                            <div class="txtbox floatL">
                                <input name="name" type="text" value="">
                                <input type="submit" value="提交">
                            </div>
                        </td>
                    </tr>
                </form>
            </table>
        </div>

        <div style="margin-top: 50px">
            <hr>
        </div>

        <div class="form_boxC">
            <table cellpadding="0" cellspacing="0">
                <form action="${path}/jobcate/addJobCate">
                    <h2>添加三级类别</h2>
                    <tr>
                        <th>所属一级类别 <span class="f_cB"></span></th>
                        <td>
                            <div class="selectbox" style="width:210px;">
                                <select id="jocCateOne2" name="fistJobCate" style="width: 210px;height: 35px">
                                </select>
                            </div>
                            <!-- /selectbox --></td>
                    </tr>
                    <tr>
                        <th>所属二级类别 <span class="f_cB"></span></th>
                        <td>
                            <div class="selectbox" style="width:210px;">
                                <select id="jocCateTwo" name="parentId" style="width: 210px;height: 35px">
                                </select>
                            </div>
                            <!-- /selectbox --></td>
                    </tr>
                    <tr>
                        <th>请输入类别名称 <span class="f_cB"></span></th>
                        <td>
                            <div class="txtbox">
                                <input name="name" type="text" value="">
                                <input type="submit" value="提交">
                            </div>
                        </td>
                    </tr>
                </form>
            </table>
        </div>
    </div>
</div>
<script src="${path}/static/back/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">

    // 查询所有的一级类别
    $.ajax({
        url: "${path}/jobcate/findCateByType?type=" + 1,
        dataType: "json",
        type: "get",
        success: function (data) {
            console.log(data)
            $('#jocCateOne1').empty();
            for (var i = 0; i < data.length; i++) {
                $("#jocCateOne1")
                    .append("<option value='" + data[i].id + "'>" + data[i].name + "</option>")
            }
        }
    })

    // 查询所有的一级类别
    $.ajax({
        url: "${path}/jobcate/findCateByType?type=" + 1,
        dataType: "json",
        type: "get",
        success: function (data) {
            $('#jocCateOne2').empty();
            for (var i = 0; i < data.length; i++) {
                $("#jocCateOne2")
                    .append("<option value='" + data[i].id + "'>" + data[i].name + "</option>")
            }
            // 手动触发change事件
            $('#jocCateOne2').change();
        }
    })


    $("#jocCateOne2").change(function () {
        var pid = $("#jocCateOne2").val();

        $("#jocCateTwo").empty();
        $.ajax({
            url: "${path}/jobcate/findCateByParentId?pid=" + pid,
            dataType: "JSON",
            type: "get",
            success: function (data) {

                for (var i = 0; i < data.length; i++) {
                    $("#jocCateTwo")
                        .append("<option value='" + data[i].id + "'>" + data[i].name + "</option>")
                }

            }
        })
    })


</script>
</body>
</html>