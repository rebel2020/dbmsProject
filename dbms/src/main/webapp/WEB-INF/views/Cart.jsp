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
<h3>You don't have any item in your cart...</h3>
</c:if>
<c:if test="${not empty list }">
<h4>Total Amount is:${price }</h4>
<h4>Net price:${net_price }</h4>
<form action="order/${net_price }">
<input type="hidden" value="${offerId }" name="offerId">
<input type="submit" value="Place order">

</form>
<form action="apply_offer">
<select name="offerId" required="required">
<option hidden="" value="0">none</option>
<c:forEach items="${offers }" var="offer">
<option value="${offer.offerId }">${offer.offerName }</option>
</c:forEach>
</select>
<input type="submit" value="select offer">
</form>
</c:if>
<c:forEach items="${list }" var="item">
<div style="margin-left:10%;margin-right:10%;margin-top:3%;background-color:red;">
<table>
<tr><td>
Name:</td>
<td>${item.itemName }</td></tr>
<tr><td>Quantity:</td><td>${item.quantity }</td></tr>
<tr><td><a href="./removefromcart/${item.itemId }">Remove from cart</a>
</table></div>
</c:forEach>
</body>
</html>