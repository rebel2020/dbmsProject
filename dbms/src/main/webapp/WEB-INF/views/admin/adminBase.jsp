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
<body background="https://static1.squarespace.com/static/580f9cb9be6594a6e2a1adf5/580fb547d2b857255a229315/580fc700414fb5635eb92a71/1477497347649/bee-honey-bee-apis-insect-144252.jpeg?format=1500w" class="creative-trim-logo" style="background-repeat:no-repeat;background-position:0% 0%;background-size:100% 100%;">
<div>
<nav class="navbar navbar-inverse">
<div class="container-fluid">
<div class="" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><button type="button" class="btn btn-default btn-sm navbar-btn">
          <a href="/dbms/admin"><span class="glyphicon glyphicon-home"></span> Home</a>
        </button></li> 
      </ul>
		<ul class="nav navbar-nav">
                <li><a href="/dbms/admin/employees">Employees</a></li>
                <li><a href="/dbms/admin/items">Store</a></li>
                <li><a href="/dbms/aboutus">About Us</a></li>
                <li><a href="/dbms/admin/users">Customers</a></li>
            </ul>
            
      <ul class="nav navbar-nav">
      	<li><button class="btn btn-default btn-sm navbar-btn"><a href="/dbms/admin/employees"><span class="glyphicon glyphicon-user"></span>Employees</a></button></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
      	<li><button class="btn btn-default  navbar-btn"><a href="/dbms/logout"><span class="glyphicon glyphicon-log-out"></span></a></button></li>
      </ul>
      
	</div>
       </li>
      </ul>
      </div>
</div>
</div>
</nav>
</div>
</body>
</html>