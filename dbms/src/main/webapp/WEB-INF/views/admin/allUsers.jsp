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
<table class="table table-bordred table-striped">
	<thead>
		<th>Username</th>
		<th>Name</th>
		<th>Address</th>
		<th>Email</th>
		<th>Contact</th>
		<th>Details</th>
		<th>Ststus</th>
	</thead>
	<tbody>
		<c:forEach items="${list }" var="user">
		<tr>
			<td>${user.username }</td>
			<td>${user.name }</td>
			<td>${user.address }</td>
			<td>${user.email }</td>
			<td>${user.contact }</td>
			<td><a href="view_details/${user.username }"><button class="btn btn-sm">View</button></a></td>
			<td>
			<c:if test="${user.enabled }"><a href="${pageContext.request.contextPath}/admin/switch_status/${user.username }"><button class="btn btn-danger">Disable</button></a></c:if>
			<c:if test="${not user.enabled }"><a href="${pageContext.request.contextPath}/admin/switch_status/${user.username }"><button class="btn btn-success">Enable</button></a></c:if>
			</td>
		
		</tr>
		
		
		</c:forEach>
	
	</tbody>
</table>
</body>
</html>