<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form:form action="" method="post" modelAttribute="employee">
<table>
<tr><td>Name:</td>
<td><form:input path="name" type="text" required="required"/>
<form:errors path="name"></form:errors>
</td></tr>
<tr><td>Working area:</td>
<td><form:input path="workingArea" type="text"/>
<form:errors path="workingArea"></form:errors></td></tr>
<tr><td>Salary:</td>
<td><form:input path="salary" type="int"/>
<form:errors path="salary"></form:errors></td></tr>
<tr><td>Contact no.:</td>
<td><form:input path="contactNo" type="text" required="required"/>
<form:errors path="contactNo"></form:errors></td></tr>
<tr><td><input type="submit"></td></tr>
</table>
</form:form>
</body>
</html>