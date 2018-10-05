<jsp:include page="employeeBase.jsp"></jsp:include>
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
<div class="panel panel-default col-sm-4" style="background-color:rgb(200,200,200)">
	<table>
	<tr>
		<td><label><b>Name:</b></label></td>
		<td><label><b>${employee.name }</b></label></td>
	</tr>
	<tr>
		<td><label><b>Working area:</b></label></td>
		<td><label><b>${employee.workingArea }</b></label></td>
	</tr>
	<tr>
		<td><label><b>Contact No.:</b></label></td>
		<td><label><b>${employee.contactNo }</b></label></td>
	</tr>
	<tr>
		<td><label><b>Salary:</b></label></td>
		<td><label><b>${employee.salary } Rs. per month</b></label></td>
	</tr>
		<tr>
		<td><label><b>Working since:</b></label></td>
		<td><label><b>${employee.joiningDate  }</b></label></td>
	</tr>
	</table>
</div>
<div class="col-sm-8">
	<label><b>Orders to be delivered:</b></label>
	<table class="table table-bordered table-striped">
		<thead>
			<th>Order Id.</th>
			<th>Address</th>
			<th>Total amount</th>
			<th>Net amount</th>
			<th>Order date</th>
			<th>Offer Applied</th>
			<th>Delivery status</th>
		</thead>
		<tbody>
			<c:forEach items="${orders }" var="order">
				<tr>
					<td>${order.orderId }</td>
					<td>${order.address }</td>
					<td>${order.amount }</td>
					<td>${order.netAmount }</td>
					<td>${order.date }</td>
					<td>${order.offerId }</td>
					<td><a href="employee/deliver/${order.orderId }"><button class="btn btn-sm btn-success">Mark as delivered</button></a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
</div>

</body>
</html>