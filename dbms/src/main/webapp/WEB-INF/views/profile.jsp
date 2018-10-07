<jsp:include page="base.jsp"></jsp:include>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${error }
<div class="panel panel-default col-sm-6 col-sm-offset-3">
<div class="col-sm-4">
	<c:if test="${isExist}">
		<img alt="BBB" src="data:image/jpeg;base64,${image }" style="width:13vw">
		<center><b><a href="changeprofilepic">Change profile picture</a></b></center>
	</c:if>
	<c:if test="${not isExist }">
		<img alt="" src='<c:url value="/resources/images/addProfilePic.jpg"></c:url>'  style="width:13vw">
		<center><b><a href="changeprofilepic">Upload profile picture</a></b></center>
	</c:if>
</div>
<div class="col-sm-8">
<table>
<tr><td>Name:</td><td>${user.name }</td></tr>	
<tr><td>Username:</td><td>${user.username }</td></tr>
<tr><td>Email:</td><td>${user.email }</td></tr>
<tr><td>Address:</td><td>${user.address }</td></tr>
<tr><td>contact:</td><td>${user.contact }</td></tr>
<tr><td>date of birth:</td><td>${user.DOB }</td></tr>
<tr><td><a href="./contacts">More contacts</a></td></tr>
<tr><td><a href="./edit_profile">Edit profile</a></td></tr>
<a href="profile/reset_password">Reset password</a>
</table>
</div>
</div>
</body>
</html>