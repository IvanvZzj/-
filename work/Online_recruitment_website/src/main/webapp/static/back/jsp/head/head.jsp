
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>头部</title>
<link rel="stylesheet" type="text/css" href="${path}/static/back/css/public.css" />
<script type="text/javascript" src="${path}/static/back/js/jquery.min.js"></script>
<script type="text/javascript" src="${path}/static/back/js/public.js"></script>
</head>

<body>
	<!-- 头部 -->
	<div class="head">
		<div class="headL">
			<img class="headLogo" src="${path}/static/back/img/logLOGO.png"/>
		</div>
		<div class="headR">
			<span style="color:#FFF">欢迎：admin</span>
			<a href="${path}/static/back/jsp/head/head2.jsp" rel="external">【退出】</a>
		</div>
	</div>
</body>
</html>