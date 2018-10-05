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
<body>
<div class="panel panel-danger col-sm-offset-3 col-sm-6">
	<div class="panel-heading">
		<form action="" method="post" >
		Name:<input name="name" value="${user.name}" type="text" class="form-control"/>
		Address:<input name="address" value="${user.address}" type="text" class="form-control"/>
		contact:<input name="contact" value="${user.contact}" type="text" class="form-control"/>
		Date of birth:<input name="DOB" type="date" value="${user.DOB }" class="form-control"/>
		<input type="submit" value="Update details" class="form-control" style="">
		</form>
	</div>
</div>
</body>
</html>