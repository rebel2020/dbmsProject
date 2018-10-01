<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach items="${list }" var="item">
<div style="margin-left:10%;margin-right:10%;margin-top:3%;background-color:red;">
<table>
<tr><td>
<a href="orderitems/${item.orderId }">${item.orderId}</a>
<div>Assigned employee ID:${item.empId }</div>
</td></tr>
<tr><td>Total amount:</td><td>${item.netAmount }</td></tr>
</table></div>
</c:forEach>
</body>
</html>