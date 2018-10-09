<jsp:include page="base.jsp"></jsp:include>
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
<div class="col-sm-offset-3 col-sm-6 panel panel-success">
	<form:form action="" method="post" modelAttribute="order">
	<label><b>Pan number</b></label>
	<form:input path="panNumber" class="form-control"/>
	<form:errors path="panNumber" ></form:errors>
	<label><b>Aadhaar number</b></label>
	<form:input path="adharNumber" class="form-control"/>
	<form:errors path="adharNumber"></form:errors>
	<label><b>Quantity</b></label>
	<form:input path="bulkQuantity" class="form-control" mix="0"/>
	<form:errors path="bulkQuantity"></form:errors>
	<input type="submit" value="save changes" class="form-control btn btn-danger">
	</form:form>
</div>
</body>
</html>