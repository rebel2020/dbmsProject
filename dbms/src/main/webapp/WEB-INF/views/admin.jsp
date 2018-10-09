<jsp:include page="admin/adminBase.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<body>
	<div class="panel panel-danger col-sm-offset-2 col-sm-8 col-sm-offset-2" style="font-size:150%">
		<div class="col-sm-6 panel-heading">
			<a href="/dbms/admin/items"><button style="width:80%" class="btn btn-success">view all items</button></a><br><br>
	    	<a href="/dbms/admin/additem"><button style="width:80%" class="btn btn-success">Add Item</button></a><br><br>
	    	<a href="/dbms/admin/employees"><button style="width:80%" class="btn btn-success">All employees</button></a><br><br>
 			<a href="/dbms/salary/records"><button style="width:80%" class="btn btn-success">Go to salary record</button></a><br><br>
		</div>
		<div class="col-sm-6 panel-heading">
			<a href="/dbms/admin/orders"><button style="width:80%" class="btn btn-success">View orders</button></a><br><br>
	    	<a href="/dbms/admin/offers"><button style="width:80%" class="btn btn-success">View offers</button></a><br><br>
	    	<a href="/dbms/admin/users"><button style="width:80%" class="btn btn-success">View all users</button></a><br><br>
 			<a href="/dbms/offline/records"><button style="width:80%" class="btn btn-success">Go to offline records</button></a><br><br>
			<a href="/dbms/admin/bigorders"><button style="width:80%" class="btn btn-success">Go to Big orders</button>
				</div>
	
	</div>

	
	</body>
</html>
