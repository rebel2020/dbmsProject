<jsp:include page="adminBase.jsp"></jsp:include>
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
<table>
<tr><td>Name:</td><td>${user.name }</td></tr>
<tr><td>Username:</td><td>${user.username }</td></tr>
<tr><td>Address:</td><td>${user.address }</td></tr>
<tr><td>Contact:</td><td>${user.contact }</td></tr>
<tr><td>Email:</td><td>${user.email }</td></tr>
</table>
<form action="../switch_status/${user.username }">
<input type="submit" value='<c:if test="${user.enabled }">Disable this user</c:if> <c:if test="${not user.enabled }">Enable this user</c:if>'>
</form>
</body>
</html>