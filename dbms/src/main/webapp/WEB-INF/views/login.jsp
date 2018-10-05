<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<jsp:include page="base.jsp"></jsp:include>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<head>
<spring:url var="style" value="/style" />
<style>
.errorblock {
	color: #ff0000;
	background-color: #ffEEEE;
}
</style>
</head>
<div class="panel panel-success col-sm-offset-4 col-sm-4">
<div style="background-image:url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwH6DalS_KpcvdezZT-tymCO2Spog0pW1g8ySWMhAPAohnxKNJ');height: 40%; width: 40%;background-repeat:no-repeat;background-position:0% 0%;background-size:100% 100%;margin-left:33%"></div>
<div class="panel-heading col-sm-offset-1 col-sm-10 col-sm-offset-1">
<body onload='document.loginForm.j_username.focus();'>
		<%
		String errorString = (String) request.getAttribute("error");
		if (errorString != null && errorString.trim().equals("true")) {
			out.println("<span class=\"errorblock\">Incorrect login name or password. Please try again");
		}
	%>
	<form name='loginForm' action="<c:url value='login' />" method='POST'>

		
				<input type='text' name='username'  class="form-control" placeholder="Username" required="required">
			
				<input type='password' name='password' class="form-control" placeholder="Password" required="required"/>
			
			
		
			<div style="width:100%"><input name="submit" type="submit" value="Login" style="width:100%;background-color:rgb(169,169,169"/></div>
			<br><input name="reset" type="reset" style="width:100%"/>
		Don't have an account..?<br>
		<a href="register">Register here</a>
	</form>
	</div>
	</div>
</body>
</html>