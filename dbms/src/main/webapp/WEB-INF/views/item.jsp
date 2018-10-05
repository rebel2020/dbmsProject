<jsp:include page="base.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="panel panel-success col-sm-offset-1 col-sm-10">
<div class="panel panel-heading">
<table>
<tr><td>
Name:</td>
<td>${item.name }</td></tr>
<tr><td>Weight:</td><td>${item.weight } gm</td></td>
<tr><td>Price:</td><td>${item.price }</td></tr>
<tr><td>Date when packed:</td><td>${item.pkgDate }</td></tr>
<tr><td>Description:</td>
<td>${item.description }</td></tr>
<tr><td>Hurry up...Only ${item.quantity } items remaining</td></tr>
<tr><td><form action="../addtocart/${item.itemId}">
<input type="number" name="quantity" max="${item.quantity }" min="1" required>
<input value="Add to cart" type="submit" />
</form></td></tr>

</table>
<a href="../feedbacks/${item.itemId }">View feedbacks given by users</a>
<br><br>
<a href="../givefeedback/${item.itemId }">Give feedback</a>
</div>
</div>
</body>
</html>