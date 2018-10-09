<jsp:include page="adminBase.jsp"></jsp:include>
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
		<th>Adhar number</th>
		<th>Confirmation</th>
		<th>Price</th>
		<th>Action</th>
		<th>Amount</th>
	</thead>
	<tbody>
		<c:forEach items="${list }" var="order">
			<tr>
				<td>${order.orderId }</td>
				<td>${order.userId }</td>
				<td>${order.bulkQuantity }</td>
				<td>${order.panNumber }</td>
				<td>${order.adharNumber }</td>
					<c:if test="${order.isConfirmed }">
					<td>Order is confirmed</td>
					</c:if>
					<c:if test="${not order.isConfirmed }">
					<td><a href="/dbms/admin/bigorder/confirm/${order.orderId }"><button>Confirm order</button></a></td>
					</c:if>
					<c:if test="${order.price==0 }">
					<form action="set_price/${order.orderId }">
					<td><input type="number" name="price" required="required" class="form-control"></td>
					<td><input type="submit" value="Enter price" class="form-control btn btn-sm btn-success"></td>
					</form>
					
					</c:if>
					<c:if test="${order.price !=0 }">
						<td>${order.price }</td>
						<td>
						<c:if test="${not order.isConfirmed }">
						<a href="/dbms/admin/edit_price/${order.orderId }"><button class="btn btn-sm btn-danger">Edit price</button></a>
						</c:if>
						<c:if test="${ order.isConfirmed }">
						<c:if test="${order.status==0 ||order.status==1}">
						<a href="/dbms/admin/bigorder/delivered/${order.orderId }"><button class="btn btn-sm btn-danger">Mark delivered</button></a>
						</c:if>
						<c:if test="${order.status==11 ||order.status==10 }">
							Delivered on ${order.date }
						</c:if>
						</c:if>
					</td>
					</c:if>
					<c:if test="${order.price==0 }">
						<td>Enter price First..</td>
					</c:if>
					<c:if test="${order.price!=0 }">
						<td>${order.amount } Rs</td>
					</c:if>
			</tr>
		</c:forEach>
	</tbody>
</table>
</div>
</body>
</html>