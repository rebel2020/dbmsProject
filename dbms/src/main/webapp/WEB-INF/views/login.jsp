<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<jsp:include page="base.jsp"></jsp:include>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<head>
<title>Custom Login Page</title>

<style>
.errorblock {
	color: #ff0000;
	background-color: #ffEEEE;
}
</style>
</head>
<div class="panel panel-success col-sm-offset-3 col-sm-6">
<div class="panel-heading col-sm-offset-1 col-sm-10 col-sm-offset-1">
<body onload='document.loginForm.j_username.focus();'>
	<h3>Login</h3>
		<%
		String errorString = (String) request.getAttribute("error");
		if (errorString != null && errorString.trim().equals("true")) {
			out.println("<span class=\"errorblock\">Incorrect login name or password. Please try again");
		}
	%>
	<form name='loginForm' action="<c:url value='login' />" method='POST'>

		<table>
			<tr>
				<td>User:</td>
				<td><input type='text' name='username' style='width:140%' ></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type='password' name='password' style="width:140%"/></td>
			</tr>
		</table>
		<br>
		<table>
		<tr>
			<div style="width:100%"><input name="submit" type="submit" value="Login" style="width:100%;background-color:rgb(169,169,169"/></div></tr>
			<br><tr><input name="reset" type="reset" style="width:100%"/>
			</tr>
		</table>
		Don't have an account..?<br>
		<a href="register">Register here</a>
	</form>
	</div>
	</div>
</body>
</html>