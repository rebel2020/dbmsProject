<jsp:include page="base.jsp"></jsp:include>
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
<div class="panel panel-danger col-sm-offset-4 col-sm-4">
	<div>
		<form:form modelAttribute="feedback" method="post">
		<textarea style="width:100%;height:20%" id="content" name="content" placeholder="Give your feedback.." required="required"></textarea>
		<form:hidden path="content" value="${content }"/>
		<form:errors path="content"></form:errors>
		<form:hidden path="userId" value="${feedback.userId }" required="required"/>
		<input type="submit" value="Submit feedback" class="form-control" style="background-color:rgb(50,200,150)">
		</form:form>
	</div>
</div>
</body>
</html>