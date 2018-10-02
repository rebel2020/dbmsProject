<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page import="java.util.List" %>
<%@ page import="com.brijesh.model.Employee" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach items="${list }" var="item">
<div style="float:left;width:30%;margin-left:5%;background-color:red;margin-top:3%">
<table>
<tr><td>Name:</td>
<td>${item.name }</td></tr>
<tr><td>Salary:</td>
<td>${item.salary }</td></tr>
<tr><td>Working Area:</td>
<td>${item.workingArea }</td></tr>
<tr><td>Contact No.:</td>
<td>${item.contactNo }</td></tr>
<tr><td>Working since:</td>
<td>${item.joiningDate }</td></tr>
</table><br>
<form action="./assigned_orders/${item.empId }"><input type="submit" value="View assigned orders to this employee"></form>
<form action="../salary/employee_records/${item.empId }"><input type="submit" value="View payment record"></form>
</div>
</c:forEach>
</body>
</html>