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
<div class="col-sm-pffset-1 col-sm-10 col-sm-offset-1" style="margin-top:5vh">
	<div class="col-sm-3">
		<img src='<c:url value="/resources/bulkHoney1.jpg"></c:url>' class="img-responsive">
	</div>
	<div class="col-sm-4" style="font-size:150%">
	Are you looking for bulk honey for sale? Honey Paradise has convenient gallon sized pails for sale in many different varieties and flavors. We even sell larger amounts if you want to buy in bulk. Buying honey by the gallon is a great way to save money and always have some of your favorite honey at hand when you need it.
	</div>
	<div class="col-sm-5" style="margin-top:10px">
		<img src='<c:url value="/resources/bulkHoney2.jpeg"></c:url>' class="img-responsive">
	</div>
</div>


<div class="col-sm-offset-1 col-sm-10" style="font-size:200%">
	<a href="/dbms/bigorders" style="float:left">See Bulk order history</a>
	<a href="/dbms/bigorder/placeorder" style="float:right">Buy raw honey in bulk</a>
</div>
</body>
</html>