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
<div class="panel" style="margin-left:3%;margin-right:3%">
<form action="../add_record/${empId }">
<input type="submit" class="form-controll btn btn-danger" value="Add new payment record" style="margin-top:1%">
</form>
<div>
<c:forEach items="${list }" var="record">
<div class="panel panel-success col-sm-3">
	<div class="panel-heading">
	<label style="margin-left:0%;font-size:150%"><b>${record.name }</b></label>
		<label style="margin-left:40%;font-size:150%"><b>${record.month }/${record.year }</b></label>
	</div>
	<div class="panel-body">
	</div>
<table>
<tr><td><label>EmpId:</label></td>
	<td><label>   ${record.empId }</label><br></td></tr>
<tr><td><label>Amount:</label></td>
<td>	<label>   ${record.paid }</label><br></td></tr>
<tr><td><label>Salary:</label></td>
<td>	<label>   ${record.salary }</label><br></td></tr>
</table>
<br><br>
</div>
</c:forEach>
</div>
</body>
</div>
</html>