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
<a href="add_record">Add new record</a><br><br><br>
<c:forEach items="${list }" var="record">
<table>
<tr><td>ItemId:</td><td>${record.itemId }</td></tr>
<tr><td>Quantity:</td><td>${record.quantity}</td></tr>
<tr><td>Amount:</td><td>${record.amount }</td></tr>
<tr><td>Date:</td><td>${record.date }</td></tr>
</table>
<br><br>
</c:forEach>
</body>
</html>