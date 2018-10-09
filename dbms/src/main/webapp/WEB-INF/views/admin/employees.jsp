<jsp:include page="adminBase.jsp"></jsp:include>
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
<div class="panel ">
<table id="mytable" class="table table-bordred table-striped">
<thead>
	<th>Employee Id</th>
	<th>Name</th>
	<th>Working area</th>
	<th>Salary</th>
	<th>Contact No.</th>
	<th>Joinin Date</th>
	<th>Assigned orders</th>
	<th>Salary record</th>
	<th>Remove</th>
</thead>
</div>
<tbody>
<div class="panel-body">
<c:forEach items="${list }" var="item">
<tr>
	<td>${item.empId }</td>
	<td>${item.name }</td>
	<td>${item.workingArea }</td>
	<td>${item.salary }</td>
	<td>${item.contactNo }</td>
	<td>${item.joiningDate }</td>
	<td><a href="${pageContext.request.contextPath}/admin/assigned_orders/${item.empId }"><button class="btn btn-danger btn-sm" >view orders</button></a></td>
	<td><a href="${pageContext.request.contextPath}/salary/employee_records/${item.empId }"><button class="btn btn-danger btn-sm" >See</button></a></td>
	<td><a href="#"><button class="btn btn-danger btn-sm" >Remove</button></a></td>
</tr>
</c:forEach>
</div>
</tbody>
</table>
</div>



</body>
</html>