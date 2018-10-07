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
<div class="col-sm-offset-3 col-sm-6 panel panel-default">
<form:form modelAttribute="offer" action="./add_offer" method="post">
<table>
<tr><label><b>Name of offer:</b></label>
<form:input path="offerName" type="text" required="required" class="form-control"/>
<form:errors path="offerName"></form:errors></tr>
<tr><label><b>Percentage Off:</b></label>
<form:input path="percentageOff" type="num" max="80" min="0" class="form-control"/>
<form:errors path="percentageOff"></form:errors>
</tr>
<br>
</table>
<input type="submit" value="Add the offer" class="form-control btn btn-success">
</form:form>
</div>
</body>
</html>