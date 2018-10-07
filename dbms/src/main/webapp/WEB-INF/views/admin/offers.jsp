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
<table id="mytable" class="table table-bordred table-striped">
<thead>
	<th>Offer id</th>
	<th>Offer name</th>
	<th>percentage Off</th>
	<th>toggle</th>
</thead>
<tbody>
	<c:forEach items="${list }" var="offer">
	<tr>
		<td>${offer.offerId }</td>
		<td>${offer.offerName }</td>
		<td>Flat ${offer.percentageOff } %</td>
		<td>
		<c:if test="${offer.enabled }">
		<a href="/dbms/admin/offer/switch_status/${offer.offerId }"><button class="btn btn-default btn-danger">Disable</button></a>
		</c:if>
		<c:if test="${not offer.enabled }">
		<a href="/dbms/admin/offer/switch_status/${offer.offerId }"><button class="btn btn-default btn-success">Enable</button></a>
		</c:if>
		</td>
	</tr>	
	</c:forEach>
</tbody>
</table>
<form action="/dbms/admin/add_offer">
<input class="form-control btn btn-success" type="submit" value="Add new offer">
</form>

</body>
</html>