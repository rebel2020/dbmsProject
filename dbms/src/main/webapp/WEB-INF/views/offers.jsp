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
<c:forEach items="${list }" var="offer">
<table>
<tr><td>Id:</td><td>${offer.offerId }</td></tr><tr><td>Name:</td>
<td>${offer.offerName }</td></tr><tr><td>Percentage Off:</td><td>${offer.percentageOff }</td></tr>
</table>
<form action="/dbms/admin/offer/switch_status/${offer.offerId }">
<c:if test="${offer.enabled }">Active now</c:if><c:if test="${not offer.enabled }">Not active</c:if><input type="submit" value="Switch status">
</form>

</c:forEach>
</body>
</html>