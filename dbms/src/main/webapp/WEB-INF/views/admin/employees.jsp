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
</table>
</div>
</c:forEach>
</body>
</html>