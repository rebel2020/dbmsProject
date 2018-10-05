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
<c:forEach items="${list }" var="item">
<div class="panel panel-default col-sm-offset-1 col-sm-4" style="background-color:grey;font-size:18px">

Name:
${item.name }<br>
Quantity:${item.quantity }<br>
Date when packed:${item.pkgDate }<br>
Description:${item.description }<br>
</div>
</c:forEach>
</body>
</html>