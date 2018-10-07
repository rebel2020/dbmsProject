<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <link rel="stylesheet" href='<c:url value="/resources/css/font.css"></c:url>'>
<html>
<head>
	<link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
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
<style>
div.sticky {
    position: -webkit-sticky;
    position: sticky;
    top: 50px;
}
</style>
<style>
    @media (max-width: 1000px) {
        #test {
            display: none;
        }
    }
</style>
</head>
<body>



	<nav>
	<div class="col-sm-12" style="background-color:fffaf0;position:relative;" id="test">
		<div class="col-sm-7" style="position:relative;top:18px;">
		<div style="height:16%;width:100%" class="responsive;">
		<p style="font-family: Lobster,cursive;font-size:300%;margin-left:5%;position:relative;top:-15%" class="responsive">Honey Paradise
		</p>
		<b style="position:relative;margin-left:9%;top:-30px;overflow:hidden">Bees and Honey Business</b>
		</div>
		</div>
		<div class="col-sm-5" style="position:relative;top:18px;">
			<div class="col-sm-7">
				<div class="col-sm-1">
					<span class="glyphicon glyphicon-earphone" style="float:right;font-size:300%;color:red"></span>		
				</div>
				<div class="col-sm-11">
					<div style="position:relative;top:-42px">
						Phone:<br>
						<sub style="overflow:hidden">+91-9984739387<br><br><br>+91-9589177540</sub>
					</div>
				</div>
			
			</div>
			<div class="col-sm-5">
				<div class="col-sm-6" style="overflow:hidden;">
					<span class="glyphicon glyphicon-map-marker" style="float:right;font-size:300%;color:red"></span>
				</div>
				<div class="col-sm-6" style="font-size:80%;">
				Location:<br>
					<p>42 MS Road Kailaras,Morena (476224)</p>		
				</div>
			</div>
	
		</div>
	</div>
	</nav>
  		<div >
		<nav style="background-color:black;font-size:150%" >
		<div class="container-fluid">
			<ul class="nav navbar-nav" style="display:inline">
				<li style="top:-5px;"><a href="/dbms/home"><span class="glyphicon glyphicon-home">Home</span></a></li>
				<li style="top:-5px;"><a href="/dbms/cart"><span class="glyphicon glyphicon-shopping-cart">Mycart</span></a></li>
				<li ><a href="/dbms/orders"><span>Orders</span></a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
			<c:if test="${pageContext.request.userPrincipal.name != null}">
				<li style="top:-5px;"><a href="/dbms/profile"><span class="glyphicon glyphicon-user">Profile</span></a></li>
				<li style="top:-5px;"><a href="/dbms/j_spring_security_logout"><span class="glyphicon glyphicon-log-out">Logout</span></a></li>
			</c:if>
			<c:if test="${pageContext.request.userPrincipal.name == null}">
				<li class="dropdown dropdown-right" style="top:-5px;">
          		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-user">Login/SignUp</span></a>
    	      <ul class="dropdown-menu">
        	    <li><a href="/dbms/login">Login</a></li>
               <li><a href="/dbms/register">Register</a></li>
          	</ul>
	        </li>
			</c:if>
			</ul>
			<ul class="nav navbar-nav navbar-right" style="margin-right:10%">
				<li "><a href="/dbms/aboutus"><span>About us</span></a></li>
			</ul>

		</div>
	</nav>	
	</div>
	

</body>
</html>
