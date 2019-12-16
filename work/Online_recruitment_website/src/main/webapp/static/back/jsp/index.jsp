<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页</title>
</head>
<frameset rows="100,*" cols="*" scrolling="No" framespacing="0" frameborder="no" border="0"> 
<frame src="${path}/static/back/jsp/head/head.jsp" name="headmenu" id="mainFrame" title="mainFrame">
<!-- 引用头部 -->
<!-- 引用左边和主体部分 --> 
<frameset rows="100*" cols="220,*" scrolling="No" framespacing="0" frameborder="no" border="0">
<frame src="${path}/static/back/jsp/left.jsp" name="leftmenu" id="mainFrame" title="mainFrame">
<frame src="${path}/static/back/jsp/main.jsp" name="main" scrolling="yes" noresize="noresize" id="rightFrame" title="rightFrame"></frameset>
</frameset>
</html>