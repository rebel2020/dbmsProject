<jsp:include page="adminBase.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="../assign_employee/${orderId }" method="post" id="assign">
<select name="empId">
<c:forEach items="${employees }" var="employee">
<option value="${employee.empId }">${employee.empId }  ${employee.name }</option>
</c:forEach>
</select>
<!-- <input name="empId" type="number"> -->
<input type="submit" value="submit">
</form>
<c:forEach items="${list }" var="item">
<div class="panel panel-default col-sm-offset-1 col-sm-4">
<table>
<tr><td>
Name:</td>
<td>${item.name }</td></tr>
<tr><td>Quantity:</td><td>${item.quantity }</td></tr>
<tr><td>Date when packed:</td><td>${item.pkgDate }</td></tr>
<tr><td>Description:</td><td>${item.description }</td></tr>
</table></div>
</c:forEach>
</body>
</html>