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
<tr><td>Email:</td><td>${user.email }</td></tr>
<tr><td>Address:</td><td>${user.address }</td></tr>
<tr><td>contact:</td><td>${user.contact }</td></tr>
<tr><td>date of birth:</td><td>${user.DOB }</td></tr>
<tr><td><a href="./contacts">More contacts</a></td></tr>
<tr><td><a href="./edit_profile">Edit profile</a></td></tr>
</table>
</body>
</html>