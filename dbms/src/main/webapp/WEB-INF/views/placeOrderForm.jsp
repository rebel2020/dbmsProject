<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
	<jsp:include page="base.jsp"></jsp:include>
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
<div class="col-sm-offset-2 col-sm-8 col-sm-offset-2 panel panel-default">
	<form:form modelAttribute="order" action="" method="post">
		<label><b>Enter PAN Number:</b></label>
		<form:input path="panNumber" type="text" class="form-control"></form:input>
		<label><b>Enter ADHAAR Number:</b></label>
		<form:input path="adharNumber" type="text" class="form-control"></form:input>
		<label><b>Enter Quantity:</b></label>
		<form:input path="bulkQuantity" type="text" class="form-control"></form:input><br>
		<input type="submit" class="form-control btn btn-success">
		<label><b>Enter address:</b></label>
		<form:input path="address" type="text" class="form-control"></form:input>
	</form:form>
</div>
</body>
</html>