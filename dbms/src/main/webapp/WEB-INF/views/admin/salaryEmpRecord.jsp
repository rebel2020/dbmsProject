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
<a href="../add_record/${empId }">Add new payment record</a><br><br><br>
<body>
<c:forEach items="${list }" var="record">
<table>
<tr><td>Employee Id:</td><td>${record.empId }</td></tr>
<tr><td>Salary:</td><td>${record.salary}</td></tr>
<tr><td>Paid amount:</td><td>${record.paid }</td></tr>
<tr><td>Date:</td><td>${record.month }/${record.year }</td></tr>
</table>
<br><br>
</c:forEach>
</body>
</html>