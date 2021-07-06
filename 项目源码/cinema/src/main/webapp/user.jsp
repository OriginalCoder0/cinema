<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/6/23
  Time: 15:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <base href="${pageContext.servletContext.contextPath}/">
    <title>传媒影院-会员管理</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="./static/bootstrap-3.4.1-dist/css/bootstrap.css">
</head>
<body>
<%--    顶部导航条--%>
<%@ include file="nav.jsp"%>
<div class="container-fluid">
    <%--    菜单容器--%>
    <%@include file="menu.jsp"%>
    <%--    操作区域--%>
    <div class="col-md-10" id="content">
        <h1>会员管理</h1>
    </div>
</div>


</body>
</html>
