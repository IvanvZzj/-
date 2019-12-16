<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>首页左侧导航</title>
    <link rel="stylesheet" type="text/css" href="${path}/static/back/css/public.css"/>
    <script type="text/javascript" src="${path}/static/back/js/jquery.min.js"></script>
    <script type="text/javascript" src="${path}/static/back/js/public.js"></script>
    <head></head>

<body id="bg">
<!-- 左边节点 -->
<div class="container">

    <div class="leftsidebar_box">
        <a href="${path}/static/back/jsp/main.jsp" target="main">
            <div class="line">
                <img src="${path}/static/back/img/coin01.png"/>&nbsp;&nbsp;首页
            </div>
        </a>
        <dl class="system_log">
            <dt>
                <img class="icon1" src="${path}/static/back/img/coin03.png"/>
                <img class="icon2" src="${path}/static/back/img/coin04.png"/>用户管理
                <img class="icon3" src="${path}/static/back/img/coin19.png"/>
                <img class="icon4" src="${path}/static/back/img/coin20.png"/>
            </dt>
            <dd>
                <img class="coin11" src="${path}/static/back/img/coin111.png"/>
                <img class="coin22" src="${path}/static/back/img/coin222.png"/>
                <a class="cks" href="tab.html" target="main">个人用户管理</a>
                <img class="icon5" src="${path}/static/back/img/coin21.png"/>
            </dd>
            <dd>
                <img class="coin11" src="${path}/static/back/img/coin111.png"/>
                <img class="coin22" src="${path}/static/back/img/coin222.png"/>
                <a class="cks" href="tab.html" target="main">企业用户管理</a>
                <img class="icon5" src="${path}/static/back/img/coin21.png"/>
            </dd>
        </dl>
        <dl class="system_log">
            <dt>
                <img class="icon1" src="${path}/static/back/img/coin01.png"/>
                <img class="icon2" src="${path}/static/back/img/coin02.png"/> 岗位管理
                <img class="icon3" src="${path}/static/back/img/coin19.png"/>
                <img class="icon4" src="${path}/static/back/img/coin20.png"/>
            </dt>
            <dd>
                <img class="coin11" src="${path}/static/back/img/coin111.png"/>
                <img class="coin22" src="${path}/static/back/img/coin222.png"/>
                <a class="cks" href="${path}/jobcate/backqueryAllJobCategory" target="main">岗位类别管理</a>
                <img class="icon5" src="${path}/static/back/img/coin21.png"/>
            </dd>
            <dd>
                <img class="coin11" src="${path}/static/back/img/coin111.png"/>
                <img class="coin22" src="${path}/static/back/img/coin222.png"/>
                <a class="cks" href="p3.html" target="main">岗位监督</a>
                <img class="icon5" src="${path}/static/back/img/coin21.png"/>
            </dd>

        </dl>
        <dl class="system_log">
            <dt>
                <img class="icon1" src="${path}/static/back/img/coin07.png"/>
                <img class="icon2" src="${path}/static/back/img/coin08.png"/> 企业管理
                <img class="icon3" src="${path}/static/back/img/coin19.png"/>
                <img class="icon4" src="${path}/static/back/img/coin20.png"/>
            </dt>
            <dd>
                <img class="coin11" src="${path}/static/back/img/coin111.png"/>
                <img class="coin22" src="${path}/static/back/img/coin222.png"/>
                <a href="p1.html" target="main" class="cks">企业管理</a>
                <img class="icon5" src="${path}/static/back/img/coin21.png"/>
            </dd>
        </dl>
        <dl class="system_log">
            <dt>
                <img class="icon1" src="${path}/static/back/img/coin10.png"/>
                <img class="icon2" src="${path}/static/back/img/coin09.png"/> 其他管理
                <img class="icon3" src="${path}/static/back/img/coin19.png"/>
                <img class="icon4" src="${path}/static/back/img/coin20.png"/>
            </dt>
            <dd>
                <img class="coin11" src="${path}/static/back/img/coin111.png"/>
                <img class="coin22" src="${path}/static/back/img/coin222.png"/><a class="cks">其他管理</a>
                <img class="icon5" src="${path}/static/back/img/coin21.png"/>
            </dd>
        </dl>
        <dl class="system_log">
            <dt>
                <img class="icon1" src="${path}/static/back/img/coinL1.png"/>
                <img class="icon2" src="${path}/static/back/img/coinL2.png"/> 系统管理
                <img class="icon3" src="${path}/static/back/img/coin19.png"/>
                <img class="icon4" src="${path}/static/back/img/coin20.png"/>
            </dt>
            <dd>
                <img class="coin11" src="${path}/static/back/img/coin111.png"/>
                <img class="coin22" src="${path}/static/back/img/coin222.png"/>
                <a href="changepwd.html" target="main" class="cks">修改密码</a>
                <img class="icon5" src="${path}/static/back/img/coin21.png"/>
            </dd>
            <dd>
                <img class="coin11" src="${path}/static/back/img/coin111.png"/>
                <img class="coin22" src="${path}/static/back/img/coin222.png"/><a class="cks">退出</a>
                <img class="icon5" src="${path}/static/back/img/coin21.png"/>
            </dd>
        </dl>

    </div>

</div>
</body>
</html>
