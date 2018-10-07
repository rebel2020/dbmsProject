<jsp:include page="adminBase.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach items="${list }" var="item">
<div class="col-sm-offset-1 col-sm-10 col-sm-offset-1 panel panel-default" >
	<div class="col-sm-4" style="margin-right:2%;">
		<img alt="" src="data:image/jpeg;base64,${item.forImage }" class="img-responsive" style="height:40vh">
	</div>
	<div class="col-sm-7">
		<h1>${item.name }</h1>
		<h4>Quantity:${item.quantity }</h4>
		<h4>Pkg Date:${item.pkgDate }</h4>
	</div>
</div>
</c:forEach>

</body>
</html>