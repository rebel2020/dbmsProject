<jsp:include page="admin/adminBase.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<body>
	<div class="panel panel-danger col-sm-offset-2 col-sm-8 col-sm-offset-2" style="font-size:150%">
		<div class="col-sm-6 panel-heading">
			<a href="${pageContext.request.contextPath}/admin/items"><button style="width:80%" class="btn btn-success">view all items</button></a><br><br>
	    	<a href="${pageContext.request.contextPath}/admin/additem"><button style="width:80%" class="btn btn-success">Add Item</button></a><br><br>
	    	<a href="${pageContext.request.contextPath}/admin/employees"><button style="width:80%" class="btn btn-success">All employees</button></a><br><br>
 			<a href="${pageContext.request.contextPath}/admin/addemployee"><button style="width:80%" class="btn btn-success">Add employee</button></a><br><br>
 			<a href="${pageContext.request.contextPath}/salary/records"><button style="width:80%" class="btn btn-success">Go to salary record</button></a><br><br>
		</div>
		<div class="col-sm-6 panel-heading">
			<a href="${pageContext.request.contextPath}/admin/orders"><button style="width:80%" class="btn btn-success">View orders</button></a><br><br>
	    	<a href="${pageContext.request.contextPath}/admin/offers"><button style="width:80%" class="btn btn-success">View offers</button></a><br><br>
	    	<a href="${pageContext.request.contextPath}/admin/users"><button style="width:80%" class="btn btn-success">View all users</button></a><br><br>
 			<a href="${pageContext.request.contextPath}/offline/records"><button style="width:80%" class="btn btn-success">Go to offline records</button></a><br><br>
			<a href="${pageContext.request.contextPath}/admin/bigorders"><button style="width:80%" class="btn btn-success">Go to Big orders</button>
				</div>
	
	</div>

	
	</body>
</html>
