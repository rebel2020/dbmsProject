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
<div class="col-sm-offset-3 col-sm-6 col-sm-offset-3 panel panel-default">
<div style="color:red">${error }</div>
<form:form action="" method="post" modelAttribute="record">
<label><b>Month:</b></label>
<form:input path="month" value="${month }" class="form-control" type="number" max="12" min="1"/>
<label><b>Year:</b></label>
<form:input path="year" value="${year }" class="form-control"/>
<label><b>Amount:</b></label>
<form:input path="paid" value="${salary }" class="form-control"/>

<input type="submit" value="submit" class="form-control">
</form:form>
</div>
</body>
</html>