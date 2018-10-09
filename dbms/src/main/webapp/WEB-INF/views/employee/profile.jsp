<jsp:include page="employeeBase.jsp"></jsp:include>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${error }
<div class="panel panel-default col-sm-6 col-sm-offset-3">
<div class="col-sm-4">
		<img alt="" src='<c:url value="/resources/images/addProfilePic.jpg"></c:url>'  style="width:13vw">
</div>
<div class="col-sm-8">
<table>
<tr><td>Name:</td><td>${user.name }</td></tr>
<tr><td>Username:</td><td>${user.username }</td></tr>
<tr><td>Email:</td><td>${user.email }</td></tr>
<tr><td>Address:</td><td>${user.address }</td></tr>
<tr><td>contact:</td><td>${user.contact }</td></tr>
<tr><td>date of birth:</td><td>${user.DOB }</td></tr>
</table>
</div>
</div>
</body>
</html>