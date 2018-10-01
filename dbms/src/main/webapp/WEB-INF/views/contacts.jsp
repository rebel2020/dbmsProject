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
<c:forEach items="${list }" var="contact">
<table>
<tr><td>Contact:  </td><td>${contact.contact }</td><td><form action="./delete_contact/${contact.contactId }"><input type="submit" value="delete this contact"></form></td></tr>
</table>
<br><br>
</c:forEach>
<form action="./add_contact">
<input type="submit" value="Add contact">
</form>
</body>
</html>