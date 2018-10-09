<jsp:include page="base.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
<div style="color:red">
	<c:if test="${error!=null }">
		${error }
	</c:if>
</div>
<div style="color:green">
	<c:if test="${success!=null }">
		${success }
	</c:if>
</div>
<table class="table table-bordred table-striped">
	<thead>
		<th>OrderId</th>
		<th>UserId</th>
		<th>Quantity</th>
		<th>Pan number</th>
		<th>Adhar </th>
		<th>Address</th>
		<th>Confirmation</th>
		<th>Price</th>
		<th>Amount</th>
		<th>Action</th>
		<th>Edit details</th>
	</thead>
	<tbody>
		<c:forEach items="${list }" var="order">
			<tr>
				<td>${order.orderId }</td>
				<td>${order.userId }</td>
				<td>${order.bulkQuantity }</td>
				<td>${order.panNumber }</td>
				<td>${order.adharNumber }</td>
				<td>
				<p style="font-size:70%">	${order.address }</p>
				</td>
				<td>
					<c:if test="${order.isConfirmed }">
					Confirmed
					</c:if>
					<c:if test="${not order.isConfirmed }">
					Yet to be confirmed
					</c:if>
				</td>
				<td>
				<c:if test="${order.price!=0 }">
					${order.price }
				</c:if>
				<c:if test="${order.price==0 }">
					Not available
				</c:if>
				</td>
				<td>
				<c:if test="${order.price!=0 }">
					${order.amount }
				</c:if>
				<c:if test="${order.price==0 }">
					Not available
				</c:if>
				</td>
				<td>
				<c:if test="${order.isConfirmed }">
				<c:if test="${order.status%2==0 }">
					<a href="/dbms/bigorder/delivered/${order.orderId}"><button class="btn btn-success">Mark delivered</button></a>
				</c:if>
				<c:if test="${order.status%2==1 }">
					<c:if test="${order.status==11 }">
						Delivered on ${order.date }
					</c:if>
					<c:if test="${order.status!=11 }">
						delivered<span style="font-size:50%">(Admin action pending)</span> 
					</c:if>
				</c:if>
				</c:if>
				<c:if test="${not order.isConfirmed }">
				Not available
				</c:if>
				</td>
				<td>
					<c:if test="${order.isConfirmed }">
						Not permitted
					</c:if>
					<c:if test="${not order.isConfirmed }">
						<a href="bigorder/fill_details/${order.orderId }"><button class="btn btn-danger btn-sm">Edit</button></a>
					</c:if>		
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
</div>
</body>
</html>