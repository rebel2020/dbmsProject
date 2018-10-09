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
<div class="panel ">
<table id="mytable" class="table table-bordred table-striped">
<thead>
	<th>Order Id</th>
	<th>User</th>
	<th>Address</th>
	<th>Total amount</th>
	<th>Net amount</th>
	<th>Date </th>
	<th>Assign Employee</th>
	<th>Status</th>
	<th>View</th>
</thead>
</div>
<tbody>
<div class="panel-body">
<c:forEach items="${list }" var="order">
<tr>
	<td>${order.orderId }</td>
	<td>${name.name }</td>
	<td>${order.address }</td>
	<td>${order.amount }</td>
	<td>${order.netAmount }</td>
	<td>${order.date }</td>
	
	<c:if test="${order.empId ==0 }">
	<form action="assign_employee/${order.orderId }" method="post">
		<td><select class="form-control" name="empId">
			<option value="0" >select</option>
			<c:forEach items="${list1 }" var="employee">
				<option value="${employee.empId }">${employee.name }(${ employee.workingArea})</option>
			</c:forEach>
		</select></td>
		<td>
		<input type="submit" class="btn btn-xs btn-danger form-control" value="Assign Employee">
		</td>
	</form>
	</c:if>
	<c:if test="${order.empId !=0 }">
	<td>	${order.empId }</td>
	<td>
		<c:if test="${order.status==11 }">Delivered on ${order.deliveryDate	 }</c:if>
		<c:if test="${order.status!=11 }">Yet to deliver</c:if>
	</td>	
	</c:if>
	</td>
	<td><a href="./orderitems/${order.orderId }"><button class="btn btn-sm btn-success">View</button></a></td>
</tr>
</c:forEach>
</div>
</tbody>
</table>
</div>


</body>
</html>