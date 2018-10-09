<jsp:include page="base.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<body background="https://static1.squarespace.com/static/580f9cb9be6594a6e2a1adf5/580fb547d2b857255a229315/580fc700414fb5635eb92a71/1477497347649/bee-honey-bee-apis-insect-144252.jpeg?format=1500w" class="creative-trim-logo" style="background-repeat:no-repeat;background-position:0% 0%;background-size:100% 100%;">
<div class="panel panel-success col-sm-offset-4 col-sm-4 col-sm-offset-4" style="background-color:rgb(200,200,200)">
<div style="color:Blue;">
<div style="background-image:url('https://cdn2.iconfinder.com/data/icons/budicon-user/16/32-user_-_single-512.png');height: 40%; width: 40%;background-repeat:no-repeat;background-position:0% 0%;background-size:100% 100%;margin-left:33%">

</div>
<center><label style="color:green"><b>Sign up</b></label></center>	
</div>
<div>
	<label style="color:red"><b>${error }</b></label>
	<form:form method="post" modelAttribute="user" action="register">
		<form:input path="username" type="text" required="required" class="form-control" placeholder="Username" minlength="5"/> <!-- bind to user.name-->
		<form:errors path="username" />
		<form:input path="name" type="text" required="required" class="form-control" placeholder="Name"/> <!-- bind to user.name-->
		<form:errors path="name" />
		
		<form:input path="password" type="password" required="required" class="form-control" placeholder="Password" minlength="5"/> <!-- bind to user.name-->
		<form:errors path="password" />
		
		
		<form:input path="mpassword" type="password" required="required" class="form-control" placeholder="Confirm password"/> <!-- bind to user.name-->
		<form:errors path="mpassword" />
		<form:input path="contact" type="text" class="form-control" placeholder="Contact no." minlength="10"/> <!-- bind to user.name-->
		<form:errors path="contact" />
		
		<form:input path="email" type="email" required="required" class="form-control" placeholder="Email"/> <!-- bind to user.name-->
		<form:errors path="email" />
		<input onfocus="(this.type='date')" onblur="this.type='text'" id="BOB" name="DOB" class="form-control"  placeholder="Date of brirth"  required="required"/> <!-- bind to user.name-->
		<form:errors path="DOB" />
		<form:hidden path="DOB" value="${DOB }"/>
		<form:input path="address" type="text" placeholder="address" class="form-control"/> <!-- bind to user.name-->
		<form:errors path="address" />
			
			<input type="submit" value="Register" style="width:100%;color:green;"/>
					
	</form:form>
	</div>
	</div>
	</body>