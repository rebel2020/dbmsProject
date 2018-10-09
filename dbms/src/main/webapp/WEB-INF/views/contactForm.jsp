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
<div class="panel panel-success col-sm-offset-2 col-sm-8">
<div class="panel-heading">
<label><b>Enter contact</b></label>
<form:form action="/dbms/add_contact" method="post" modelAttribute="contact">
<form:input path="contact" class="form-control"/>
<form:errors path="contact"/>
<input type="submit" value="Save" class="form-control btn-danger">
</form:form>
</div>
</div>
</body>
</html>