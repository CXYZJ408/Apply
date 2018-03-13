<%--
  Created by IntelliJ IDEA.
  User: wanyu
  Date: 2018/3/12 0012
  Time: 19:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<link rel="stylesheet" href="//at.alicdn.com/t/font_588450_sejs1dorj36av2t9.css">
<link href="assets/css/result.css" rel="stylesheet"/>

<head>
    <meta charset="UTF-8">
    <title>提交<c:if test="${requestScope.result}">成功</c:if><c:if test="${!requestScope.result}">失败</c:if></title>
    <link rel="icon" type="image/png" href="assets/img/favicon.png">
    <script src="assets/js/jquery-2.2.4.min.js" type="text/javascript"></script>
    <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<div id="div_25">&nbsp;</div>
<div id="icon">
    <c:if test="${requestScope.result}">
        <i class="iconfont icon-success " id="result"></i>
        <div>
            <div class="message">报名成功！</div>
            <a href="index.jsp" class="link">再次报名</a>
        </div>
    </c:if>
    <c:if test="${!requestScope.result}">
        <i class="iconfont icon-failure " id="result"></i>
        <div>
            <div class="message">报名失败！</div>
            <a href="index.jsp" class="link">重新报名</a>
        </div>
    </c:if>

</div>
</body>

</html>
