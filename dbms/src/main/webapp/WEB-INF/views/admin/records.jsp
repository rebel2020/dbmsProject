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
<a href="add_record"><button class="btn btn-success" style="width:100%">Add new record</button></a>
<c:forEach items="${list }" var="record">
<div class="panel panel-default col-sm-2" style="margin-left:2vw;margin-top:2vh;background-color:rgb(200,200,200)">
<table>
<tr><td>ItemId:</td><td>${record.itemId }</td></tr>
<tr><td>Quantity:</td><td>${record.quantity}</td></tr>
<tr><td>Amount:</td><td>${record.amount }</td></tr>
<tr><td>Date:</td><td>${record.date }</td></tr>
</table>
	
</div>
</c:forEach>
</body>
</html>