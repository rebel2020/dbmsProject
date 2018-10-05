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
<form:form method="post" action="add_record" modelAttribute="record">
<table>
<tr><td>ItemId:</td><td><input name="itemId"" type="text"/></td></tr>
<tr><td>Quantity:</td><td><input name="quantity"" type="text"/></td></tr>
<tr><td>Amount:</td><td><input name="amount"" type="text"/></td></tr>
<!--  <tr><td>Date:</td><td><input name="date"" type="date"/></td></tr> -->
</table>
<input type="submit" value="add record">
</form:form>
</body>
</html>