<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1" isELIgnored="false"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head lang="en">
    <!-- {% load static %} -->
    <meta charset="UTF-8">
    <title>Honey world</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script>
    $(document).ready(function () {
        $('.dropdown-toggle').dropdown();
    });
</script>
<html>
<head></head>
<!--  <body background="https://static1.squarespace.com/static/580f9cb9be6594a6e2a1adf5/580fb547d2b857255a229315/580fc700414fb5635eb92a71/1477497347649/bee-honey-bee-apis-insect-144252.jpeg?format=1500w" class="creative-trim-logo" style="background-repeat:no-repeat;background-position:0% 0%;background-size:100% 100%;">
-->
<body>
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="nav navbar-nav navbar-header">
			<ul class="nav navbar-nav">
				<li><a href="/dbms/employee">Home</a></li>
				<li><a href="/dbms/employee/assigned_orders">Orders</a></li>
				<li><a href="/dbms/employee/profile">Profile</a></li>
			
			</ul>
		</div>
		<ul class="nav navbar-nav navbar-right">
			<li>
				<a href="/dbms/j_spring_security_logout"><span class="glyphicon glyphicon-log-out">Logout</span></a>
			</li>
		</ul>		
	</div>
</nav>
</body>
</html>