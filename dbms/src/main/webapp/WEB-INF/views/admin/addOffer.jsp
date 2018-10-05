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
<form:form modelAttribute="offer" action="./add_offer" method="post">
<table>
<tr><td>Name of offer:</td>
<td><form:input path="offerName" type="text" required="required"/>
<form:errors path="offerName"></form:errors></td></tr>
<tr><td>Percentage Off:</td><td><form:input path="percentageOff" type="num" max="80" min="0"/>
<form:errors path="percentageOff"></form:errors>
</td></tr>
</table>
<input type="submit" value="Add">
</form:form>
</body>
</html>