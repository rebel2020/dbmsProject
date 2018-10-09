
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
<head>

</head>
<!--  <body background="https://static1.squarespace.com/static/580f9cb9be6594a6e2a1adf5/580fb547d2b857255a229315/580fc700414fb5635eb92a71/1477497347649/bee-honey-bee-apis-insect-144252.jpeg?format=1500w" class="creative-trim-logo" style="background-repeat:no-repeat;background-position:0% 0%;background-size:100% 100%;">
-->
<body>


<nav class="navbar navbar-inverse">
<div class="container-fluid">
<div class="" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><button type="button" class="btn btn-default btn-sm navbar-btn">
          <a href="${pageContext.request.contextPath}/home"><span class="glyphicon glyphicon-home"></span> Home</a>
        </button></li> 
      </ul>
		<ul class="nav navbar-nav">
            	<c:if test="${pageContext.request.userPrincipal.name != null}">
                	<li><a href="#">Dashboard</a></li>
                	<li><a href="${pageContext.request.contextPath}/orders">Orders</a></li>
            	</c:if>
            	<c:if test="${pageContext.request.userPrincipal.name == null}">
            		<li><a href="<c:url value="home" />">Home</a></li>
                </c:if>
                <li><a href="${pageContext.request.contextPath}/aboutus">About Us</a></li>
                <li><a href="${pageContext.request.contextPath}/items">Store</a></li>
            </ul>
       <c:if test="${pageContext.request.userPrincipal.name != null}">
      <ul class="nav navbar-nav">
      	<li><button class="btn btn-default btn-sm navbar-btn"><a href="${pageContext.request.contextPath}/cart"><span class="glyphicon glyphicon-shopping-cart"></span>Cart</a></button></li>
      </ul>
      </c:if>
      <c:if test="${pageContext.request.userPrincipal.name != null}">
      <ul class="nav navbar-nav actions navbar-right">
     	<li class="dropdown dropdown-right">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-user"></span></a>
          <ul class="dropdown-menu">
               <li><a href="${pageContext.request.contextPath}/profile">My profile</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="${pageContext.request.contextPath}/j_spring_security_logout">Logout</a></li>
          </ul>
        </li>
        </ul>
        </c:if>
        <c:if test="${pageContext.request.userPrincipal.name == null}">
      <ul class="nav navbar-nav actions navbar-right">
     	<li class="dropdown dropdown-right">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-user"></span></a>
          <ul class="dropdown-menu">
            <li><a href="${pageContext.request.contextPath}/login">Login</a></li>
               <li><a href="${pageContext.request.contextPath}/register">Register</a></li>
          </ul>
        </li>
        </ul>
        </c:if>
</div>
       </li>
      </ul>
      </div>
</div>
</div>
</nav>
</body>
</html>