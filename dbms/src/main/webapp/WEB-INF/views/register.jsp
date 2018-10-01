<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

	<form:form method="post" modelAttribute="user" action="register">
		<table><tr><td>
		username</td><td>
		<form:input path="username" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="username" /></td></tr>
		<tr><td>
		Name</td><td>
		<form:input path="name" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="name" /></td></tr>
		<tr><td>
		password</td><td>
		<form:input path="password" type="password" /> </td><!-- bind to user.name-->
		<td><form:errors path="password" /></td></tr>
		
		<tr><td>Confirm password</td>
		<td>
		<form:input path="mpassword" type="password" /> </td><!-- bind to user.name-->
		<td><form:errors path="mpassword" /></td></tr>
		<tr><td>
		Contact No.</td><td>
		<form:input path="contact" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="contact" /></td></tr>
		<tr><td>
		<tr><td>
		Date of birth.</td><td>
		<form:input path="DOB" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="DOB" /></td></tr>
		Address</td><td>
		<form:input path="address" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="address" /></td></tr>
		<tr>
			<td></td>
			<td><input type="submit" value="Submit" /></td>
			</tr>
		<tr><td>${error}</td></tr>
		</table>
	</form:form>