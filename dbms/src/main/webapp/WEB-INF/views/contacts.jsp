<jsp:include page="base.jsp"></jsp:include>
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
<div class="col-sm-offset-1 col-sm-10">
<table>
	<thead>
		<th><label><b>Contact</b></label></th>
		<th><label><b>Delete</b></label></th>
	</thead>
	<tbody>
		<c:forEach items="${list }" var="contact">
			<tr>
				<td>${contact.contact }</td>
				<br>
				<td><a href="./delete_contact/${contact.contactId }"><button class="btn btn-sm btn-danger">delete this contact</button></a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<br>
<form action="./add_contact">
<input type="submit" value="Add contact" class="btn btn-success">
</form>
</div>
<body>

</body>
</html>