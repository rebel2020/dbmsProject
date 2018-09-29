<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form:form modelAttribute="feedback" method="post">
<table>
<tr><td>Write feedback:</td>
<td><form:input path="content" type="text"/>
<form:errors path="content"></form:errors></td>
</tr>
<form:hidden path="userId" value="${feedback.userId }"/>
<tr><td><input type="submit"></td></tr>
</table>
</form:form>
</body>
</html>