<jsp:include page="adminBase.jsp"></jsp:include>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach items="${list }" var="item">
<div class="panel panel-default col-sm-4 col-sm-offset-1" style="background-color:rgb(150,150,150)">
<table>
<tr><td>Item name:</td>
<td>${item.name }</td></tr>
<tr><td>Weight:</td>
<td>${item.weight }</td></tr>
<tr><td>Pkg Date :</td>
<td>${item.pkgDate }</td></tr>
<tr><td>Item price:</td>
<td>${item.price }</td></tr>
</table>
<a href="item/${item.itemId }">Open this item</a>
</div>
</c:forEach>
</body>
</html>