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
<div style="margin-left:10%;margin-right:10%;margin-top:3%;background-color:red;">
<table>
<tr><td>
Name:</td>
<td>${item.itemName }</td></tr>
<tr><td>Quantity:</td><td>${item.quantity }</td></tr>
</table></div>
</c:forEach>
</body>
</html>