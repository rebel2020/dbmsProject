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
<c:forEach items="${list }" var="user">
<table>
<tr><td>Username:</td><td>${user.username }</td></tr>
<tr><td>Name:</td><td>${user.name }</td></tr>
</table>
<a href="view_details/${user.username }">View datails of user</a>
<br><br>
</c:forEach>
</body>
</html>