<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@page session="true"%>
<html>
<body>
    <h1>Name(user) : ${name}</h1>
    <h1>Description : ${description}</h1>
    <a href="items">view all items</a><br>
    <a href="orders">Your orders</a><br>
    <a href="cart">Go to cart</a><br>
    <a href="profile">Profile</a><br>
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <h2>
            Welcome : ${user} | <a
                href="<c:url value="/j_spring_security_logout" />"> Logout</a>
        </h2>
        <h3>Hello role login works!!</h3>
    </c:if>
</body>
</html>