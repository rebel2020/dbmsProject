<jsp:include page="adminBase.jsp"></jsp:include>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<div style="float:left;width:90%;margin-left:5%;background-color:red;margin-top:3%;margin-right:5%">
<table>
<tr><td>Name:</td>
<td>${employee.name }</td></tr>
<tr><td>Salary:</td>
<td>${employee.salary }</td></tr>
<tr><td>Working Area:</td>
<td>${employee.workingArea }</td></tr>
</table>
<c:if test="${empty list }">
<div style="margin-left:5%;"><h3>No order is assigned to this employee...</h3></div>
</c:if>
</div>
<c:forEach items="${list }" var="order">
<div style="float:left;width:30%;margin-left:5%;background-color:red;margin-top:3%;">
<table>
<tr><td>Order id:</td>
<td>${order.orderId }</td></tr>
<tr><td>Address:</td>
<td>${order.address }</td></tr>
<tr><td>Amount :</td>
<td>${order.amount }</td></tr>
<tr><td>Net amount :</td>
<td>${order.netAmount }</td></tr>
</table>
</div>
</c:forEach>
</body>
</html>