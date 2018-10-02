<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach items="${list }" var="item">
<div style="margin-left:5%;margin-right:5%%;margin-top:3%;background-color:red; width:30%">
<table>
<tr><td>Item id:</td><td>${item.itemId }</td></tr>
<tr><td>Item name:</td><td>${item.name }</td></tr>
<tr><td>Weight:</td><td>${item.weight }</td></tr>
<tr><td>Price:</td><td>${item.price }</td></tr>
<a href="item/${item.itemId }">View Details</a>
</table>
</div>
<br>
</c:forEach>

</body>
</html>