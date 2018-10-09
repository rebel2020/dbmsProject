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
<c:if test="${empty list }">
<div class="panel col-sm-offset-2 col-sm-8 panel-default panel-heading">
<center>	<h3>You don't have any item in your cart...</h3></center>
<center><a href="items"><button style="width:80%" class="btn btn-success">Go to our product store</button></a></center>
</div>
</c:if>
<c:if test="${not empty list }">
<div class="">
<table id="mytable" class="table table-bordred table-striped">
<thead>
	<th>Product Id</th>
	<th>Product name</th>
	<th>Weight</th>
	<th>PkgDate</th>
	<th>Price</th>
	<th>Quantity</th>
	<th>Amount</th>
	<th>Remove</th>
	<th>Availability</th>
</thead>
</div>
<tbody>
<div class="panel-body">
<c:forEach items="${list }" var="item">
<tr>
	<td>${item.itemId }</td>
	<td>${item.name }</td>
	<td>${item.weight }</td>
	<td>${item.pkgDate }</td>
	<td>${item.price }</td>
	<td>${item.cartQuantity }</td>
	<td>${item.price*item.cartQuantity }</td>
	<td><a href="/dbms/removefromcart/${item.itemId }"><button class="btn btn-danger btn-sm" >Remove</button></a></td>
	<td>
	<c:if test="${item.quantity>=item.cartQuantity }">
		Available
	</c:if>
	<c:if test="${item.quantity<item.cartQuantity }">
		Not available
	</c:if>
	</td>
</tr>
</c:forEach>
</div>
</tbody>
</table>
</div>
<h4>Total Amount is:${price }</h4>
<h4>Net price:${net_price }</h4>
<form action="pay/${net_price }">
<input type="hidden" value="${offerId }" name="offerId">
<input type="text" value="${address }" name="address">
<input type="submit" value="Place order" class="btn btn-success btn-sm">
</form>
<form action="apply_offer">
<select name="offerId" required="required">
<option hidden="" value="0">none</option>
<c:forEach items="${offers }" var="offer">
<option value="${offer.offerId }">${offer.offerName }(${offer.percentageOff } %off)</option>
</c:forEach>
</select>
<input type="submit" value="select offer">
</form>

</c:if>

</body>
</html>