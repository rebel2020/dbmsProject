<jsp:include page="base.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="panel panel-danger col-sm-offset-4 col-sm-4	">
<div class="panel-heading">
<form action="reset_password" method="post">
<input type="password" name="oldPass" class="form-control" placeholder="old password" required="required">
<input type="password" name="password" class="form-control" placeholder="new password" required="required"><br>
<input type="submit" value="reset" class="form-control">
</form>
</div>
</div>
</body>
</html>