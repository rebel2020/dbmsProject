<jsp:include page="adminBase.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="panel panel-success col-sm-offset-2 col-sm-8	" style="background-color:rgb(210,210,210)">
<h3>Enter product details</h3>
<form:form method="post" modelAttribute="item" action="additem" enctype="multipart/form-data">

<label><b>Name:</b></label>
<form:input path="name" type="text" required="required" class="form-control" />
<form:errors path="name"></form:errors>

<label><b>Price:</b></label>
<form:input path="price" required="required" class="form-control"/>
<form:errors path="price"/>
<label><b>Weight:</b></label>
<form:input path="weight" required="required" class="form-control"/>
<form:errors path="weight"></form:errors>
<label><b>Quantity:</b></label>
<form:input path="quantity" type="int" default="10" class="form-control"/>
<form:errors path="quantity"></form:errors>
<label><b>Description:</b></label>
<form:input path="description" type="text" class="form-control"/>
<form:errors path="description"></form:errors>
<label><b>Package date:</b></label>
<form:input path="pkgDate" type="date" class="form-control" max="${today }" required="required"/>
<form:errors path="pkgDate"></form:errors>
<label><b>Upload display picture:</b></label>
<input type="file" name="file" class="form-control">
<br>
<input type="submit" class="form-control btn btn-success"/>
</form:form>
</div>
</body>
</html>