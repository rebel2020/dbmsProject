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
<div class="col-sm-offset-2 col-sm-8 panel panel-default">
<c:if test="${error!=null }">
<div class="alert" style="color:red">
  ${error }
</div>
</c:if><form:form method="post" action="add_record" modelAttribute="record">
<label><b>ItemId:</b></label>
<input name="itemId"" type="text" class="form-control"/>
<label><b>Quantity:</b></label>
<input name="quantity"" type="text" class="form-control"/>
<label><b>Amount:</b></label>
<input name="amount"" type="text" class="form-control"/>
<!--  Date:<input name="date"" type="date"/> -->
<br>
<input type="submit" value="add record" class="form-control btn btn-danger">
</form:form>
</div>
</body>
</html>