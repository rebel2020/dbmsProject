<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<html>

<nav class="navbar nav-navbar bg-dark navbar-light" >
     <nav class="nav">
      <a class="nav-link col-sm-offset-6" href="#">Link 1</a>
      <a class="nav-link" href="#">Link 2</a>
      	<form class="form-inline"><input type="text" placeholder="Search">
		</form>
	</nav>
</nav>
</html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<div class="panel panel-success col-sm-6" style="margin-left:25%;margin-right:25%" >
<div class="panel-heading">
<table>
<tr><td>Total amount:</td><td>${order.amount }</td></tr>
<tr><td>Amount paid:</td><td>${order.netAmount }</td></tr>
</table>
</div>
</div>
<div class="panel panel-default col-sm-6" style="margin-left:25%;margin-right:25%">
<div class="panel-heading col-sm-offset-1 col-sm-10 col-sm-offset-1">
<c:forEach items="${list }" var="item">
<div>
<table>
<tr><td>
Name:</td>
<td>${item.itemName }</td></tr>
<tr><td>Quantity:</td><td>${item.quantity }</td></tr>
</table></div>
<br>
</c:forEach>
</div></div>
</body>
</html>