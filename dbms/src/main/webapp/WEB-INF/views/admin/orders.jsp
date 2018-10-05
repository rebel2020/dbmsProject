<jsp:include page="adminBase.jsp"></jsp:include>
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
<div style="margin-left:10%;margin-right:10%;margin-top:3%;background-color:rgb(200,200,200);">
<div style="margin-left:5%;margin-top:1%;">
<a href="orderitems/${item.orderId }">
<table>
<tr><td>
Order Id:</td><td> ${item.orderId}
</td></tr>
<tr><td>Total amount:</td><td>${item.amount }</td></tr>
<tr><td>Net amount:</td><td>${item.netAmount }</td></tr>
<tr><td>
Address:</td>
<td>${item.address }</td></tr>
<tr><td>
Date of order:</td>
<td>${item.date }</td></tr>
<tr><td><div>Assigned employee ID:${item.empId }</div></td></tr>
</table>
</div>
</a>
</div>
</c:forEach>
</body>
</html>