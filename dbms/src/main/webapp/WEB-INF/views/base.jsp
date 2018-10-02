<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
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
<head>HoneyWorld</head>
<body>
<nav class="navbar navbar-inverse">
<div class="container-fluid">
<div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><button type="button" class="btn btn-default btn-sm navbar-btn">
          <span class="glyphicon glyphicon-home"></span> Home
        </button></li> 
        <li class="active"><a href="#">Home</a></li>
        <li><a href="/dbms/user">Home 1</a></li>
        
        <li><a href="#">Page 3</a></li> 
      </ul>
      <ul>
       	<div class="dropdown navbar-dropdown">
	  		<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Dropdown Example
  			<span class="caret"></span></button>
 		 	<ul class="dropdown-menu">
    		<li><a href="#">HTML</a></li>
		    <li><a href="#">CSS</a></li>
    		<li><a href="#">JavaScript</a></li>
    		      <li class="navbar-item navbar-right">
        	<button type="button" class="btn btn-basic navbar-btn navbar-right"><span class="glyphicon glyphicon-user">Profile</span></button>
    		
  		</ul>
</div>
       </li>
      </ul>
      </div>
</div>
</div>
</nav>

</body>
</html>

