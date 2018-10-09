<jsp:include page="adminBase.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class='col-sm-offset-3 col-sm-6 panel panel-danger'>
<div class="panel-heading">
<form:form action="" method="post" modelAttribute="employee">
<table>
<tr><lable><b>Name:</b></lable>
<form:input path="name" type="text" required="required" class="form-control"/>
<form:errors path="name"></form:errors>
</tr>
<tr><lable><b>Working area:</b></lable>
<form:input path="workingArea" type="text" class="form-control"/>
<form:errors path="workingArea"></form:errors></tr>
<tr><lable><b>Salary:</b></lable>
<form:input path="salary" type="int" class="form-control"/>
<form:errors path="salary"></form:errors></tr>
<tr><lable><b>Contact no:</b></lable>
<form:input path="contactNo" type="text" required="required" class="form-control"/>
<form:errors path="contactNo"></form:errors></tr><br>
<tr><input type="submit" value="Add employee" class="form-control btn btn-danger"></tr>
</table>
</form:form>
</div>
</div>
</body>
</html>