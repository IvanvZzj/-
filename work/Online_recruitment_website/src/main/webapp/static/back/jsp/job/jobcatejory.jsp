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
    <!--引入bootstrap-->
    <link href="${path}/static/back/bootstrap/css/bootstrap.min.css" rel="stylesheet">


</head>

<body>

<!-- MainForm -->
<div class="container-fluid">
    <div id="MainForm">
        <div class="form_boxA" style="margin: auto;position: absolute;left: 0;right: 0;">
            <div style="float: left ;margin-left: 15px">
                <h3>职位类别管理</h3>
            </div>
            <div style="float: right;margin-top: 1%;margin-right: 15px">
                    <h4 style="color: red">${requestScope.msg}</h4>
            </div>
            <table cellpadding="0" cellspacing="0">
                <tr class="bgcB">
                    <td>编号</td>
                    <td>名称</td>
                    <td>所属类别</td>
                    <td>当前类别等级</td>
                    <td>是否为热门推荐类别</td>
                    <td>操作</td>

                </tr>
                <c:forEach var="jobcate" items="${requestScope.pageBean.list}" varStatus="j">
                    <tr>
                        <td id="jid_"${jobcate.id}>${jobcate.id}</td>
                        <td>${jobcate.name}</td>
                        <td>
                            <c:forEach var="c" items="${jobcate.childJobCate}">
                                ${c.name}
                            </c:forEach>
                        </td>
                        <td>${jobcate.type}</td>
                        <td>
                            <c:if test="${jobcate.hotid ne null}">
                                是
                            </c:if>
                            <c:if test="${jobcate.hotid eq null}">
                                否
                            </c:if>
                        </td>
                        <td>
                            <a href="#">修改</a> |
                            <a href="${path}/jobcate/daleteJobCate?jid=${jobcate.id}">删除</a> |
                            <a href="${path}/jobcate/updateJobCateHot?jid=${jobcate.id}">热门推荐类别设置</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <div style="float: left;margin-top: 20px;margin-left: 40px">
                <a href="${path}/static/back/jsp/job/addJobCate.jsp" class="btn btn-default">添加岗位类别</a>
            </div>
            <div style="text-align: center;margin-top: 20px; ">
                <a href="${path}/jobcate/backqueryAllJobCategory?pageIndex=1"
                   class="btn btn-default">首 页</a>
                <a href="${path}/jobcate/backqueryAllJobCategory?pageIndex=${requestScope.pageBean.pageIndex-1}"
                   class="btn btn-default">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="${path}/jobcate/backqueryAllJobCategory?pageIndex=${requestScope.pageBean.pageIndex+1}"
                   class="btn btn-default">下一页</a>
                <a href="${path}/jobcate/backqueryAllJobCategory?pageIndex=${requestScope.pageBean.pageCount}"
                   class="btn btn-default">尾 页</a>&nbsp;&nbsp;&nbsp;&nbsp;
                <span style="font-size: 14px">
                    一共 ${requestScope.pageBean.pageCount} 页
                    当前第 ${requestScope.pageBean.pageIndex} 页
                    每页展示 ${requestScope.pageBean.rows} 条数据</span>
            </div>
        </div>

    </div>
</div>

<script src="${path}/static/back/bootstrap/js/jquery-3.3.1.min.js"></script>
<script src="${path}/static/back/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>